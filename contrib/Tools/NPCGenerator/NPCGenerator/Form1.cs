using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace NPCGenerator
{
    public partial class Form1 : Form
    {
        MySqlConnection connection = null;

        private void CreateConnection()
        {
            if (connection == null)
            {
                string con = "Server=" + hostBox.Text + "; Port=" + portBox.Text + "; Database=" + worldBox.Text + "; Uid=" + loginBox.Text + "; Pwd=" + passBox.Text + ";";

                try
                {
                    connection = new MySqlConnection(con);
                    connection.Open();
                }
                catch (MySqlException e)
                {
                    MessageBox.Show("Connection wasn't succesful. Error: " + e.Number + "\n\n" + e.ToString());
                    connection = null;
                }
            }
        }

        public Form1()
        {
            InitializeComponent();
        }

        private void fileButt_Click(object sender, EventArgs e)
        {
            openFileDialog.ShowDialog();
        }

        private void openFileDialog_FileOk(object sender, CancelEventArgs e)
        {
            charFileName.Text = openFileDialog.FileName;
        }

        private void generateSound_CheckedChanged(object sender, EventArgs e)
        {
            if (generateSound.CheckState == CheckState.Checked)
                soundID.Enabled = false;
            else
                soundID.Enabled = true;
        }

        private void TestConnection()
        {
            string con = "Server=" + hostBox.Text + ";Port=" + portBox.Text + ";Database=" + worldBox.Text + ";Uid=" + loginBox.Text + ";Pwd=" + passBox.Text + ";";

            try
            {
                connection = new MySqlConnection(con);
                connection.Open();
                MessageBox.Show("Connection OK.");
            }
            catch (Exception e)
            {
                connection = null;
                MessageBox.Show("Connection wasn't succesful. Error:\n\n" + e.ToString());
            }
            finally
            {
                if (connection!= null)
                    connection.Close();
            }
        }

        private void testButt_Click(object sender, EventArgs e)
        {
            CreateConnection();
            if (connection != null)
                MessageBox.Show("Connection was successful.");
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            if (!File.Exists("CreatureDisplayInfo.dbc.csv"))
                MessageBox.Show("CreatureDisplayInfo.dbc.csv was not found. Generator won't work without it! Get your DBC's CSV and place it into Generator's folder.");
            if (!File.Exists("CreatureDisplayInfoExtra.dbc.csv"))
                MessageBox.Show("CreatureDisplayInfoExtra.dbc.csv was not found. Generator won't work without it! Get your DBC's CSV and place it into Generator's folder.");
            GetLastFreeIDs();
        }

        private void textureButt_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
        }

        private void openFileDialog1_FileOk(object sender, CancelEventArgs e)
        {
            string fullName = openFileDialog1.FileName;
            string fileName = fullName.Substring(fullName.LastIndexOf('\\') + 1);
            textureName.Text = fileName.Substring(0, fileName.LastIndexOf('.'));
        }

        private void lastFreeIDButt_Click(object sender, EventArgs e)
        {
            GetLastFreeIDs();
        }

        private void GetLastFreeIDs()
        {
            if (File.Exists("CreatureDisplayInfo.dbc.csv"))
            {
                try
                {
                    StreamReader sr = new StreamReader("CreatureDisplayInfo.dbc.csv");
                    string line;
                    int max = 0;

                    while ((line = sr.ReadLine()) != null)
                    {
                        var row = line.Split(',');
                        if (row.Length > 1)
                            if (row[0] != "long")
                                if (int.Parse(row[0]) > max)
                                    max = int.Parse(row[0]);
                    }
                    sr.Close();
                    displayID.Value = max + 1;
                }
                catch (Exception e)
                {
                    MessageBox.Show("Checking of CreatureDisplayInfo.dbc.csv has failed. Isn't file corrupted?\n" + e.ToString());
                }
            }

            if (File.Exists("CreatureDisplayInfoExtra.dbc.csv"))
            {
                try
                {
                    StreamReader sr = new StreamReader("CreatureDisplayInfoExtra.dbc.csv");
                    string line;
                    int max = 0;

                    while ((line = sr.ReadLine()) != null)
                    {
                        var row = line.Split(',');
                        if (row.Length > 1)
                            if (row[0] != "long")
                                if (int.Parse(row[0]) > max)
                                    max = int.Parse(row[0]);
                    }
                    sr.Close();
                    extraID.Value = max + 1;
                }
                catch (Exception e)
                {
                    MessageBox.Show("Checking of CreatureDisplayInfoExtra.dbc.csv has failed. Isn't file corrupted?\n" + e.ToString());
                }
            }

            #region Previously used for getting NPC sounds for obtaining random sound generator.
            /*
            StreamReader sra = new StreamReader("CreatureDisplayInfo.dbc.csv");
            StreamWriter swr = new StreamWriter("output.txt");
            List<int[]> results = new List<int[]>();
            string lineS;
            while ((lineS = sra.ReadLine()) != null)
            {
                var row = lineS.Split(',');
                if (row.Length > 1)
                    if (row[0] != "long")
                        Count(int.Parse(row[1]), int.Parse(row[12]), results);
            }
            results.Sort((x, y) => x[0].CompareTo(y[0]));
            foreach (int[] result in results)
            {
                if (result[2] > 0 && result[1] > 1)
                    swr.WriteLine(result[0] + ": " + result[1] + ", " + result[2] + "x");
            }
            sra.Close();
            swr.Close();*/
            #endregion
        }

        /*private void Count(int model, int sound, List<int[]> results)
        {
            if (results.Count == 0)
            {
                var tmp = new int[3];
                tmp[0] = model; tmp[1] = sound; tmp[2] = 1;
                results.Add(tmp);
            }
            else
            {
                var foundList = new List<int[]>();
                foreach (int[] result in results)
                {
                    if (result[0] == model)
                        foundList.Add(result);
                }
                if (foundList.Count == 0)
                {
                    var tmp = new int[3];
                    tmp[0] = model; tmp[1] = sound; tmp[2] = 1;
                    results.Add(tmp);
                }
                else
                {
                    int[] found = null;
                    foreach (int[] result in foundList)
                    {
                        if (result[1] == sound)
                            found = result;
                    }
                    if (found == null)
                    {
                        var tmp = new int[3];
                        tmp[0] = model; tmp[1] = sound; tmp[2] = 1;
                        results.Add(tmp);
                    }
                    else
                        found[2]++;
                }
            }
        }*/

        private int ItDisID(int itemEntry)
        {
            int displayID = 0;
            if (connection != null)
            {
                string commText = "SELECT displayid FROM item_template WHERE entry = " + itemEntry + ";";
                MySqlCommand comm = new MySqlCommand(commText, connection);
                MySqlDataReader r = comm.ExecuteReader();

                if (r.Read())
                    displayID = int.Parse("" + r[0]);
                r.Close();
            }
            return displayID;
        }

        private void generateButt_Click(object sender, EventArgs e)
        {
            CreateConnection();
            if (textureName.Text != "")
            {
                Character c = new Character(charFileName.Text);
                if (c.isOK)
                {
                    if (generateSound.CheckState == CheckState.Checked)
                    {
                        if (c.randomSounds.Count == 0)
                            c.sound = 0;
                        else
                            c.sound = c.randomSounds[new Random().Next(0, c.randomSounds.Count - 1)];
                    }
                    else
                        c.sound = (int)soundID.Value;

                    if (connection != null)
                    {
                        StreamWriter dis = new StreamWriter("CreatureDisplayInfo.dbc.csv", true);
                        StreamWriter disEx = new StreamWriter("CreatureDisplayInfoExtra.dbc.csv", true);
                        StreamWriter sqlBack = new StreamWriter("SqlBackup.sql", true);

                        try
                        {
                            disEx.WriteLine("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},0,\"{19}\","
                                , extraID.Value, c.race, c.gender, c.skin, c.face, c.hairStyle, c.hairColor, c.facialStyle, ItDisID(c.head), ItDisID(c.shoulder), ItDisID(c.shirt)
                                , ItDisID(c.chest), ItDisID(c.belt), ItDisID(c.legs), ItDisID(c.boot), ItDisID(c.bracer), ItDisID(c.gloves), ItDisID(c.tabard), ItDisID(c.cape), textureName.Text);
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Table item_template could not be accessed for getting item displayIDs. Cancelling process... Error message:\n\n" + ex.ToString());
                            disEx.Close();
                            dis.Close();
                            sqlBack.Close();
                            return;
                        }
                        dis.WriteLine("{0},{1},0,{2},{3},{4},\"\",\"\",\"\",\"\",0,0,{5},0,0x0,0,", displayID.Value, c.modelID, extraID.Value, scale.Value, opacity.Value, c.sound);
                        dis.Close();
                        disEx.Close();

                        string modelInfo = "";
                        string template = "";
                        if (generateDatabase.Checked)
                        {
                            modelInfo = "INSERT";
                            if (useReplace.Checked)
                                modelInfo = "REPLACE";
                            modelInfo += " INTO " + modelBox.Text + "(DisplayID, boundingRadius, combatReach, gender, DisplayID_other_gender) VALUES ("
                                + displayID.Value + ", 0.35, 1.5, " + c.gender + ", " + alternativeID.Value + ");";
                            sqlBack.WriteLine(modelInfo);
                        }
                        if (generateCreature.Checked)
                        {
                            template = "INSERT";
                            if (useReplace.Checked)
                                template = "REPLACE";
                            template += " INTO " + templateBox.Text + "(entry, modelid1, `name`, subname) VALUES (" + (startIDBox.Value + displayID.Value) + ", " + displayID.Value
                                + ", \"" + nameBox.Text + "\", " + "\"Generated NPC\");";
                            sqlBack.WriteLine(template);
                        }
                        sqlBack.WriteLine("");
                        sqlBack.Close();


                        if (generateDatabase.Checked)
                        {
                            var modelComm = new MySqlCommand(modelInfo, connection);
                            try
                            {
                                modelComm.ExecuteNonQuery();
                            }
                            catch (Exception ex)
                            {
                                MessageBox.Show(ex.ToString());
                                return;
                            }
                        }
                        if (generateCreature.Checked)
                        {
                            var templateComm = new MySqlCommand(template, connection);
                            try
                            {
                                templateComm.ExecuteNonQuery();
                            }
                            catch (Exception ex)
                            {
                                MessageBox.Show(ex.ToString());
                                return;
                            }
                        }
                    }
                    else
                        return;
                    displayID.Value++;
                    extraID.Value++;
                    MessageBox.Show("All was successfully done!");
                }
            }
            else
                MessageBox.Show("Set texture name. Without it creature won't work and will cause client crashes.");
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            try
            {
                connection.Close();
            }
            catch { }
        }
    }

    public class Character
    {
        public bool isOK = true;
        
        public string model;
        public int modelID = 0;

        public int race;
        public int gender;

        public int skin;
        public int face;
        public int hairColor;
        public int hairStyle;
        public int facialStyle;
        public int facialColor;

        public int head;
        public int unk;
        public int shoulder;
        public int boot;
        public int belt;
        public int shirt;
        public int legs;
        public int chest;
        public int bracer;
        public int gloves;
        public int right;
        public int left;
        public int cape;
        public int tabard;
        public int quiver;

        public List<int> randomSounds;
        public int sound;

        public Character(string file)
        {
            try
            {
                StreamReader sr = new StreamReader(file);

                model = sr.ReadLine();

                var raceGen = sr.ReadLine().Split(' ');
                race = int.Parse(raceGen[0]);
                gender = int.Parse(raceGen[1]);

                if (gender == 0)
                {
                    switch (race)
                    {
                        case 1: modelID = 49; break;
                        case 2: modelID = 51; break;
                        case 3: modelID = 53; break;
                        case 4: modelID = 55; break;
                        case 5: modelID = 57; break;
                        case 6: modelID = 59; break;
                        case 7: modelID = 182; break;
                        case 8: modelID = 185; break;
                        case 9: modelID = 831; break;
                        case 10: modelID = 2208; break;
                        case 11: modelID = 2248; break;
                        case 12: modelID = 2299; break;
                        case 13: modelID = 2353; break;
                        case 14: modelID = 2367; break;
                        case 15: modelID = 2369; break;
                        case 16: modelID = 2594; break;
                        case 17: modelID = 2604; break;
                        case 18: modelID = 2613; break;
                        case 19: modelID = 2891; break;
                        case 20: modelID = 2940; break;
                        case 21: modelID = 2942; break;
                    }
                }
                if (gender == 1)
                {
                    switch (race)
                    {
                        case 1: modelID = 50; break;
                        case 2: modelID = 52; break;
                        case 3: modelID = 54; break;
                        case 4: modelID = 56; break;
                        case 5: modelID = 58; break;
                        case 6: modelID = 60; break;
                        case 7: modelID = 183; break;
                        case 8: modelID = 186; break;
                        case 9: modelID = 832; break;
                        case 10: modelID = 2209; break;
                        case 11: modelID = 2250; break;
                        case 12: modelID = 2298; break;
                        case 13: modelID = 2354; break;
                        case 14: modelID = 2368; break;
                        case 15: modelID = 2370; break;
                        case 16: modelID = 2595; break;
                        case 17: modelID = 2605; break;
                        case 18: modelID = 2614; break;
                        case 19: modelID = 2892; break;
                        case 20: modelID = 2941; break;
                        case 21: modelID = 2943; break;
                    }
                }

                switch (modelID)
                {
                    case 49: randomSounds = new List<int>() { 48, 49, 50, 114, 115, 116 }; break;
                    case 50: randomSounds = new List<int>() { 45, 46, 47, 111, 112, 113 }; break;
                    case 51: randomSounds = new List<int>() { 60, 61, 62, 126, 127, 128 }; break;
                    case 52: randomSounds = new List<int>() { 56, 57, 58, 123, 124, 125 }; break;
                    case 53: randomSounds = new List<int>() { 36, 37, 38, 98, 99, 100 }; break;
                    case 54: randomSounds = new List<int>() { 33, 34, 35, 95, 96, 97 }; break;
                    case 55: randomSounds = new List<int>() { 54, 55, 59, 120, 121, 122 }; break;
                    case 56: randomSounds = new List<int>() { 51, 52, 53, 117, 118, 119 }; break;
                    case 57: randomSounds = new List<int>() { 82, 83, 84, 144, 145, 146 }; break;
                    case 58: randomSounds = new List<int>() { 79, 80, 81, 141, 142, 143 }; break;
                    case 59: randomSounds = new List<int>() { 67, 68, 69, 132, 133, 134 }; break;
                    case 60: randomSounds = new List<int>() { 70, 71, 72, 129, 130, 131 }; break;
                    case 182: randomSounds = new List<int>() { 42, 43, 44, 104, 105, 106 }; break;
                    case 183: randomSounds = new List<int>() { 39, 40, 41, 101, 102, 103 }; break;
                    case 185: randomSounds = new List<int>() { 76, 77, 78, 138, 139, 140 }; break;
                    case 186: randomSounds = new List<int>() { 73, 74, 75, 135, 136, 137 }; break;
                    case 831: randomSounds = new List<int>() { 64, 65, 66, 108, 109, 110 }; break;
                    case 832: randomSounds = new List<int>() { 63, 107 }; break;
                    case 2208: randomSounds = new List<int>() { 195, 196, 197, 198, 199, 200 }; break;
                    case 2209: randomSounds = new List<int>() { 189, 190, 191, 192, 193, 194 }; break;
                    case 2248: randomSounds = new List<int>() { 207, 208, 209, 210, 211, 212 }; break;
                    case 2250: randomSounds = new List<int>() { 201, 202, 203, 204, 205, 206 }; break;
                    case 2298: randomSounds = new List<int>() { 56, 57, 58, 123, 124, 125 }; break;
                    case 2299: randomSounds = new List<int>() { 60, 61, 62, 126, 127, 128 }; break;
                    case 2353: randomSounds = new List<int>() { }; break;
                    case 2354: randomSounds = new List<int>() { }; break;
                    case 2367: randomSounds = new List<int>() { 214, 215, 216, 217 }; break;
                    case 2368: randomSounds = new List<int>() { }; break;
                    case 2369: randomSounds = new List<int>() { }; break;
                    case 2370: randomSounds = new List<int>() { }; break;
                    case 2594: randomSounds = new List<int>() { }; break;
                    case 2595: randomSounds = new List<int>() { }; break;
                    case 2604: randomSounds = new List<int>() { 258, 259, 260, 261, 262, 263 }; break;
                    case 2605: randomSounds = new List<int>() { }; break;
                    case 2613: randomSounds = new List<int>() { 76, 77, 78, 138, 139, 140 }; break;
                    case 2614: randomSounds = new List<int>() { 73, 74, 75, 135, 136, 137 }; break;
                    case 2891: randomSounds = new List<int>() { 67, 68, 69, 132, 133, 134 }; break;
                    case 2892: randomSounds = new List<int>() { 70, 71, 72, 129, 130, 131 }; break;
                    case 2940: randomSounds = new List<int>() { }; break;
                    case 2941: randomSounds = new List<int>() { }; break;
                    case 2942: randomSounds = new List<int>() { 76, 77, 78, 138, 139, 140 }; break;
                    case 2943: randomSounds = new List<int>() { 73, 74, 75, 135, 136, 137 }; break;
                }
                if (randomSounds == null)
                    randomSounds = new List<int>();

                var visual = sr.ReadLine().Split(' ');
                skin = int.Parse(visual[0]);
                face = int.Parse(visual[1]);
                hairColor = int.Parse(visual[2]);
                hairStyle = int.Parse(visual[3]);
                facialStyle = int.Parse(visual[4]);
                facialColor = int.Parse(visual[5]);

                head = int.Parse(sr.ReadLine());
                unk = int.Parse(sr.ReadLine());
                shoulder = int.Parse(sr.ReadLine());
                boot = int.Parse(sr.ReadLine());
                belt = int.Parse(sr.ReadLine());
                shirt = int.Parse(sr.ReadLine());
                legs = int.Parse(sr.ReadLine());
                chest = int.Parse(sr.ReadLine());
                bracer = int.Parse(sr.ReadLine());
                gloves = int.Parse(sr.ReadLine());
                right = int.Parse(sr.ReadLine());
                left = int.Parse(sr.ReadLine());
                cape = int.Parse(sr.ReadLine());
                tabard = int.Parse(sr.ReadLine());
                quiver = int.Parse(sr.ReadLine());

                sr.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show("Error while trying to parse character data from given .chr file.:\n\n" + e.ToString());
                isOK = false;
            }
        }
    }
}
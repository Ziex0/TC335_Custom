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

namespace GobGenerator
{
    public partial class Form1 : Form
    {
        MySqlConnection connection = null;

        public Form1()
        {
            InitializeComponent();
        }

        private void CreateConnection()
        {
            if (connection == null)
            {
                string con = "Server=" + host.Text + "; Port=" + port.Text + "; Database=" + database.Text + "; Uid=" + login.Text + "; Pwd=" + password.Text + ";";

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

        private void fileButt_Click(object sender, EventArgs e)
        {
            openFileDialog.ShowDialog();
        }

        private void openFileDialog_FileOk(object sender, CancelEventArgs e)
        {
            filepath.Text = openFileDialog.FileName;
        }

        private void testButt_Click(object sender, EventArgs e)
        {
            CreateConnection();
            if (connection != null)
                MessageBox.Show("Connection was successful.");
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            GetLastFreeID();
        }

        private void GetLastFreeID()
        {
            if (File.Exists("GameObjectDisplayInfo.dbc.csv"))
            {
                try
                {
                    StreamReader sr = new StreamReader("GameObjectDisplayInfo.dbc.csv");
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
                    startDisplay.Value = max + 1;
                }
                catch (Exception e)
                {
                    MessageBox.Show("Checking of GameObjectDisplayInfo.dbc.csv has failed. Isn't file corrupted?\n" + e.ToString());
                }
            }
            else
                MessageBox.Show("GameObjectDisplayInfo.dbc.csv was not found. Convert your DBC to CSV and place it into GobGenerator's directory.");
        }

        private void genButt_Click(object sender, EventArgs e)
        {
            CreateConnection();

            if (File.Exists(filepath.Text) && File.Exists("GameObjectDisplayInfo.dbc.csv") && connection != null)
            {
                List<Gobject> gobs = new List<Gobject>();
                //try
                {
                    StreamReader sr = new StreamReader(filepath.Text);
                    string line;

                    while ((line = sr.ReadLine()) != null)
                    {
                        bool isModel = false;
                        if (line.ToLower().EndsWith(".m2"))
                            isModel = true;
                        if (line.ToLower().EndsWith(".wmo"))
                        {
                            int n;
                            if (!(line.Substring(line.Length - 8, 1) == "_" && int.TryParse(line.Substring(line.Length - 7, 3), out n)))
                                isModel = true;
                        }
                        if (isModel)
                        {
                            gobs.Add(new Gobject((int)(startDisplay.Value + startEntry.Value), (int)startDisplay.Value, line));
                            startDisplay.Value++;
                        }
                    }
                }
                /*catch (Exception ex)
                {
                    MessageBox.Show("There was an error while listfile was being readen. Error:\n\n" + ex.ToString());
                    return;
                }*/

                try
                {
                    StreamWriter swDBC = new StreamWriter("GameObjectDisplayInfo.dbc.csv", true);
                    foreach (Gobject gob in gobs)
                        swDBC.WriteLine("{0},\"{1}\",0,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,0.0,0.0,0,", gob.displayID, gob.path);
                    swDBC.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("There was an error while results were being written into DBC's CSV. Error:\n\n" + ex.ToString());
                    return;
                }

                StreamWriter swSQL = new StreamWriter("SqlBackup.sql");
                StreamWriter swSQLerror = new StreamWriter("SqlErrors.txt");
                string query = "";
                int errors = 0;
                foreach (Gobject gob in gobs)
                {
                    if (insert.Checked)
                        query = "INSERT INTO ";
                    else
                        query = "REPLACE INTO ";
                    query += table.Text + " (entry, type, displayId, name) VALUES (" + gob.entry + ", " + gob.type + ", " + gob.displayID + ", \"" + prefix.Text + gob.name + postfix.Text + "\");";
                    try
                    {
                        var comm = new MySqlCommand(query, connection);
                        comm.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        swSQL.WriteLine(query);
                        swSQLerror.WriteLine(ex.Message);
                        errors++;
                    }
                }
                swSQL.Close();
                swSQLerror.Close();

                if (errors == 0)
                    MessageBox.Show("Everything was successfully done.");
                else
                    MessageBox.Show("There were " + errors + " errors when gameobjects were being inserted/replaced into database. SqlBackup.sql contains queries which were not successful, SqlErrors.txt contains error messages.");
            }
            else
                MessageBox.Show("Error: It seems that one of the required files (listfile or DBC's CSV) could not be found or you aren't connected to databse.");
        }
    }

    public class Gobject
    {
        public string name;
        public int entry;
        public int displayID;
        public string path;
        public int type;

        public Gobject(int entry, int displayID, string path)
        {
            this.entry = entry;
            this.displayID = displayID;
            if (path.ToLower().EndsWith(".m2"))
            {
                this.path = path.Substring(0, path.LastIndexOf('.')) + ".mdx";
                name = path.Substring(path.LastIndexOf('\\') + 1);
                type = 5;
            }
            else
            {
                this.path = path;
                name = path.Substring(path.LastIndexOf('\\') + 1);
                type = 14;
            }
        }
    }
}

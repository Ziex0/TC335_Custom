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

namespace ItemDBCToDB
{
    public partial class Form1 : Form
    {
        MySqlConnection connection = null;

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

        public Form1()
        {
            InitializeComponent();
        }

        private void selectButt_Click(object sender, EventArgs e)
        {
            openFileDialog.ShowDialog();
        }

        private void openFileDialog_FileOk(object sender, CancelEventArgs e)
        {
            filePath.Text = openFileDialog.FileName;
        }

        private void testButt_Click(object sender, EventArgs e)
        {
            CreateConnection();
            if (connection != null)
                MessageBox.Show("Connection successful.");
        }

        private void okButt_Click(object sender, EventArgs e)
        {
            CreateConnection();
            if (connection != null)
            {
                List<int> onServer = new List<int>();
                try
                {
                    string commText = "SELECT entry FROM " + table.Text + ";";
                    MySqlCommand comm = new MySqlCommand(commText, connection);
                    MySqlDataReader r = comm.ExecuteReader();
                    while (r.Read())
                        onServer.Add(int.Parse("" + r[0]));
                    r.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Item template table apparently could not be opened.\n\n" + ex.ToString());
                    return;
                }

                List<string> inserts = new List<string>();
                try
                {
                    StreamReader sr = new StreamReader(filePath.Text);
                    string line;

                    while ((line = sr.ReadLine()) != null)
                    {
                        var row = line.Split(',');
                        if (row.Length > 1)
                            if (row[0] != "long")
                                if (!onServer.Contains(int.Parse("" + row[0])))
                                {
                                    onServer.Add(int.Parse("" + row[0]));
                                    string insert = "INSERT INTO " + table.Text + "(entry, class, subclass, SoundOverrideSubclass, material, displayID, InventoryType, sheath, name) VALUES ("
                                        + row[0] + ", " + row[1] + ", " + row[2] + ", " + row[3] + ", " + row[4] + ", " + row[5] + ", " + row[6] + ", " + row[7] + ", " + "'Z:DBCtoDB Generated Item');";
                                    inserts.Add(insert);
                                }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Given item.dbc CSV file was not succsefully readen.\n\n" + ex.ToString());
                    return;
                }

                foreach (string insert in inserts)
                {
                    var modelComm = new MySqlCommand(insert, connection);
                    try
                    {
                        modelComm.ExecuteNonQuery();
                    }
                    catch { }
                }
                MessageBox.Show("Everything was successfully done.");
            }
        }
    }
}

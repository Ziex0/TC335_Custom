using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.IO;
using System.Globalization;

namespace ClientItem
{
    public partial class Form1 : Form
    {
        MySqlConnection connection = null;

        public Form1()
        {
            InitializeComponent();
        }

        private void testButt_Click(object sender, EventArgs e)
        {
            TestConnection();
        }

        private void okButt_Click(object sender, EventArgs e)
        {
            DownloadData();
        }

        private void CreateConnection()
        {
            if (connection == null)
            {
                string con = "Server=" + hostBox.Text + "; Port=" + portBox.Text + "; Database=" + databaseBox.Text + "; Uid=" + loginBox.Text + "; Pwd=" + passBox.Text + ";";

                try
                {
                    connection = new MySqlConnection(con);
                    connection.Open();
                }
                catch (MySqlException e)
                {
                    MessageBox.Show("Keine Verbindung möglich. Error: " + e.Number + "\n\n" + e.ToString());
                    connection = null;
                }
            }
        }

        private void TestConnection()
        {
            CreateConnection();
            if (connection != null)
                MessageBox.Show("Verbindung erfolgreich.");
        }

        private void DownloadData()
        {
            CreateConnection();

            if (connection != null)
            {
                StreamWriter swDBC = new StreamWriter("Item.dbc.csv", false);
                StreamWriter swWMV = new StreamWriter("items.csv", false);
                swDBC.WriteLine("long,long,long,flags,long,long,long,long,");
                try
                {
                    string commText = "SELECT entry, class, subclass, SoundOverrideSubclass, Material, displayid, InventoryType, sheath, Quality, name FROM " + tableBox.Text + " ORDER BY entry ASC;";
                    MySqlCommand command = new MySqlCommand(commText, connection);
                    MySqlDataReader r = command.ExecuteReader();

                    while (r.Read())
                    {
                        var normalizedString = ("" + r[9]).Normalize(NormalizationForm.FormD);
                        var stringBuilder = new StringBuilder();

                        foreach (var c in normalizedString)
                        {
                            var unicodeCategory = CharUnicodeInfo.GetUnicodeCategory(c);
                            if (unicodeCategory != UnicodeCategory.NonSpacingMark)
                            {
                                stringBuilder.Append(c);
                            }
                        }

                        swDBC.WriteLine("{0},{1},{2},{3},{4},{5},{6},{7},", r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7]);
                        swWMV.WriteLine("{0},{1},{2}", r[0], r[8], stringBuilder.ToString().Normalize(NormalizationForm.FormC));
                    }
                }
                catch (Exception e)
                {
                    MessageBox.Show("Error has occured:\n" + e.Message);
                }

                MessageBox.Show("Alle benötigten Informationen wurden erfolgreich geladen.");
                swWMV.Close();
                swDBC.Close();
                connection.Close();
            }
        }
    }
}

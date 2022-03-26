namespace GobGenerator
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.postfix = new System.Windows.Forms.TextBox();
            this.prefix = new System.Windows.Forms.TextBox();
            this.startEntry = new System.Windows.Forms.NumericUpDown();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.startDisplay = new System.Windows.Forms.NumericUpDown();
            this.port = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.table = new System.Windows.Forms.TextBox();
            this.database = new System.Windows.Forms.TextBox();
            this.password = new System.Windows.Forms.TextBox();
            this.login = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.host = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.filepath = new System.Windows.Forms.TextBox();
            this.fileButt = new System.Windows.Forms.Button();
            this.testButt = new System.Windows.Forms.Button();
            this.genButt = new System.Windows.Forms.Button();
            this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.label12 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.insert = new System.Windows.Forms.RadioButton();
            this.replace = new System.Windows.Forms.RadioButton();
            ((System.ComponentModel.ISupportInitialize)(this.startEntry)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.startDisplay)).BeginInit();
            this.SuspendLayout();
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(269, 273);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(87, 13);
            this.label8.TabIndex = 22;
            this.label8.Text = "Postfix of names:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(269, 247);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(82, 13);
            this.label7.TabIndex = 21;
            this.label7.Text = "Prefix of names:";
            // 
            // postfix
            // 
            this.postfix.Location = new System.Drawing.Point(362, 270);
            this.postfix.Name = "postfix";
            this.postfix.Size = new System.Drawing.Size(175, 20);
            this.postfix.TabIndex = 20;
            // 
            // prefix
            // 
            this.prefix.Location = new System.Drawing.Point(362, 244);
            this.prefix.Name = "prefix";
            this.prefix.Size = new System.Drawing.Size(175, 20);
            this.prefix.TabIndex = 17;
            // 
            // startEntry
            // 
            this.startEntry.Location = new System.Drawing.Point(105, 218);
            this.startEntry.Maximum = new decimal(new int[] {
            999999999,
            0,
            0,
            0});
            this.startEntry.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.startEntry.Name = "startEntry";
            this.startEntry.Size = new System.Drawing.Size(161, 20);
            this.startEntry.TabIndex = 19;
            this.startEntry.Value = new decimal(new int[] {
            400000,
            0,
            0,
            0});
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(12, 220);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(58, 13);
            this.label6.TabIndex = 18;
            this.label6.Text = "Start entry:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(12, 194);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(78, 13);
            this.label5.TabIndex = 17;
            this.label5.Text = "Start displayID:";
            // 
            // startDisplay
            // 
            this.startDisplay.Location = new System.Drawing.Point(105, 192);
            this.startDisplay.Maximum = new decimal(new int[] {
            99999999,
            0,
            0,
            0});
            this.startDisplay.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.startDisplay.Name = "startDisplay";
            this.startDisplay.Size = new System.Drawing.Size(161, 20);
            this.startDisplay.TabIndex = 12;
            this.startDisplay.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // port
            // 
            this.port.Location = new System.Drawing.Point(105, 166);
            this.port.Name = "port";
            this.port.Size = new System.Drawing.Size(241, 20);
            this.port.TabIndex = 5;
            this.port.Text = "3306";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(12, 169);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(32, 13);
            this.label10.TabIndex = 101;
            this.label10.Text = "Port: ";
            this.label10.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // table
            // 
            this.table.Location = new System.Drawing.Point(105, 140);
            this.table.Name = "table";
            this.table.Size = new System.Drawing.Size(241, 20);
            this.table.TabIndex = 4;
            this.table.Text = "gameobject_template";
            // 
            // database
            // 
            this.database.Location = new System.Drawing.Point(105, 114);
            this.database.Name = "database";
            this.database.Size = new System.Drawing.Size(241, 20);
            this.database.TabIndex = 3;
            this.database.Text = "world";
            // 
            // password
            // 
            this.password.Location = new System.Drawing.Point(105, 88);
            this.password.Name = "password";
            this.password.Size = new System.Drawing.Size(241, 20);
            this.password.TabIndex = 2;
            this.password.UseSystemPasswordChar = true;
            // 
            // login
            // 
            this.login.Location = new System.Drawing.Point(105, 62);
            this.login.Name = "login";
            this.login.Size = new System.Drawing.Size(241, 20);
            this.login.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 143);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(34, 13);
            this.label1.TabIndex = 100;
            this.label1.Text = "Table";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 39);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(32, 13);
            this.label2.TabIndex = 100;
            this.label2.Text = "Host:";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 65);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(36, 13);
            this.label3.TabIndex = 100;
            this.label3.Text = "Login:";
            this.label3.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 117);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(56, 13);
            this.label4.TabIndex = 100;
            this.label4.Text = "Database:";
            this.label4.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // host
            // 
            this.host.Location = new System.Drawing.Point(105, 36);
            this.host.Name = "host";
            this.host.Size = new System.Drawing.Size(241, 20);
            this.host.TabIndex = 0;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(12, 91);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(56, 13);
            this.label9.TabIndex = 100;
            this.label9.Text = "Password:";
            this.label9.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(12, 13);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(62, 13);
            this.label11.TabIndex = 102;
            this.label11.Text = "Input listfile:";
            // 
            // filepath
            // 
            this.filepath.Location = new System.Drawing.Point(105, 10);
            this.filepath.Name = "filepath";
            this.filepath.Size = new System.Drawing.Size(432, 20);
            this.filepath.TabIndex = 103;
            // 
            // fileButt
            // 
            this.fileButt.Location = new System.Drawing.Point(352, 34);
            this.fileButt.Name = "fileButt";
            this.fileButt.Size = new System.Drawing.Size(185, 23);
            this.fileButt.TabIndex = 104;
            this.fileButt.Text = "Select file";
            this.fileButt.UseVisualStyleBackColor = true;
            this.fileButt.Click += new System.EventHandler(this.fileButt_Click);
            // 
            // testButt
            // 
            this.testButt.Location = new System.Drawing.Point(352, 164);
            this.testButt.Name = "testButt";
            this.testButt.Size = new System.Drawing.Size(185, 23);
            this.testButt.TabIndex = 105;
            this.testButt.Text = "Test connection";
            this.testButt.UseVisualStyleBackColor = true;
            this.testButt.Click += new System.EventHandler(this.testButt_Click);
            // 
            // genButt
            // 
            this.genButt.Location = new System.Drawing.Point(272, 304);
            this.genButt.Name = "genButt";
            this.genButt.Size = new System.Drawing.Size(265, 41);
            this.genButt.TabIndex = 106;
            this.genButt.Text = "Generate";
            this.genButt.UseVisualStyleBackColor = true;
            this.genButt.Click += new System.EventHandler(this.genButt_Click);
            // 
            // openFileDialog
            // 
            this.openFileDialog.FileOk += new System.ComponentModel.CancelEventHandler(this.openFileDialog_FileOk);
            // 
            // label12
            // 
            this.label12.Location = new System.Drawing.Point(272, 192);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(264, 43);
            this.label12.TabIndex = 107;
            this.label12.Text = "Note: Final entry will be displayID + start entry. Because of that I recommend us" +
    "ing start entry with at least 1 more digit than start displayID.";
            // 
            // label13
            // 
            this.label13.Location = new System.Drawing.Point(12, 244);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(254, 57);
            this.label13.TabIndex = 108;
            this.label13.Text = "Note: Final gameobject name will be (prefix)modelName(postfix). Don\'t forget to i" +
    "nsert space behind prefix and in fron of postfix, if you want to have it there.";
            // 
            // insert
            // 
            this.insert.AutoSize = true;
            this.insert.Checked = true;
            this.insert.Location = new System.Drawing.Point(15, 304);
            this.insert.Name = "insert";
            this.insert.Size = new System.Drawing.Size(87, 17);
            this.insert.TabIndex = 109;
            this.insert.TabStop = true;
            this.insert.Text = "Use INSERT";
            this.insert.UseVisualStyleBackColor = true;
            // 
            // replace
            // 
            this.replace.AutoSize = true;
            this.replace.Location = new System.Drawing.Point(15, 328);
            this.replace.Name = "replace";
            this.replace.Size = new System.Drawing.Size(96, 17);
            this.replace.TabIndex = 110;
            this.replace.Text = "Use REPLACE";
            this.replace.UseVisualStyleBackColor = true;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(549, 352);
            this.Controls.Add(this.replace);
            this.Controls.Add(this.insert);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.genButt);
            this.Controls.Add(this.testButt);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.port);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.fileButt);
            this.Controls.Add(this.postfix);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.prefix);
            this.Controls.Add(this.filepath);
            this.Controls.Add(this.startEntry);
            this.Controls.Add(this.table);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.database);
            this.Controls.Add(this.startDisplay);
            this.Controls.Add(this.password);
            this.Controls.Add(this.login);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.host);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label4);
            this.Name = "Form1";
            this.Text = "GobGenerator";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.startEntry)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.startDisplay)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox postfix;
        private System.Windows.Forms.TextBox prefix;
        private System.Windows.Forms.NumericUpDown startEntry;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.NumericUpDown startDisplay;
        private System.Windows.Forms.TextBox port;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox table;
        private System.Windows.Forms.TextBox database;
        private System.Windows.Forms.TextBox password;
        private System.Windows.Forms.TextBox login;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox host;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox filepath;
        private System.Windows.Forms.Button fileButt;
        private System.Windows.Forms.Button testButt;
        private System.Windows.Forms.Button genButt;
        private System.Windows.Forms.OpenFileDialog openFileDialog;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.RadioButton insert;
        private System.Windows.Forms.RadioButton replace;
    }
}


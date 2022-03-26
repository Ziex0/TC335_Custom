namespace ItemDBCToDB
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
            this.filePath = new System.Windows.Forms.TextBox();
            this.testButt = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.host = new System.Windows.Forms.TextBox();
            this.login = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.password = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.database = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.table = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.port = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.okButt = new System.Windows.Forms.Button();
            this.selectButt = new System.Windows.Forms.Button();
            this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.SuspendLayout();
            // 
            // filePath
            // 
            this.filePath.Location = new System.Drawing.Point(13, 13);
            this.filePath.Name = "filePath";
            this.filePath.Size = new System.Drawing.Size(236, 20);
            this.filePath.TabIndex = 0;
            // 
            // testButt
            // 
            this.testButt.Location = new System.Drawing.Point(13, 195);
            this.testButt.Name = "testButt";
            this.testButt.Size = new System.Drawing.Size(177, 36);
            this.testButt.TabIndex = 1;
            this.testButt.Text = "Test connection";
            this.testButt.UseVisualStyleBackColor = true;
            this.testButt.Click += new System.EventHandler(this.testButt_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 42);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(35, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Host: ";
            // 
            // host
            // 
            this.host.Location = new System.Drawing.Point(124, 39);
            this.host.Name = "host";
            this.host.Size = new System.Drawing.Size(249, 20);
            this.host.TabIndex = 3;
            // 
            // login
            // 
            this.login.Location = new System.Drawing.Point(124, 65);
            this.login.Name = "login";
            this.login.Size = new System.Drawing.Size(249, 20);
            this.login.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(13, 68);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(39, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Login: ";
            // 
            // password
            // 
            this.password.Location = new System.Drawing.Point(124, 91);
            this.password.Name = "password";
            this.password.Size = new System.Drawing.Size(249, 20);
            this.password.TabIndex = 7;
            this.password.UseSystemPasswordChar = true;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 94);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(59, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Password: ";
            // 
            // database
            // 
            this.database.Location = new System.Drawing.Point(124, 117);
            this.database.Name = "database";
            this.database.Size = new System.Drawing.Size(249, 20);
            this.database.TabIndex = 9;
            this.database.Text = "world";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(13, 120);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(88, 13);
            this.label4.TabIndex = 8;
            this.label4.Text = "World database: ";
            // 
            // table
            // 
            this.table.Location = new System.Drawing.Point(124, 143);
            this.table.Name = "table";
            this.table.Size = new System.Drawing.Size(249, 20);
            this.table.TabIndex = 11;
            this.table.Text = "item_template";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(13, 146);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(105, 13);
            this.label5.TabIndex = 10;
            this.label5.Text = "Item_template table: ";
            // 
            // port
            // 
            this.port.Location = new System.Drawing.Point(124, 169);
            this.port.Name = "port";
            this.port.Size = new System.Drawing.Size(249, 20);
            this.port.TabIndex = 13;
            this.port.Text = "3306";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(13, 172);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(32, 13);
            this.label6.TabIndex = 12;
            this.label6.Text = "Port: ";
            // 
            // okButt
            // 
            this.okButt.Location = new System.Drawing.Point(196, 195);
            this.okButt.Name = "okButt";
            this.okButt.Size = new System.Drawing.Size(177, 36);
            this.okButt.TabIndex = 14;
            this.okButt.Text = "Insert data";
            this.okButt.UseVisualStyleBackColor = true;
            this.okButt.Click += new System.EventHandler(this.okButt_Click);
            // 
            // selectButt
            // 
            this.selectButt.Location = new System.Drawing.Point(255, 10);
            this.selectButt.Name = "selectButt";
            this.selectButt.Size = new System.Drawing.Size(118, 23);
            this.selectButt.TabIndex = 15;
            this.selectButt.Text = "Select Item.dbc.csv";
            this.selectButt.UseVisualStyleBackColor = true;
            this.selectButt.Click += new System.EventHandler(this.selectButt_Click);
            // 
            // openFileDialog
            // 
            this.openFileDialog.FileName = "Item.dbc.csv";
            this.openFileDialog.Filter = "CSV files|*.csv";
            this.openFileDialog.FileOk += new System.ComponentModel.CancelEventHandler(this.openFileDialog_FileOk);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(385, 240);
            this.Controls.Add(this.selectButt);
            this.Controls.Add(this.okButt);
            this.Controls.Add(this.port);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.table);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.database);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.password);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.login);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.host);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.testButt);
            this.Controls.Add(this.filePath);
            this.Name = "Form1";
            this.Text = "ItemDBCToDB";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox filePath;
        private System.Windows.Forms.Button testButt;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox host;
        private System.Windows.Forms.TextBox login;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox password;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox database;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox table;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox port;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button okButt;
        private System.Windows.Forms.Button selectButt;
        private System.Windows.Forms.OpenFileDialog openFileDialog;
    }
}


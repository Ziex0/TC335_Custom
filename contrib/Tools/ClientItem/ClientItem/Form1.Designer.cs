namespace ClientItem
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.hostBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.portBox = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.tableBox = new System.Windows.Forms.TextBox();
            this.databaseBox = new System.Windows.Forms.TextBox();
            this.passBox = new System.Windows.Forms.TextBox();
            this.loginBox = new System.Windows.Forms.TextBox();
            this.testButt = new System.Windows.Forms.Button();
            this.okButt = new System.Windows.Forms.Button();
            this.tableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // hostBox
            // 
            this.hostBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.hostBox.Location = new System.Drawing.Point(148, 4);
            this.hostBox.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.hostBox.Name = "hostBox";
            this.hostBox.Size = new System.Drawing.Size(300, 22);
            this.hostBox.TabIndex = 0;
            this.hostBox.Text = "127.0.0.1";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label1.Location = new System.Drawing.Point(3, 1);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(140, 28);
            this.label1.TabIndex = 100;
            this.label1.Text = "Server: ";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label2.Location = new System.Drawing.Point(3, 30);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(140, 28);
            this.label2.TabIndex = 100;
            this.label2.Text = "Benutzer: ";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label3.Location = new System.Drawing.Point(3, 59);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(140, 28);
            this.label3.TabIndex = 100;
            this.label3.Text = "Passwort: ";
            this.label3.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label4.Location = new System.Drawing.Point(3, 88);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(140, 28);
            this.label4.TabIndex = 100;
            this.label4.Text = "World Datenbank:";
            this.label4.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label5.Location = new System.Drawing.Point(3, 117);
            this.label5.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(140, 28);
            this.label5.TabIndex = 100;
            this.label5.Text = "Item Tabelle:";
            this.label5.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.CellBorderStyle = System.Windows.Forms.TableLayoutPanelCellBorderStyle.Single;
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 144F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.Controls.Add(this.portBox, 1, 5);
            this.tableLayoutPanel1.Controls.Add(this.label10, 0, 5);
            this.tableLayoutPanel1.Controls.Add(this.tableBox, 1, 4);
            this.tableLayoutPanel1.Controls.Add(this.databaseBox, 1, 3);
            this.tableLayoutPanel1.Controls.Add(this.passBox, 1, 2);
            this.tableLayoutPanel1.Controls.Add(this.loginBox, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.testButt, 0, 6);
            this.tableLayoutPanel1.Controls.Add(this.label5, 0, 4);
            this.tableLayoutPanel1.Controls.Add(this.label1, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.label2, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.label4, 0, 3);
            this.tableLayoutPanel1.Controls.Add(this.hostBox, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.label3, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.okButt, 1, 6);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 7;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 28F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 28F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 28F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 28F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 28F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 28F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(451, 244);
            this.tableLayoutPanel1.TabIndex = 100;
            // 
            // portBox
            // 
            this.portBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.portBox.Location = new System.Drawing.Point(148, 149);
            this.portBox.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.portBox.Name = "portBox";
            this.portBox.Size = new System.Drawing.Size(300, 22);
            this.portBox.TabIndex = 5;
            this.portBox.Text = "3306";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label10.Location = new System.Drawing.Point(3, 146);
            this.label10.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(140, 28);
            this.label10.TabIndex = 101;
            this.label10.Text = "Port: ";
            this.label10.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // tableBox
            // 
            this.tableBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableBox.Location = new System.Drawing.Point(148, 120);
            this.tableBox.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.tableBox.Name = "tableBox";
            this.tableBox.Size = new System.Drawing.Size(300, 22);
            this.tableBox.TabIndex = 4;
            this.tableBox.Text = "item_template";
            // 
            // databaseBox
            // 
            this.databaseBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.databaseBox.Location = new System.Drawing.Point(148, 91);
            this.databaseBox.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.databaseBox.Name = "databaseBox";
            this.databaseBox.Size = new System.Drawing.Size(300, 22);
            this.databaseBox.TabIndex = 3;
            this.databaseBox.Text = "wotlk_world";
            // 
            // passBox
            // 
            this.passBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.passBox.Location = new System.Drawing.Point(148, 62);
            this.passBox.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.passBox.Name = "passBox";
            this.passBox.Size = new System.Drawing.Size(300, 22);
            this.passBox.TabIndex = 2;
            this.passBox.UseSystemPasswordChar = true;
            // 
            // loginBox
            // 
            this.loginBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.loginBox.Location = new System.Drawing.Point(148, 33);
            this.loginBox.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.loginBox.Name = "loginBox";
            this.loginBox.Size = new System.Drawing.Size(300, 22);
            this.loginBox.TabIndex = 1;
            this.loginBox.Text = "root";
            // 
            // testButt
            // 
            this.testButt.Dock = System.Windows.Forms.DockStyle.Fill;
            this.testButt.Location = new System.Drawing.Point(3, 178);
            this.testButt.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.testButt.Name = "testButt";
            this.testButt.Size = new System.Drawing.Size(140, 62);
            this.testButt.TabIndex = 6;
            this.testButt.Text = "Verbindung prüfen";
            this.testButt.UseVisualStyleBackColor = true;
            this.testButt.Click += new System.EventHandler(this.testButt_Click);
            // 
            // okButt
            // 
            this.okButt.Dock = System.Windows.Forms.DockStyle.Fill;
            this.okButt.Location = new System.Drawing.Point(148, 178);
            this.okButt.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.okButt.Name = "okButt";
            this.okButt.Size = new System.Drawing.Size(300, 62);
            this.okButt.TabIndex = 7;
            this.okButt.Text = "Lade Informationen";
            this.okButt.UseVisualStyleBackColor = true;
            this.okButt.Click += new System.EventHandler(this.okButt_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(5F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(451, 244);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Font = new System.Drawing.Font("Bahnschrift Condensed", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Item DB Converter | CSV To DBC";
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TextBox hostBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.TextBox tableBox;
        private System.Windows.Forms.TextBox databaseBox;
        private System.Windows.Forms.TextBox passBox;
        private System.Windows.Forms.TextBox loginBox;
        private System.Windows.Forms.Button testButt;
        private System.Windows.Forms.Button okButt;
        private System.Windows.Forms.TextBox portBox;
        private System.Windows.Forms.Label label10;
    }
}


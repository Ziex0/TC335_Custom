namespace NPCGenerator
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
            this.charFileName = new System.Windows.Forms.TextBox();
            this.fileButt = new System.Windows.Forms.Button();
            this.dbPanel = new System.Windows.Forms.Panel();
            this.testButt = new System.Windows.Forms.Button();
            this.useReplace = new System.Windows.Forms.CheckBox();
            this.label10 = new System.Windows.Forms.Label();
            this.nameBox = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.startIDBox = new System.Windows.Forms.NumericUpDown();
            this.label8 = new System.Windows.Forms.Label();
            this.portBox = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.modelBox = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.templateBox = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.worldBox = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.passBox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.loginBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.hostBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.generateDatabase = new System.Windows.Forms.CheckBox();
            this.generateCreature = new System.Windows.Forms.CheckBox();
            this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.generateButt = new System.Windows.Forms.Button();
            this.label11 = new System.Windows.Forms.Label();
            this.displayID = new System.Windows.Forms.NumericUpDown();
            this.extraID = new System.Windows.Forms.NumericUpDown();
            this.label12 = new System.Windows.Forms.Label();
            this.generateSound = new System.Windows.Forms.CheckBox();
            this.soundID = new System.Windows.Forms.NumericUpDown();
            this.label13 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.opacity = new System.Windows.Forms.NumericUpDown();
            this.label15 = new System.Windows.Forms.Label();
            this.textureName = new System.Windows.Forms.TextBox();
            this.textureButt = new System.Windows.Forms.Button();
            this.label16 = new System.Windows.Forms.Label();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.lastFreeIDButt = new System.Windows.Forms.Button();
            this.label17 = new System.Windows.Forms.Label();
            this.scale = new System.Windows.Forms.NumericUpDown();
            this.label18 = new System.Windows.Forms.Label();
            this.label19 = new System.Windows.Forms.Label();
            this.alternativeID = new System.Windows.Forms.NumericUpDown();
            this.label20 = new System.Windows.Forms.Label();
            this.dbPanel.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.startIDBox)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.displayID)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.extraID)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.soundID)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.opacity)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.scale)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.alternativeID)).BeginInit();
            this.SuspendLayout();
            // 
            // charFileName
            // 
            this.charFileName.Location = new System.Drawing.Point(96, 12);
            this.charFileName.Name = "charFileName";
            this.charFileName.Size = new System.Drawing.Size(329, 20);
            this.charFileName.TabIndex = 0;
            // 
            // fileButt
            // 
            this.fileButt.Location = new System.Drawing.Point(431, 12);
            this.fileButt.Name = "fileButt";
            this.fileButt.Size = new System.Drawing.Size(162, 20);
            this.fileButt.TabIndex = 1;
            this.fileButt.Text = "Select .chr file";
            this.fileButt.UseVisualStyleBackColor = true;
            this.fileButt.Click += new System.EventHandler(this.fileButt_Click);
            // 
            // dbPanel
            // 
            this.dbPanel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dbPanel.Controls.Add(this.testButt);
            this.dbPanel.Controls.Add(this.useReplace);
            this.dbPanel.Controls.Add(this.label10);
            this.dbPanel.Controls.Add(this.nameBox);
            this.dbPanel.Controls.Add(this.label9);
            this.dbPanel.Controls.Add(this.startIDBox);
            this.dbPanel.Controls.Add(this.label8);
            this.dbPanel.Controls.Add(this.portBox);
            this.dbPanel.Controls.Add(this.label7);
            this.dbPanel.Controls.Add(this.modelBox);
            this.dbPanel.Controls.Add(this.label6);
            this.dbPanel.Controls.Add(this.templateBox);
            this.dbPanel.Controls.Add(this.label5);
            this.dbPanel.Controls.Add(this.worldBox);
            this.dbPanel.Controls.Add(this.label4);
            this.dbPanel.Controls.Add(this.passBox);
            this.dbPanel.Controls.Add(this.label3);
            this.dbPanel.Controls.Add(this.loginBox);
            this.dbPanel.Controls.Add(this.label2);
            this.dbPanel.Controls.Add(this.hostBox);
            this.dbPanel.Controls.Add(this.label1);
            this.dbPanel.Location = new System.Drawing.Point(599, 35);
            this.dbPanel.Name = "dbPanel";
            this.dbPanel.Size = new System.Drawing.Size(581, 303);
            this.dbPanel.TabIndex = 2;
            // 
            // testButt
            // 
            this.testButt.Location = new System.Drawing.Point(272, 211);
            this.testButt.Name = "testButt";
            this.testButt.Size = new System.Drawing.Size(299, 20);
            this.testButt.TabIndex = 20;
            this.testButt.Text = "Test connection";
            this.testButt.UseVisualStyleBackColor = true;
            this.testButt.Click += new System.EventHandler(this.testButt_Click);
            // 
            // useReplace
            // 
            this.useReplace.AutoSize = true;
            this.useReplace.Location = new System.Drawing.Point(6, 237);
            this.useReplace.Name = "useReplace";
            this.useReplace.Size = new System.Drawing.Size(189, 17);
            this.useReplace.TabIndex = 19;
            this.useReplace.Text = "Use REPLACE instead of INSERT";
            this.useReplace.UseVisualStyleBackColor = true;
            // 
            // label10
            // 
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.label10.Location = new System.Drawing.Point(3, 257);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(568, 44);
            this.label10.TabIndex = 18;
            this.label10.Text = resources.GetString("label10.Text");
            // 
            // nameBox
            // 
            this.nameBox.Location = new System.Drawing.Point(145, 185);
            this.nameBox.Name = "nameBox";
            this.nameBox.Size = new System.Drawing.Size(426, 20);
            this.nameBox.TabIndex = 17;
            this.nameBox.Text = "Template Creature ";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(3, 188);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(66, 13);
            this.label9.TabIndex = 16;
            this.label9.Text = "NPC Name: ";
            // 
            // startIDBox
            // 
            this.startIDBox.Location = new System.Drawing.Point(145, 211);
            this.startIDBox.Maximum = new decimal(new int[] {
            9999999,
            0,
            0,
            0});
            this.startIDBox.Minimum = new decimal(new int[] {
            10000,
            0,
            0,
            0});
            this.startIDBox.Name = "startIDBox";
            this.startIDBox.Size = new System.Drawing.Size(120, 20);
            this.startIDBox.TabIndex = 15;
            this.startIDBox.Value = new decimal(new int[] {
            200000,
            0,
            0,
            0});
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(3, 213);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(107, 13);
            this.label8.TabIndex = 14;
            this.label8.Text = "Start NPC Galery ID: ";
            // 
            // portBox
            // 
            this.portBox.Location = new System.Drawing.Point(145, 159);
            this.portBox.Name = "portBox";
            this.portBox.Size = new System.Drawing.Size(426, 20);
            this.portBox.TabIndex = 13;
            this.portBox.Text = "3306";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(3, 162);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(32, 13);
            this.label7.TabIndex = 12;
            this.label7.Text = "Port: ";
            // 
            // modelBox
            // 
            this.modelBox.Location = new System.Drawing.Point(145, 133);
            this.modelBox.Name = "modelBox";
            this.modelBox.Size = new System.Drawing.Size(426, 20);
            this.modelBox.TabIndex = 11;
            this.modelBox.Text = "creature_model_info";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(3, 136);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(136, 13);
            this.label6.TabIndex = 10;
            this.label6.Text = "Creature_model_info table: ";
            // 
            // templateBox
            // 
            this.templateBox.Location = new System.Drawing.Point(145, 107);
            this.templateBox.Name = "templateBox";
            this.templateBox.Size = new System.Drawing.Size(426, 20);
            this.templateBox.TabIndex = 9;
            this.templateBox.Text = "creature_template";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(3, 110);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(125, 13);
            this.label5.TabIndex = 8;
            this.label5.Text = "Creature_template table: ";
            // 
            // worldBox
            // 
            this.worldBox.Location = new System.Drawing.Point(145, 81);
            this.worldBox.Name = "worldBox";
            this.worldBox.Size = new System.Drawing.Size(426, 20);
            this.worldBox.TabIndex = 7;
            this.worldBox.Text = "world";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(3, 84);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(88, 13);
            this.label4.TabIndex = 6;
            this.label4.Text = "World database: ";
            // 
            // passBox
            // 
            this.passBox.Location = new System.Drawing.Point(145, 55);
            this.passBox.Name = "passBox";
            this.passBox.Size = new System.Drawing.Size(426, 20);
            this.passBox.TabIndex = 5;
            this.passBox.UseSystemPasswordChar = true;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(3, 58);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(59, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Password: ";
            // 
            // loginBox
            // 
            this.loginBox.Location = new System.Drawing.Point(145, 29);
            this.loginBox.Name = "loginBox";
            this.loginBox.Size = new System.Drawing.Size(426, 20);
            this.loginBox.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(3, 32);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(39, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Login: ";
            // 
            // hostBox
            // 
            this.hostBox.Location = new System.Drawing.Point(145, 3);
            this.hostBox.Name = "hostBox";
            this.hostBox.Size = new System.Drawing.Size(426, 20);
            this.hostBox.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(3, 6);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(35, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Host: ";
            // 
            // generateDatabase
            // 
            this.generateDatabase.AutoSize = true;
            this.generateDatabase.Checked = true;
            this.generateDatabase.CheckState = System.Windows.Forms.CheckState.Checked;
            this.generateDatabase.Location = new System.Drawing.Point(599, 12);
            this.generateDatabase.Name = "generateDatabase";
            this.generateDatabase.Size = new System.Drawing.Size(145, 17);
            this.generateDatabase.TabIndex = 0;
            this.generateDatabase.Text = "Generate model info data";
            this.generateDatabase.UseVisualStyleBackColor = true;
            // 
            // generateCreature
            // 
            this.generateCreature.AutoSize = true;
            this.generateCreature.Checked = true;
            this.generateCreature.CheckState = System.Windows.Forms.CheckState.Checked;
            this.generateCreature.Location = new System.Drawing.Point(746, 12);
            this.generateCreature.Name = "generateCreature";
            this.generateCreature.Size = new System.Drawing.Size(164, 17);
            this.generateCreature.TabIndex = 3;
            this.generateCreature.Text = "Generate a template creature";
            this.generateCreature.UseVisualStyleBackColor = true;
            // 
            // openFileDialog
            // 
            this.openFileDialog.Filter = "WMV CHR files|*.chr";
            this.openFileDialog.FileOk += new System.ComponentModel.CancelEventHandler(this.openFileDialog_FileOk);
            // 
            // generateButt
            // 
            this.generateButt.Location = new System.Drawing.Point(15, 294);
            this.generateButt.Name = "generateButt";
            this.generateButt.Size = new System.Drawing.Size(578, 44);
            this.generateButt.TabIndex = 4;
            this.generateButt.Text = "Generate";
            this.generateButt.UseVisualStyleBackColor = true;
            this.generateButt.Click += new System.EventHandler(this.generateButt_Click);
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(12, 40);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(58, 13);
            this.label11.TabIndex = 21;
            this.label11.Text = "DisplayID: ";
            // 
            // displayID
            // 
            this.displayID.Location = new System.Drawing.Point(96, 38);
            this.displayID.Maximum = new decimal(new int[] {
            999999,
            0,
            0,
            0});
            this.displayID.Name = "displayID";
            this.displayID.Size = new System.Drawing.Size(120, 20);
            this.displayID.TabIndex = 22;
            // 
            // extraID
            // 
            this.extraID.Location = new System.Drawing.Point(96, 63);
            this.extraID.Maximum = new decimal(new int[] {
            999999,
            0,
            0,
            0});
            this.extraID.Name = "extraID";
            this.extraID.Size = new System.Drawing.Size(120, 20);
            this.extraID.TabIndex = 24;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(12, 65);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(48, 13);
            this.label12.TabIndex = 23;
            this.label12.Text = "ExtraID: ";
            // 
            // generateSound
            // 
            this.generateSound.AutoSize = true;
            this.generateSound.Checked = true;
            this.generateSound.CheckState = System.Windows.Forms.CheckState.Checked;
            this.generateSound.Location = new System.Drawing.Point(15, 141);
            this.generateSound.Name = "generateSound";
            this.generateSound.Size = new System.Drawing.Size(156, 17);
            this.generateSound.TabIndex = 25;
            this.generateSound.Text = "Generate random Sound ID";
            this.generateSound.UseVisualStyleBackColor = true;
            this.generateSound.CheckedChanged += new System.EventHandler(this.generateSound_CheckedChanged);
            // 
            // soundID
            // 
            this.soundID.Enabled = false;
            this.soundID.Location = new System.Drawing.Point(96, 164);
            this.soundID.Maximum = new decimal(new int[] {
            9999999,
            0,
            0,
            0});
            this.soundID.Name = "soundID";
            this.soundID.Size = new System.Drawing.Size(120, 20);
            this.soundID.TabIndex = 26;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(12, 166);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(77, 13);
            this.label13.TabIndex = 27;
            this.label13.Text = "NPCSound ID:";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(12, 117);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(49, 13);
            this.label14.TabIndex = 29;
            this.label14.Text = "Opacity: ";
            // 
            // opacity
            // 
            this.opacity.Location = new System.Drawing.Point(96, 115);
            this.opacity.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
            this.opacity.Name = "opacity";
            this.opacity.Size = new System.Drawing.Size(120, 20);
            this.opacity.TabIndex = 28;
            this.opacity.Value = new decimal(new int[] {
            255,
            0,
            0,
            0});
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(12, 193);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(78, 13);
            this.label15.TabIndex = 30;
            this.label15.Text = "Texture name: ";
            // 
            // textureName
            // 
            this.textureName.Location = new System.Drawing.Point(96, 190);
            this.textureName.Name = "textureName";
            this.textureName.Size = new System.Drawing.Size(329, 20);
            this.textureName.TabIndex = 31;
            // 
            // textureButt
            // 
            this.textureButt.Location = new System.Drawing.Point(431, 190);
            this.textureButt.Name = "textureButt";
            this.textureButt.Size = new System.Drawing.Size(162, 20);
            this.textureButt.TabIndex = 32;
            this.textureButt.Text = "Select texture";
            this.textureButt.UseVisualStyleBackColor = true;
            this.textureButt.Click += new System.EventHandler(this.textureButt_Click);
            // 
            // label16
            // 
            this.label16.Location = new System.Drawing.Point(329, 40);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(264, 144);
            this.label16.TabIndex = 21;
            this.label16.Text = resources.GetString("label16.Text");
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.Filter = "PNG files|*.png|BLP files|*.blp|TAR files|*.tar|All files|*.*";
            this.openFileDialog1.FileOk += new System.ComponentModel.CancelEventHandler(this.openFileDialog1_FileOk);
            // 
            // lastFreeIDButt
            // 
            this.lastFreeIDButt.Location = new System.Drawing.Point(222, 38);
            this.lastFreeIDButt.Name = "lastFreeIDButt";
            this.lastFreeIDButt.Size = new System.Drawing.Size(101, 45);
            this.lastFreeIDButt.TabIndex = 33;
            this.lastFreeIDButt.Text = "Get last free IDs";
            this.lastFreeIDButt.UseVisualStyleBackColor = true;
            this.lastFreeIDButt.Click += new System.EventHandler(this.lastFreeIDButt_Click);
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Location = new System.Drawing.Point(12, 91);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(34, 13);
            this.label17.TabIndex = 35;
            this.label17.Text = "Scale";
            // 
            // scale
            // 
            this.scale.DecimalPlaces = 2;
            this.scale.Increment = new decimal(new int[] {
            1,
            0,
            0,
            131072});
            this.scale.Location = new System.Drawing.Point(96, 89);
            this.scale.Name = "scale";
            this.scale.Size = new System.Drawing.Size(120, 20);
            this.scale.TabIndex = 34;
            this.scale.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Location = new System.Drawing.Point(12, 15);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(63, 13);
            this.label18.TabIndex = 36;
            this.label18.Text = "Source file: ";
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Location = new System.Drawing.Point(12, 218);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(77, 13);
            this.label19.TabIndex = 38;
            this.label19.Text = "Alternative ID: ";
            // 
            // alternativeID
            // 
            this.alternativeID.Location = new System.Drawing.Point(96, 216);
            this.alternativeID.Maximum = new decimal(new int[] {
            9999999,
            0,
            0,
            0});
            this.alternativeID.Name = "alternativeID";
            this.alternativeID.Size = new System.Drawing.Size(120, 20);
            this.alternativeID.TabIndex = 37;
            // 
            // label20
            // 
            this.label20.Location = new System.Drawing.Point(222, 216);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(371, 35);
            this.label20.TabIndex = 39;
            this.label20.Text = "Note: Used in creature_model_info (DisplayID_other_gender) - alternative displayI" +
    "D which will be used in 50% of causes instead of this one.";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1188, 347);
            this.Controls.Add(this.label20);
            this.Controls.Add(this.label19);
            this.Controls.Add(this.alternativeID);
            this.Controls.Add(this.label18);
            this.Controls.Add(this.label17);
            this.Controls.Add(this.scale);
            this.Controls.Add(this.lastFreeIDButt);
            this.Controls.Add(this.label16);
            this.Controls.Add(this.textureButt);
            this.Controls.Add(this.textureName);
            this.Controls.Add(this.label15);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.opacity);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.soundID);
            this.Controls.Add(this.generateSound);
            this.Controls.Add(this.extraID);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.displayID);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.generateButt);
            this.Controls.Add(this.generateCreature);
            this.Controls.Add(this.generateDatabase);
            this.Controls.Add(this.dbPanel);
            this.Controls.Add(this.fileButt);
            this.Controls.Add(this.charFileName);
            this.Name = "Form1";
            this.Text = "NPCGenerator";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.dbPanel.ResumeLayout(false);
            this.dbPanel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.startIDBox)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.displayID)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.extraID)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.soundID)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.opacity)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.scale)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.alternativeID)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox charFileName;
        private System.Windows.Forms.Button fileButt;
        private System.Windows.Forms.Panel dbPanel;
        private System.Windows.Forms.CheckBox useReplace;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox nameBox;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.NumericUpDown startIDBox;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox portBox;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox modelBox;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox templateBox;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox worldBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox passBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox loginBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox hostBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.CheckBox generateDatabase;
        private System.Windows.Forms.CheckBox generateCreature;
        private System.Windows.Forms.OpenFileDialog openFileDialog;
        private System.Windows.Forms.Button testButt;
        private System.Windows.Forms.Button generateButt;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.NumericUpDown displayID;
        private System.Windows.Forms.NumericUpDown extraID;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.CheckBox generateSound;
        private System.Windows.Forms.NumericUpDown soundID;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.NumericUpDown opacity;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.TextBox textureName;
        private System.Windows.Forms.Button textureButt;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.Button lastFreeIDButt;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.NumericUpDown scale;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.NumericUpDown alternativeID;
        private System.Windows.Forms.Label label20;
    }
}


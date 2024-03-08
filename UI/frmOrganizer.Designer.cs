namespace Session1.UI
{
    partial class frmOrganizer
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
            this.tlpTop = new System.Windows.Forms.TableLayoutPanel();
            this.lblWindow = new System.Windows.Forms.Label();
            this.lblWelcome = new System.Windows.Forms.Label();
            this.picOrganizer = new System.Windows.Forms.PictureBox();
            this.btnProfile = new System.Windows.Forms.Button();
            this.btnEvents = new System.Windows.Forms.Button();
            this.btnParticipant = new System.Windows.Forms.Button();
            this.btnJury = new System.Windows.Forms.Button();
            this.btnRegistrationJM = new System.Windows.Forms.Button();
            this.pnlPic = new System.Windows.Forms.Panel();
            this.btnBackToAuth = new System.Windows.Forms.Button();
            this.tlpTop.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picOrganizer)).BeginInit();
            this.SuspendLayout();
            // 
            // tlpTop
            // 
            this.tlpTop.BackColor = System.Drawing.Color.ForestGreen;
            this.tlpTop.ColumnCount = 1;
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpTop.Controls.Add(this.lblWindow, 0, 0);
            this.tlpTop.Dock = System.Windows.Forms.DockStyle.Top;
            this.tlpTop.Location = new System.Drawing.Point(0, 0);
            this.tlpTop.Name = "tlpTop";
            this.tlpTop.RowCount = 1;
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpTop.Size = new System.Drawing.Size(800, 65);
            this.tlpTop.TabIndex = 3;
            // 
            // lblWindow
            // 
            this.lblWindow.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lblWindow.AutoSize = true;
            this.lblWindow.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblWindow.Location = new System.Drawing.Point(296, 17);
            this.lblWindow.Name = "lblWindow";
            this.lblWindow.Size = new System.Drawing.Size(208, 30);
            this.lblWindow.TabIndex = 0;
            this.lblWindow.Text = "Окно организатора";
            // 
            // lblWelcome
            // 
            this.lblWelcome.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lblWelcome.AutoSize = true;
            this.lblWelcome.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblWelcome.Location = new System.Drawing.Point(391, 68);
            this.lblWelcome.Name = "lblWelcome";
            this.lblWelcome.Size = new System.Drawing.Size(0, 30);
            this.lblWelcome.TabIndex = 4;
            this.lblWelcome.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // picOrganizer
            // 
            this.picOrganizer.Location = new System.Drawing.Point(14, 84);
            this.picOrganizer.Margin = new System.Windows.Forms.Padding(0);
            this.picOrganizer.Name = "picOrganizer";
            this.picOrganizer.Size = new System.Drawing.Size(211, 246);
            this.picOrganizer.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picOrganizer.TabIndex = 5;
            this.picOrganizer.TabStop = false;
            // 
            // btnProfile
            // 
            this.btnProfile.BackColor = System.Drawing.Color.ForestGreen;
            this.btnProfile.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnProfile.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnProfile.Location = new System.Drawing.Point(12, 352);
            this.btnProfile.Name = "btnProfile";
            this.btnProfile.Size = new System.Drawing.Size(215, 86);
            this.btnProfile.TabIndex = 10;
            this.btnProfile.Text = "Мой \r\nпрофиль";
            this.btnProfile.UseVisualStyleBackColor = false;
            this.btnProfile.Click += new System.EventHandler(this.btnProfile_Click);
            // 
            // btnEvents
            // 
            this.btnEvents.BackColor = System.Drawing.Color.ForestGreen;
            this.btnEvents.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnEvents.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnEvents.Location = new System.Drawing.Point(254, 168);
            this.btnEvents.Name = "btnEvents";
            this.btnEvents.Size = new System.Drawing.Size(252, 86);
            this.btnEvents.TabIndex = 11;
            this.btnEvents.Text = "Мероприятия";
            this.btnEvents.UseVisualStyleBackColor = false;
            this.btnEvents.Click += new System.EventHandler(this.btnEvents_Click);
            // 
            // btnParticipant
            // 
            this.btnParticipant.BackColor = System.Drawing.Color.ForestGreen;
            this.btnParticipant.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnParticipant.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnParticipant.Location = new System.Drawing.Point(536, 168);
            this.btnParticipant.Name = "btnParticipant";
            this.btnParticipant.Size = new System.Drawing.Size(252, 86);
            this.btnParticipant.TabIndex = 12;
            this.btnParticipant.Text = "Участники";
            this.btnParticipant.UseVisualStyleBackColor = false;
            this.btnParticipant.Click += new System.EventHandler(this.btnParticipant_Click);
            // 
            // btnJury
            // 
            this.btnJury.BackColor = System.Drawing.Color.ForestGreen;
            this.btnJury.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnJury.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnJury.Location = new System.Drawing.Point(254, 284);
            this.btnJury.Name = "btnJury";
            this.btnJury.Size = new System.Drawing.Size(252, 86);
            this.btnJury.TabIndex = 13;
            this.btnJury.Text = "Жюри";
            this.btnJury.UseVisualStyleBackColor = false;
            this.btnJury.Click += new System.EventHandler(this.btnJury_Click);
            // 
            // btnRegistrationJM
            // 
            this.btnRegistrationJM.BackColor = System.Drawing.Color.ForestGreen;
            this.btnRegistrationJM.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRegistrationJM.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnRegistrationJM.Location = new System.Drawing.Point(536, 284);
            this.btnRegistrationJM.Name = "btnRegistrationJM";
            this.btnRegistrationJM.Size = new System.Drawing.Size(252, 86);
            this.btnRegistrationJM.TabIndex = 14;
            this.btnRegistrationJM.Text = "Регистрация жюри/модераторов";
            this.btnRegistrationJM.UseVisualStyleBackColor = false;
            this.btnRegistrationJM.Click += new System.EventHandler(this.btnRegistrationJM_Click);
            // 
            // pnlPic
            // 
            this.pnlPic.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pnlPic.Location = new System.Drawing.Point(12, 82);
            this.pnlPic.Name = "pnlPic";
            this.pnlPic.Size = new System.Drawing.Size(215, 250);
            this.pnlPic.TabIndex = 15;
            // 
            // btnBackToAuth
            // 
            this.btnBackToAuth.BackColor = System.Drawing.Color.ForestGreen;
            this.btnBackToAuth.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnBackToAuth.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnBackToAuth.Location = new System.Drawing.Point(596, 400);
            this.btnBackToAuth.Name = "btnBackToAuth";
            this.btnBackToAuth.Size = new System.Drawing.Size(192, 38);
            this.btnBackToAuth.TabIndex = 18;
            this.btnBackToAuth.Text = "Выход";
            this.btnBackToAuth.UseVisualStyleBackColor = false;
            this.btnBackToAuth.Click += new System.EventHandler(this.btnBackToAuth_Click);
            // 
            // frmOrganizer
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.AntiqueWhite;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnBackToAuth);
            this.Controls.Add(this.btnRegistrationJM);
            this.Controls.Add(this.btnJury);
            this.Controls.Add(this.btnParticipant);
            this.Controls.Add(this.btnEvents);
            this.Controls.Add(this.btnProfile);
            this.Controls.Add(this.picOrganizer);
            this.Controls.Add(this.lblWelcome);
            this.Controls.Add(this.tlpTop);
            this.Controls.Add(this.pnlPic);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "frmOrganizer";
            this.ShowIcon = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Load += new System.EventHandler(this.frmOrganizer_Load);
            this.tlpTop.ResumeLayout(false);
            this.tlpTop.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picOrganizer)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tlpTop;
        private System.Windows.Forms.Label lblWindow;
        private System.Windows.Forms.Label lblWelcome;
        private System.Windows.Forms.PictureBox picOrganizer;
        private System.Windows.Forms.Button btnProfile;
        private System.Windows.Forms.Button btnEvents;
        private System.Windows.Forms.Button btnParticipant;
        private System.Windows.Forms.Button btnJury;
        private System.Windows.Forms.Button btnRegistrationJM;
        private System.Windows.Forms.Panel pnlPic;
        private System.Windows.Forms.Button btnBackToAuth;
    }
}
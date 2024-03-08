namespace Session1.UI
{
    partial class frmRegistrationJM
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
            this.txtID = new System.Windows.Forms.TextBox();
            this.lblLogin = new System.Windows.Forms.Label();
            this.txtFIO = new System.Windows.Forms.TextBox();
            this.lblFIO = new System.Windows.Forms.Label();
            this.lblGender = new System.Windows.Forms.Label();
            this.lblRole = new System.Windows.Forms.Label();
            this.txtEmail = new System.Windows.Forms.TextBox();
            this.lblEmail = new System.Windows.Forms.Label();
            this.lblPhone = new System.Windows.Forms.Label();
            this.cboGender = new System.Windows.Forms.ComboBox();
            this.lblDob = new System.Windows.Forms.Label();
            this.dtpDOB = new System.Windows.Forms.DateTimePicker();
            this.lblCountry = new System.Windows.Forms.Label();
            this.lblPassword = new System.Windows.Forms.Label();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.cboDirection = new System.Windows.Forms.ComboBox();
            this.lblDirection = new System.Windows.Forms.Label();
            this.cboEvents = new System.Windows.Forms.ComboBox();
            this.lblEvent = new System.Windows.Forms.Label();
            this.picPhoto = new System.Windows.Forms.PictureBox();
            this.btnCancel = new System.Windows.Forms.Button();
            this.cboRole = new System.Windows.Forms.ComboBox();
            this.btnAccept = new System.Windows.Forms.Button();
            this.mtxPhone = new System.Windows.Forms.MaskedTextBox();
            this.cboCountry = new System.Windows.Forms.ComboBox();
            this.btnBrowse = new System.Windows.Forms.Button();
            this.txtPasswordSec = new System.Windows.Forms.TextBox();
            this.lblPasswordSec = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.chkPassword = new System.Windows.Forms.CheckBox();
            this.chkAttach = new System.Windows.Forms.CheckBox();
            this.btnBinding = new System.Windows.Forms.Button();
            this.tlpTop.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picPhoto)).BeginInit();
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
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 65F));
            this.tlpTop.Size = new System.Drawing.Size(896, 65);
            this.tlpTop.TabIndex = 3;
            // 
            // lblWindow
            // 
            this.lblWindow.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lblWindow.AutoSize = true;
            this.lblWindow.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblWindow.Location = new System.Drawing.Point(281, 17);
            this.lblWindow.Name = "lblWindow";
            this.lblWindow.Size = new System.Drawing.Size(334, 30);
            this.lblWindow.TabIndex = 0;
            this.lblWindow.Text = "Регистрация жюри/модератора";
            // 
            // txtID
            // 
            this.txtID.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.txtID.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.txtID.Location = new System.Drawing.Point(169, 71);
            this.txtID.MaxLength = 20;
            this.txtID.Name = "txtID";
            this.txtID.ReadOnly = true;
            this.txtID.Size = new System.Drawing.Size(266, 35);
            this.txtID.TabIndex = 14;
            this.txtID.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lblLogin
            // 
            this.lblLogin.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblLogin.Location = new System.Drawing.Point(41, 74);
            this.lblLogin.Name = "lblLogin";
            this.lblLogin.Size = new System.Drawing.Size(122, 30);
            this.lblLogin.TabIndex = 13;
            this.lblLogin.Text = "Id Number:";
            // 
            // txtFIO
            // 
            this.txtFIO.BackColor = System.Drawing.SystemColors.Window;
            this.txtFIO.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.txtFIO.Location = new System.Drawing.Point(168, 110);
            this.txtFIO.MaxLength = 255;
            this.txtFIO.Name = "txtFIO";
            this.txtFIO.Size = new System.Drawing.Size(266, 35);
            this.txtFIO.TabIndex = 16;
            // 
            // lblFIO
            // 
            this.lblFIO.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblFIO.Location = new System.Drawing.Point(95, 113);
            this.lblFIO.Name = "lblFIO";
            this.lblFIO.Size = new System.Drawing.Size(67, 30);
            this.lblFIO.TabIndex = 15;
            this.lblFIO.Text = "ФИО:";
            // 
            // lblGender
            // 
            this.lblGender.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblGender.Location = new System.Drawing.Point(102, 154);
            this.lblGender.Name = "lblGender";
            this.lblGender.Size = new System.Drawing.Size(60, 30);
            this.lblGender.TabIndex = 17;
            this.lblGender.Text = "Пол: ";
            // 
            // lblRole
            // 
            this.lblRole.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblRole.Location = new System.Drawing.Point(96, 200);
            this.lblRole.Name = "lblRole";
            this.lblRole.Size = new System.Drawing.Size(66, 30);
            this.lblRole.TabIndex = 19;
            this.lblRole.Text = "Роль: ";
            // 
            // txtEmail
            // 
            this.txtEmail.BackColor = System.Drawing.SystemColors.Window;
            this.txtEmail.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.txtEmail.Location = new System.Drawing.Point(168, 239);
            this.txtEmail.MaxLength = 255;
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(266, 35);
            this.txtEmail.TabIndex = 22;
            // 
            // lblEmail
            // 
            this.lblEmail.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblEmail.Location = new System.Drawing.Point(93, 242);
            this.lblEmail.Name = "lblEmail";
            this.lblEmail.Size = new System.Drawing.Size(69, 30);
            this.lblEmail.TabIndex = 21;
            this.lblEmail.Text = "Email: ";
            // 
            // lblPhone
            // 
            this.lblPhone.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblPhone.Location = new System.Drawing.Point(59, 282);
            this.lblPhone.Name = "lblPhone";
            this.lblPhone.Size = new System.Drawing.Size(104, 30);
            this.lblPhone.TabIndex = 23;
            this.lblPhone.Text = "Телефон: ";
            // 
            // cboGender
            // 
            this.cboGender.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboGender.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.cboGender.FormattingEnabled = true;
            this.cboGender.Items.AddRange(new object[] {
            "мужской",
            "женский"});
            this.cboGender.Location = new System.Drawing.Point(168, 149);
            this.cboGender.Name = "cboGender";
            this.cboGender.Size = new System.Drawing.Size(266, 38);
            this.cboGender.TabIndex = 25;
            // 
            // lblDob
            // 
            this.lblDob.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblDob.Location = new System.Drawing.Point(117, 370);
            this.lblDob.Name = "lblDob";
            this.lblDob.Size = new System.Drawing.Size(45, 30);
            this.lblDob.TabIndex = 26;
            this.lblDob.Text = "ДР:";
            // 
            // dtpDOB
            // 
            this.dtpDOB.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.dtpDOB.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDOB.Location = new System.Drawing.Point(168, 366);
            this.dtpDOB.MaxDate = new System.DateTime(2024, 12, 31, 0, 0, 0, 0);
            this.dtpDOB.MinDate = new System.DateTime(1950, 1, 1, 0, 0, 0, 0);
            this.dtpDOB.Name = "dtpDOB";
            this.dtpDOB.Size = new System.Drawing.Size(266, 35);
            this.dtpDOB.TabIndex = 27;
            this.dtpDOB.Value = new System.DateTime(1950, 1, 1, 0, 0, 0, 0);
            // 
            // lblCountry
            // 
            this.lblCountry.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblCountry.Location = new System.Drawing.Point(75, 325);
            this.lblCountry.Name = "lblCountry";
            this.lblCountry.Size = new System.Drawing.Size(88, 30);
            this.lblCountry.TabIndex = 28;
            this.lblCountry.Text = "Страна: ";
            // 
            // lblPassword
            // 
            this.lblPassword.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblPassword.Location = new System.Drawing.Point(519, 415);
            this.lblPassword.Name = "lblPassword";
            this.lblPassword.Size = new System.Drawing.Size(93, 30);
            this.lblPassword.TabIndex = 30;
            this.lblPassword.Text = "Пароль: ";
            // 
            // txtPassword
            // 
            this.txtPassword.BackColor = System.Drawing.SystemColors.Window;
            this.txtPassword.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.txtPassword.Location = new System.Drawing.Point(618, 412);
            this.txtPassword.MaxLength = 64;
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.Size = new System.Drawing.Size(266, 35);
            this.txtPassword.TabIndex = 31;
            // 
            // cboDirection
            // 
            this.cboDirection.DropDownWidth = 400;
            this.cboDirection.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.cboDirection.FormattingEnabled = true;
            this.cboDirection.Location = new System.Drawing.Point(168, 409);
            this.cboDirection.Name = "cboDirection";
            this.cboDirection.Size = new System.Drawing.Size(266, 38);
            this.cboDirection.TabIndex = 33;
            // 
            // lblDirection
            // 
            this.lblDirection.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblDirection.Location = new System.Drawing.Point(9, 415);
            this.lblDirection.Name = "lblDirection";
            this.lblDirection.Size = new System.Drawing.Size(153, 30);
            this.lblDirection.TabIndex = 32;
            this.lblDirection.Text = "Направление: ";
            // 
            // cboEvents
            // 
            this.cboEvents.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboEvents.DropDownWidth = 1000;
            this.cboEvents.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.cboEvents.FormattingEnabled = true;
            this.cboEvents.Location = new System.Drawing.Point(168, 479);
            this.cboEvents.Name = "cboEvents";
            this.cboEvents.Size = new System.Drawing.Size(266, 38);
            this.cboEvents.TabIndex = 35;
            this.cboEvents.SelectedIndexChanged += new System.EventHandler(this.cboEvents_SelectedIndexChanged);
            // 
            // lblEvent
            // 
            this.lblEvent.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblEvent.Location = new System.Drawing.Point(5, 482);
            this.lblEvent.Name = "lblEvent";
            this.lblEvent.Size = new System.Drawing.Size(158, 30);
            this.lblEvent.TabIndex = 34;
            this.lblEvent.Text = "Мероприятие: ";
            // 
            // picPhoto
            // 
            this.picPhoto.Location = new System.Drawing.Point(620, 73);
            this.picPhoto.Margin = new System.Windows.Forms.Padding(0);
            this.picPhoto.Name = "picPhoto";
            this.picPhoto.Size = new System.Drawing.Size(262, 279);
            this.picPhoto.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picPhoto.TabIndex = 36;
            this.picPhoto.TabStop = false;
            // 
            // btnCancel
            // 
            this.btnCancel.BackColor = System.Drawing.Color.ForestGreen;
            this.btnCancel.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCancel.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnCancel.Location = new System.Drawing.Point(710, 524);
            this.btnCancel.Margin = new System.Windows.Forms.Padding(1);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(176, 36);
            this.btnCancel.TabIndex = 37;
            this.btnCancel.Text = "Отмена";
            this.btnCancel.UseVisualStyleBackColor = false;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // cboRole
            // 
            this.cboRole.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboRole.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.cboRole.FormattingEnabled = true;
            this.cboRole.Items.AddRange(new object[] {
            "Модератор",
            "Жюри"});
            this.cboRole.Location = new System.Drawing.Point(168, 195);
            this.cboRole.Name = "cboRole";
            this.cboRole.Size = new System.Drawing.Size(266, 38);
            this.cboRole.TabIndex = 38;
            this.cboRole.SelectedIndexChanged += new System.EventHandler(this.cboRole_SelectedIndexChanged);
            // 
            // btnAccept
            // 
            this.btnAccept.BackColor = System.Drawing.Color.ForestGreen;
            this.btnAccept.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAccept.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnAccept.Location = new System.Drawing.Point(532, 524);
            this.btnAccept.Margin = new System.Windows.Forms.Padding(1);
            this.btnAccept.Name = "btnAccept";
            this.btnAccept.Size = new System.Drawing.Size(176, 36);
            this.btnAccept.TabIndex = 39;
            this.btnAccept.Text = "OK";
            this.btnAccept.UseVisualStyleBackColor = false;
            this.btnAccept.Click += new System.EventHandler(this.btnAccept_Click);
            // 
            // mtxPhone
            // 
            this.mtxPhone.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.mtxPhone.Location = new System.Drawing.Point(169, 279);
            this.mtxPhone.Mask = "+7(999)-000-00-00";
            this.mtxPhone.Name = "mtxPhone";
            this.mtxPhone.Size = new System.Drawing.Size(266, 35);
            this.mtxPhone.TabIndex = 40;
            // 
            // cboCountry
            // 
            this.cboCountry.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboCountry.DropDownWidth = 400;
            this.cboCountry.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.cboCountry.FormattingEnabled = true;
            this.cboCountry.Location = new System.Drawing.Point(169, 320);
            this.cboCountry.MaxDropDownItems = 20;
            this.cboCountry.Name = "cboCountry";
            this.cboCountry.Size = new System.Drawing.Size(266, 38);
            this.cboCountry.TabIndex = 1;
            // 
            // btnBrowse
            // 
            this.btnBrowse.BackColor = System.Drawing.Color.ForestGreen;
            this.btnBrowse.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnBrowse.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnBrowse.Location = new System.Drawing.Point(618, 360);
            this.btnBrowse.Name = "btnBrowse";
            this.btnBrowse.Size = new System.Drawing.Size(266, 36);
            this.btnBrowse.TabIndex = 42;
            this.btnBrowse.Text = "Загрузить фото";
            this.btnBrowse.UseVisualStyleBackColor = false;
            this.btnBrowse.Click += new System.EventHandler(this.btnBrowse_Click);
            // 
            // txtPasswordSec
            // 
            this.txtPasswordSec.BackColor = System.Drawing.SystemColors.Window;
            this.txtPasswordSec.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.txtPasswordSec.Location = new System.Drawing.Point(618, 453);
            this.txtPasswordSec.MaxLength = 64;
            this.txtPasswordSec.Name = "txtPasswordSec";
            this.txtPasswordSec.Size = new System.Drawing.Size(266, 35);
            this.txtPasswordSec.TabIndex = 44;
            // 
            // lblPasswordSec
            // 
            this.lblPasswordSec.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblPasswordSec.Location = new System.Drawing.Point(441, 456);
            this.lblPasswordSec.Name = "lblPasswordSec";
            this.lblPasswordSec.Size = new System.Drawing.Size(171, 30);
            this.lblPasswordSec.TabIndex = 43;
            this.lblPasswordSec.Text = "Повтор пароля:";
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel1.Location = new System.Drawing.Point(618, 71);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(266, 283);
            this.panel1.TabIndex = 45;
            // 
            // chkPassword
            // 
            this.chkPassword.AutoSize = true;
            this.chkPassword.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold);
            this.chkPassword.Location = new System.Drawing.Point(652, 488);
            this.chkPassword.Name = "chkPassword";
            this.chkPassword.Size = new System.Drawing.Size(205, 34);
            this.chkPassword.TabIndex = 46;
            this.chkPassword.Text = "Видимый пароль";
            this.chkPassword.UseVisualStyleBackColor = true;
            this.chkPassword.CheckedChanged += new System.EventHandler(this.chkPassword_CheckedChanged);
            // 
            // chkAttach
            // 
            this.chkAttach.AutoSize = true;
            this.chkAttach.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold);
            this.chkAttach.Location = new System.Drawing.Point(224, 445);
            this.chkAttach.Name = "chkAttach";
            this.chkAttach.Size = new System.Drawing.Size(153, 34);
            this.chkAttach.TabIndex = 47;
            this.chkAttach.Text = "Прикрепить";
            this.chkAttach.UseVisualStyleBackColor = true;
            this.chkAttach.CheckedChanged += new System.EventHandler(this.chkAttach_CheckedChanged);
            // 
            // btnBinding
            // 
            this.btnBinding.BackColor = System.Drawing.Color.ForestGreen;
            this.btnBinding.Enabled = false;
            this.btnBinding.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnBinding.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnBinding.Location = new System.Drawing.Point(208, 524);
            this.btnBinding.Margin = new System.Windows.Forms.Padding(1);
            this.btnBinding.Name = "btnBinding";
            this.btnBinding.Size = new System.Drawing.Size(322, 36);
            this.btnBinding.TabIndex = 48;
            this.btnBinding.Text = "Привязать к  сущ. мероприятию";
            this.btnBinding.UseVisualStyleBackColor = false;
            this.btnBinding.Click += new System.EventHandler(this.btnBinding_Click);
            // 
            // frmRegistrationJM
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.AntiqueWhite;
            this.ClientSize = new System.Drawing.Size(896, 566);
            this.Controls.Add(this.btnBinding);
            this.Controls.Add(this.txtPasswordSec);
            this.Controls.Add(this.lblPasswordSec);
            this.Controls.Add(this.btnBrowse);
            this.Controls.Add(this.cboCountry);
            this.Controls.Add(this.mtxPhone);
            this.Controls.Add(this.btnAccept);
            this.Controls.Add(this.cboRole);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.picPhoto);
            this.Controls.Add(this.cboEvents);
            this.Controls.Add(this.lblEvent);
            this.Controls.Add(this.cboDirection);
            this.Controls.Add(this.lblDirection);
            this.Controls.Add(this.txtPassword);
            this.Controls.Add(this.lblPassword);
            this.Controls.Add(this.lblCountry);
            this.Controls.Add(this.dtpDOB);
            this.Controls.Add(this.lblDob);
            this.Controls.Add(this.cboGender);
            this.Controls.Add(this.lblPhone);
            this.Controls.Add(this.txtEmail);
            this.Controls.Add(this.lblEmail);
            this.Controls.Add(this.lblRole);
            this.Controls.Add(this.lblGender);
            this.Controls.Add(this.txtFIO);
            this.Controls.Add(this.lblFIO);
            this.Controls.Add(this.txtID);
            this.Controls.Add(this.lblLogin);
            this.Controls.Add(this.tlpTop);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.chkPassword);
            this.Controls.Add(this.chkAttach);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "frmRegistrationJM";
            this.ShowIcon = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.tlpTop.ResumeLayout(false);
            this.tlpTop.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picPhoto)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tlpTop;
        private System.Windows.Forms.Label lblWindow;
        private System.Windows.Forms.TextBox txtID;
        private System.Windows.Forms.Label lblLogin;
        private System.Windows.Forms.TextBox txtFIO;
        private System.Windows.Forms.Label lblFIO;
        private System.Windows.Forms.Label lblGender;
        private System.Windows.Forms.Label lblRole;
        private System.Windows.Forms.TextBox txtEmail;
        private System.Windows.Forms.Label lblEmail;
        private System.Windows.Forms.Label lblPhone;
        private System.Windows.Forms.ComboBox cboGender;
        private System.Windows.Forms.Label lblDob;
        private System.Windows.Forms.DateTimePicker dtpDOB;
        private System.Windows.Forms.Label lblCountry;
        private System.Windows.Forms.Label lblPassword;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.ComboBox cboDirection;
        private System.Windows.Forms.Label lblDirection;
        private System.Windows.Forms.ComboBox cboEvents;
        private System.Windows.Forms.Label lblEvent;
        private System.Windows.Forms.PictureBox picPhoto;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.ComboBox cboRole;
        private System.Windows.Forms.Button btnAccept;
        private System.Windows.Forms.MaskedTextBox mtxPhone;
        private System.Windows.Forms.ComboBox cboCountry;
        private System.Windows.Forms.Button btnBrowse;
        private System.Windows.Forms.TextBox txtPasswordSec;
        private System.Windows.Forms.Label lblPasswordSec;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.CheckBox chkPassword;
        private System.Windows.Forms.CheckBox chkAttach;
        private System.Windows.Forms.Button btnBinding;
    }
}
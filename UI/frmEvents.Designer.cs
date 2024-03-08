namespace Session1.UI
{
    partial class frmEvents
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
            this.cboEvents = new System.Windows.Forms.ComboBox();
            this.lblEvent = new System.Windows.Forms.Label();
            this.cboDirection = new System.Windows.Forms.ComboBox();
            this.lblDirection = new System.Windows.Forms.Label();
            this.dtpDOB = new System.Windows.Forms.DateTimePicker();
            this.lblDob = new System.Windows.Forms.Label();
            this.nudDays = new System.Windows.Forms.NumericUpDown();
            this.lblDays = new System.Windows.Forms.Label();
            this.cboCity = new System.Windows.Forms.ComboBox();
            this.lblCity = new System.Windows.Forms.Label();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnAddEvent = new System.Windows.Forms.Button();
            this.nudDayActivity = new System.Windows.Forms.NumericUpDown();
            this.lblDayActivity = new System.Windows.Forms.Label();
            this.dtpTime = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.tlpTop.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nudDays)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudDayActivity)).BeginInit();
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
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.Size = new System.Drawing.Size(967, 65);
            this.tlpTop.TabIndex = 4;
            // 
            // lblWindow
            // 
            this.lblWindow.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lblWindow.AutoSize = true;
            this.lblWindow.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblWindow.Location = new System.Drawing.Point(381, 17);
            this.lblWindow.Name = "lblWindow";
            this.lblWindow.Size = new System.Drawing.Size(205, 30);
            this.lblWindow.TabIndex = 0;
            this.lblWindow.Text = "Окно мероприятия";
            // 
            // cboEvents
            // 
            this.cboEvents.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboEvents.DropDownWidth = 1000;
            this.cboEvents.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.cboEvents.FormattingEnabled = true;
            this.cboEvents.Items.AddRange(new object[] {
            ""});
            this.cboEvents.Location = new System.Drawing.Point(211, 71);
            this.cboEvents.Name = "cboEvents";
            this.cboEvents.Size = new System.Drawing.Size(266, 38);
            this.cboEvents.TabIndex = 0;
            // 
            // lblEvent
            // 
            this.lblEvent.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblEvent.Location = new System.Drawing.Point(47, 74);
            this.lblEvent.Name = "lblEvent";
            this.lblEvent.Size = new System.Drawing.Size(158, 30);
            this.lblEvent.TabIndex = 38;
            this.lblEvent.Text = "Мероприятие: ";
            // 
            // cboDirection
            // 
            this.cboDirection.DropDownWidth = 400;
            this.cboDirection.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.cboDirection.FormattingEnabled = true;
            this.cboDirection.Location = new System.Drawing.Point(211, 115);
            this.cboDirection.Name = "cboDirection";
            this.cboDirection.Size = new System.Drawing.Size(266, 38);
            this.cboDirection.TabIndex = 37;
            // 
            // lblDirection
            // 
            this.lblDirection.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblDirection.Location = new System.Drawing.Point(52, 118);
            this.lblDirection.Name = "lblDirection";
            this.lblDirection.Size = new System.Drawing.Size(153, 30);
            this.lblDirection.TabIndex = 36;
            this.lblDirection.Text = "Направление: ";
            // 
            // dtpDOB
            // 
            this.dtpDOB.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.dtpDOB.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDOB.Location = new System.Drawing.Point(211, 159);
            this.dtpDOB.MaxDate = new System.DateTime(2024, 12, 31, 0, 0, 0, 0);
            this.dtpDOB.MinDate = new System.DateTime(2023, 12, 22, 0, 0, 0, 0);
            this.dtpDOB.Name = "dtpDOB";
            this.dtpDOB.Size = new System.Drawing.Size(266, 35);
            this.dtpDOB.TabIndex = 41;
            this.dtpDOB.Value = new System.DateTime(2023, 12, 22, 0, 0, 0, 0);
            // 
            // lblDob
            // 
            this.lblDob.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblDob.Location = new System.Drawing.Point(1, 163);
            this.lblDob.Name = "lblDob";
            this.lblDob.Size = new System.Drawing.Size(207, 30);
            this.lblDob.TabIndex = 40;
            this.lblDob.Text = "Дата мероприятия:";
            // 
            // nudDays
            // 
            this.nudDays.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.nudDays.Location = new System.Drawing.Point(211, 199);
            this.nudDays.Maximum = new decimal(new int[] {
            3,
            0,
            0,
            0});
            this.nudDays.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.nudDays.Name = "nudDays";
            this.nudDays.Size = new System.Drawing.Size(266, 35);
            this.nudDays.TabIndex = 42;
            this.nudDays.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.nudDays.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // lblDays
            // 
            this.lblDays.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblDays.Location = new System.Drawing.Point(8, 201);
            this.lblDays.Name = "lblDays";
            this.lblDays.Size = new System.Drawing.Size(207, 30);
            this.lblDays.TabIndex = 43;
            this.lblDays.Text = "Дни мероприятия:";
            // 
            // cboCity
            // 
            this.cboCity.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboCity.DropDownWidth = 1000;
            this.cboCity.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.cboCity.FormattingEnabled = true;
            this.cboCity.Location = new System.Drawing.Point(689, 71);
            this.cboCity.Name = "cboCity";
            this.cboCity.Size = new System.Drawing.Size(266, 38);
            this.cboCity.TabIndex = 45;
            // 
            // lblCity
            // 
            this.lblCity.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblCity.Location = new System.Drawing.Point(604, 74);
            this.lblCity.Name = "lblCity";
            this.lblCity.Size = new System.Drawing.Size(79, 30);
            this.lblCity.TabIndex = 44;
            this.lblCity.Text = "Город:";
            // 
            // btnCancel
            // 
            this.btnCancel.BackColor = System.Drawing.Color.ForestGreen;
            this.btnCancel.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCancel.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnCancel.Location = new System.Drawing.Point(780, 260);
            this.btnCancel.Margin = new System.Windows.Forms.Padding(1);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(176, 36);
            this.btnCancel.TabIndex = 48;
            this.btnCancel.Text = "Отмена";
            this.btnCancel.UseVisualStyleBackColor = false;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnAddEvent
            // 
            this.btnAddEvent.BackColor = System.Drawing.Color.ForestGreen;
            this.btnAddEvent.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAddEvent.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnAddEvent.Location = new System.Drawing.Point(515, 260);
            this.btnAddEvent.Margin = new System.Windows.Forms.Padding(1);
            this.btnAddEvent.Name = "btnAddEvent";
            this.btnAddEvent.Size = new System.Drawing.Size(263, 36);
            this.btnAddEvent.TabIndex = 49;
            this.btnAddEvent.Text = "Добавить мероприятие";
            this.btnAddEvent.UseVisualStyleBackColor = false;
            this.btnAddEvent.Click += new System.EventHandler(this.btnAddEvent_Click);
            // 
            // nudDayActivity
            // 
            this.nudDayActivity.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.nudDayActivity.Location = new System.Drawing.Point(689, 116);
            this.nudDayActivity.Maximum = new decimal(new int[] {
            3,
            0,
            0,
            0});
            this.nudDayActivity.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.nudDayActivity.Name = "nudDayActivity";
            this.nudDayActivity.Size = new System.Drawing.Size(266, 35);
            this.nudDayActivity.TabIndex = 50;
            this.nudDayActivity.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.nudDayActivity.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // lblDayActivity
            // 
            this.lblDayActivity.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblDayActivity.Location = new System.Drawing.Point(503, 118);
            this.lblDayActivity.Name = "lblDayActivity";
            this.lblDayActivity.Size = new System.Drawing.Size(189, 30);
            this.lblDayActivity.TabIndex = 51;
            this.lblDayActivity.Text = "День активности: ";
            // 
            // dtpTime
            // 
            this.dtpTime.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.dtpTime.Format = System.Windows.Forms.DateTimePickerFormat.Time;
            this.dtpTime.Location = new System.Drawing.Point(689, 156);
            this.dtpTime.MaxDate = new System.DateTime(2024, 12, 31, 0, 0, 0, 0);
            this.dtpTime.MinDate = new System.DateTime(2023, 12, 22, 0, 0, 0, 0);
            this.dtpTime.Name = "dtpTime";
            this.dtpTime.Size = new System.Drawing.Size(266, 35);
            this.dtpTime.TabIndex = 53;
            this.dtpTime.Value = new System.DateTime(2023, 12, 22, 0, 0, 0, 0);
            // 
            // label1
            // 
            this.label1.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label1.Location = new System.Drawing.Point(479, 160);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(213, 30);
            this.label1.TabIndex = 52;
            this.label1.Text = "Начало активности:";
            // 
            // frmEvents
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.AntiqueWhite;
            this.ClientSize = new System.Drawing.Size(967, 306);
            this.Controls.Add(this.dtpTime);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.nudDayActivity);
            this.Controls.Add(this.lblDayActivity);
            this.Controls.Add(this.btnAddEvent);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.cboCity);
            this.Controls.Add(this.lblCity);
            this.Controls.Add(this.nudDays);
            this.Controls.Add(this.dtpDOB);
            this.Controls.Add(this.cboEvents);
            this.Controls.Add(this.lblEvent);
            this.Controls.Add(this.cboDirection);
            this.Controls.Add(this.lblDirection);
            this.Controls.Add(this.tlpTop);
            this.Controls.Add(this.lblDob);
            this.Controls.Add(this.lblDays);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "frmEvents";
            this.ShowIcon = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.tlpTop.ResumeLayout(false);
            this.tlpTop.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nudDays)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudDayActivity)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tlpTop;
        private System.Windows.Forms.Label lblWindow;
        private System.Windows.Forms.ComboBox cboEvents;
        private System.Windows.Forms.Label lblEvent;
        private System.Windows.Forms.ComboBox cboDirection;
        private System.Windows.Forms.Label lblDirection;
        private System.Windows.Forms.DateTimePicker dtpDOB;
        private System.Windows.Forms.Label lblDob;
        private System.Windows.Forms.NumericUpDown nudDays;
        private System.Windows.Forms.Label lblDays;
        private System.Windows.Forms.ComboBox cboCity;
        private System.Windows.Forms.Label lblCity;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnAddEvent;
        private System.Windows.Forms.NumericUpDown nudDayActivity;
        private System.Windows.Forms.Label lblDayActivity;
        private System.Windows.Forms.DateTimePicker dtpTime;
        private System.Windows.Forms.Label label1;
    }
}
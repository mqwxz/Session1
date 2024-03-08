namespace Session1
{
    partial class frmSystem
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            this.lblWindow = new System.Windows.Forms.Label();
            this.tlpTop = new System.Windows.Forms.TableLayoutPanel();
            this.dgvEvent = new System.Windows.Forms.DataGridView();
            this.lblEvents = new System.Windows.Forms.Label();
            this.picEvents = new System.Windows.Forms.PictureBox();
            this.label1 = new System.Windows.Forms.Label();
            this.grpFiltration = new System.Windows.Forms.GroupBox();
            this.dtpEvents = new System.Windows.Forms.DateTimePicker();
            this.lblDate = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.cboDirection = new System.Windows.Forms.ComboBox();
            this.btnAuth = new System.Windows.Forms.Button();
            this.pnlPic = new System.Windows.Forms.Panel();
            this.pnlDgv = new System.Windows.Forms.Panel();
            this.tlpTop.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEvent)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picEvents)).BeginInit();
            this.grpFiltration.SuspendLayout();
            this.pnlDgv.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblWindow
            // 
            this.lblWindow.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lblWindow.AutoSize = true;
            this.lblWindow.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblWindow.Location = new System.Drawing.Point(280, 17);
            this.lblWindow.Name = "lblWindow";
            this.lblWindow.Size = new System.Drawing.Size(239, 30);
            this.lblWindow.TabIndex = 0;
            this.lblWindow.Text = "Главное окно системы";
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
            this.tlpTop.TabIndex = 1;
            // 
            // dgvEvent
            // 
            this.dgvEvent.AllowUserToAddRows = false;
            this.dgvEvent.AllowUserToDeleteRows = false;
            this.dgvEvent.AllowUserToResizeColumns = false;
            this.dgvEvent.AllowUserToResizeRows = false;
            this.dgvEvent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.dgvEvent.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvEvent.BackgroundColor = System.Drawing.Color.White;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Yu Gothic UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvEvent.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvEvent.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Yu Gothic UI", 8.25F);
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvEvent.DefaultCellStyle = dataGridViewCellStyle2;
            this.dgvEvent.Location = new System.Drawing.Point(-2, -2);
            this.dgvEvent.Margin = new System.Windows.Forms.Padding(0);
            this.dgvEvent.Name = "dgvEvent";
            this.dgvEvent.ReadOnly = true;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Yu Gothic UI", 8.25F);
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvEvent.RowHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvEvent.RowHeadersVisible = false;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Yu Gothic UI", 8.25F);
            this.dgvEvent.RowsDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvEvent.Size = new System.Drawing.Size(538, 209);
            this.dgvEvent.TabIndex = 3;
            this.dgvEvent.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvEvent_CellClick);
            // 
            // lblEvents
            // 
            this.lblEvents.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lblEvents.AutoSize = true;
            this.lblEvents.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblEvents.Location = new System.Drawing.Point(236, 68);
            this.lblEvents.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.lblEvents.Name = "lblEvents";
            this.lblEvents.Size = new System.Drawing.Size(151, 30);
            this.lblEvents.TabIndex = 4;
            this.lblEvents.Text = "Мероприятия";
            // 
            // picEvents
            // 
            this.picEvents.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.picEvents.Location = new System.Drawing.Point(562, 106);
            this.picEvents.Margin = new System.Windows.Forms.Padding(0);
            this.picEvents.Name = "picEvents";
            this.picEvents.Size = new System.Drawing.Size(224, 207);
            this.picEvents.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picEvents.TabIndex = 5;
            this.picEvents.TabStop = false;
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label1.Location = new System.Drawing.Point(628, 68);
            this.label1.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(96, 30);
            this.label1.TabIndex = 6;
            this.label1.Text = "Логотип";
            // 
            // grpFiltration
            // 
            this.grpFiltration.BackColor = System.Drawing.Color.AntiqueWhite;
            this.grpFiltration.Controls.Add(this.dtpEvents);
            this.grpFiltration.Controls.Add(this.lblDate);
            this.grpFiltration.Controls.Add(this.label2);
            this.grpFiltration.Controls.Add(this.cboDirection);
            this.grpFiltration.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.grpFiltration.Location = new System.Drawing.Point(14, 323);
            this.grpFiltration.Margin = new System.Windows.Forms.Padding(3, 5, 3, 3);
            this.grpFiltration.Name = "grpFiltration";
            this.grpFiltration.Size = new System.Drawing.Size(674, 115);
            this.grpFiltration.TabIndex = 7;
            this.grpFiltration.TabStop = false;
            this.grpFiltration.Text = "Фильтрация: ";
            // 
            // dtpEvents
            // 
            this.dtpEvents.Cursor = System.Windows.Forms.Cursors.Default;
            this.dtpEvents.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.dtpEvents.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpEvents.Location = new System.Drawing.Point(196, 70);
            this.dtpEvents.MaxDate = new System.DateTime(2025, 1, 1, 0, 0, 0, 0);
            this.dtpEvents.MinDate = new System.DateTime(2020, 1, 1, 0, 0, 0, 0);
            this.dtpEvents.Name = "dtpEvents";
            this.dtpEvents.Size = new System.Drawing.Size(150, 35);
            this.dtpEvents.TabIndex = 8;
            this.dtpEvents.Value = new System.DateTime(2023, 12, 20, 0, 0, 0, 0);
            this.dtpEvents.ValueChanged += new System.EventHandler(this.dtpEvents_ValueChanged);
            // 
            // lblDate
            // 
            this.lblDate.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lblDate.AutoSize = true;
            this.lblDate.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold);
            this.lblDate.Location = new System.Drawing.Point(100, 74);
            this.lblDate.Margin = new System.Windows.Forms.Padding(3);
            this.lblDate.Name = "lblDate";
            this.lblDate.Size = new System.Drawing.Size(90, 30);
            this.lblDate.TabIndex = 10;
            this.lblDate.Text = "По дате";
            // 
            // label2
            // 
            this.label2.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label2.Location = new System.Drawing.Point(6, 29);
            this.label2.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(184, 30);
            this.label2.TabIndex = 8;
            this.label2.Text = "По направлению";
            // 
            // cboDirection
            // 
            this.cboDirection.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboDirection.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.cboDirection.FormattingEnabled = true;
            this.cboDirection.IntegralHeight = false;
            this.cboDirection.Items.AddRange(new object[] {
            "Фильтрация отключена"});
            this.cboDirection.Location = new System.Drawing.Point(196, 26);
            this.cboDirection.Name = "cboDirection";
            this.cboDirection.Size = new System.Drawing.Size(472, 38);
            this.cboDirection.TabIndex = 0;
            this.cboDirection.SelectedIndexChanged += new System.EventHandler(this.cboDirection_SelectedIndexChanged);
            // 
            // btnAuth
            // 
            this.btnAuth.BackColor = System.Drawing.Color.ForestGreen;
            this.btnAuth.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAuth.Font = new System.Drawing.Font("Yu Gothic UI Semibold", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.btnAuth.Location = new System.Drawing.Point(694, 336);
            this.btnAuth.Name = "btnAuth";
            this.btnAuth.Size = new System.Drawing.Size(94, 102);
            this.btnAuth.TabIndex = 8;
            this.btnAuth.Text = "Авторизация";
            this.btnAuth.UseVisualStyleBackColor = false;
            this.btnAuth.Click += new System.EventHandler(this.btnAuth_Click);
            // 
            // pnlPic
            // 
            this.pnlPic.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pnlPic.Location = new System.Drawing.Point(560, 104);
            this.pnlPic.Name = "pnlPic";
            this.pnlPic.Size = new System.Drawing.Size(228, 211);
            this.pnlPic.TabIndex = 9;
            // 
            // pnlDgv
            // 
            this.pnlDgv.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pnlDgv.Controls.Add(this.dgvEvent);
            this.pnlDgv.Location = new System.Drawing.Point(14, 106);
            this.pnlDgv.Name = "pnlDgv";
            this.pnlDgv.Size = new System.Drawing.Size(538, 207);
            this.pnlDgv.TabIndex = 10;
            // 
            // frmSystem
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.AntiqueWhite;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnAuth);
            this.Controls.Add(this.grpFiltration);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.picEvents);
            this.Controls.Add(this.lblEvents);
            this.Controls.Add(this.tlpTop);
            this.Controls.Add(this.pnlPic);
            this.Controls.Add(this.pnlDgv);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "frmSystem";
            this.ShowIcon = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.tlpTop.ResumeLayout(false);
            this.tlpTop.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEvent)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picEvents)).EndInit();
            this.grpFiltration.ResumeLayout(false);
            this.grpFiltration.PerformLayout();
            this.pnlDgv.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label lblWindow;
        private System.Windows.Forms.TableLayoutPanel tlpTop;
        private System.Windows.Forms.DataGridView dgvEvent;
        private System.Windows.Forms.Label lblEvents;
        private System.Windows.Forms.PictureBox picEvents;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox grpFiltration;
        private System.Windows.Forms.ComboBox cboDirection;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lblDate;
        private System.Windows.Forms.DateTimePicker dtpEvents;
        private System.Windows.Forms.Button btnAuth;
        private System.Windows.Forms.Panel pnlPic;
        private System.Windows.Forms.Panel pnlDgv;
    }
}


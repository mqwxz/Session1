namespace Session1.UI
{
    partial class frmRecording
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
            this.lblEvent = new System.Windows.Forms.Label();
            this.lblDirection = new System.Windows.Forms.Label();
            this.btnJury1 = new System.Windows.Forms.Button();
            this.btnJury2 = new System.Windows.Forms.Button();
            this.btnJury3 = new System.Windows.Forms.Button();
            this.btnJury4 = new System.Windows.Forms.Button();
            this.btnJury5 = new System.Windows.Forms.Button();
            this.btnModerator = new System.Windows.Forms.Button();
            this.btnClose = new System.Windows.Forms.Button();
            this.tlpTop = new System.Windows.Forms.TableLayoutPanel();
            this.lblWindow = new System.Windows.Forms.Label();
            this.lblId = new System.Windows.Forms.Label();
            this.lblRole = new System.Windows.Forms.Label();
            this.tlpTop.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblEvent
            // 
            this.lblEvent.AutoSize = true;
            this.lblEvent.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold);
            this.lblEvent.Location = new System.Drawing.Point(12, 42);
            this.lblEvent.Name = "lblEvent";
            this.lblEvent.Size = new System.Drawing.Size(0, 30);
            this.lblEvent.TabIndex = 0;
            this.lblEvent.Visible = false;
            // 
            // lblDirection
            // 
            this.lblDirection.AutoSize = true;
            this.lblDirection.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold);
            this.lblDirection.Location = new System.Drawing.Point(169, 101);
            this.lblDirection.Name = "lblDirection";
            this.lblDirection.Size = new System.Drawing.Size(0, 30);
            this.lblDirection.TabIndex = 1;
            this.lblDirection.Visible = false;
            // 
            // btnJury1
            // 
            this.btnJury1.BackColor = System.Drawing.Color.ForestGreen;
            this.btnJury1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnJury1.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnJury1.Location = new System.Drawing.Point(10, 148);
            this.btnJury1.Margin = new System.Windows.Forms.Padding(1);
            this.btnJury1.Name = "btnJury1";
            this.btnJury1.Size = new System.Drawing.Size(91, 36);
            this.btnJury1.TabIndex = 40;
            this.btnJury1.Text = "Жюри 1";
            this.btnJury1.UseVisualStyleBackColor = false;
            this.btnJury1.Click += new System.EventHandler(this.btnJury1_Click);
            // 
            // btnJury2
            // 
            this.btnJury2.BackColor = System.Drawing.Color.ForestGreen;
            this.btnJury2.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnJury2.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnJury2.Location = new System.Drawing.Point(103, 148);
            this.btnJury2.Margin = new System.Windows.Forms.Padding(1);
            this.btnJury2.Name = "btnJury2";
            this.btnJury2.Size = new System.Drawing.Size(95, 36);
            this.btnJury2.TabIndex = 41;
            this.btnJury2.Text = "Жюри 2";
            this.btnJury2.UseVisualStyleBackColor = false;
            this.btnJury2.Click += new System.EventHandler(this.btnJury2_Click);
            // 
            // btnJury3
            // 
            this.btnJury3.BackColor = System.Drawing.Color.ForestGreen;
            this.btnJury3.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnJury3.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnJury3.Location = new System.Drawing.Point(200, 148);
            this.btnJury3.Margin = new System.Windows.Forms.Padding(1);
            this.btnJury3.Name = "btnJury3";
            this.btnJury3.Size = new System.Drawing.Size(95, 36);
            this.btnJury3.TabIndex = 42;
            this.btnJury3.Text = "Жюри 3";
            this.btnJury3.UseVisualStyleBackColor = false;
            this.btnJury3.Click += new System.EventHandler(this.btnJury3_Click);
            // 
            // btnJury4
            // 
            this.btnJury4.BackColor = System.Drawing.Color.ForestGreen;
            this.btnJury4.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnJury4.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnJury4.Location = new System.Drawing.Point(297, 148);
            this.btnJury4.Margin = new System.Windows.Forms.Padding(1);
            this.btnJury4.Name = "btnJury4";
            this.btnJury4.Size = new System.Drawing.Size(95, 36);
            this.btnJury4.TabIndex = 43;
            this.btnJury4.Text = "Жюри 4";
            this.btnJury4.UseVisualStyleBackColor = false;
            this.btnJury4.Click += new System.EventHandler(this.btnJury4_Click);
            // 
            // btnJury5
            // 
            this.btnJury5.BackColor = System.Drawing.Color.ForestGreen;
            this.btnJury5.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnJury5.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnJury5.Location = new System.Drawing.Point(394, 148);
            this.btnJury5.Margin = new System.Windows.Forms.Padding(1);
            this.btnJury5.Name = "btnJury5";
            this.btnJury5.Size = new System.Drawing.Size(95, 36);
            this.btnJury5.TabIndex = 44;
            this.btnJury5.Text = "Жюри 5";
            this.btnJury5.UseVisualStyleBackColor = false;
            this.btnJury5.Click += new System.EventHandler(this.btnJury5_Click);
            // 
            // btnModerator
            // 
            this.btnModerator.BackColor = System.Drawing.Color.ForestGreen;
            this.btnModerator.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnModerator.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnModerator.Location = new System.Drawing.Point(10, 189);
            this.btnModerator.Margin = new System.Windows.Forms.Padding(1);
            this.btnModerator.Name = "btnModerator";
            this.btnModerator.Size = new System.Drawing.Size(382, 36);
            this.btnModerator.TabIndex = 45;
            this.btnModerator.Text = "Модератор";
            this.btnModerator.UseVisualStyleBackColor = false;
            this.btnModerator.Click += new System.EventHandler(this.btnModerator_Click);
            // 
            // btnClose
            // 
            this.btnClose.BackColor = System.Drawing.Color.ForestGreen;
            this.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnClose.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnClose.Location = new System.Drawing.Point(394, 189);
            this.btnClose.Margin = new System.Windows.Forms.Padding(1);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(95, 36);
            this.btnClose.TabIndex = 46;
            this.btnClose.Text = "Отмена";
            this.btnClose.UseVisualStyleBackColor = false;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
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
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 39F));
            this.tlpTop.Size = new System.Drawing.Size(501, 39);
            this.tlpTop.TabIndex = 47;
            // 
            // lblWindow
            // 
            this.lblWindow.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lblWindow.AutoSize = true;
            this.lblWindow.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblWindow.Location = new System.Drawing.Point(79, 4);
            this.lblWindow.Name = "lblWindow";
            this.lblWindow.Size = new System.Drawing.Size(343, 30);
            this.lblWindow.TabIndex = 0;
            this.lblWindow.Text = "Заполнение жюри/модераторов";
            // 
            // lblId
            // 
            this.lblId.AutoSize = true;
            this.lblId.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold);
            this.lblId.Location = new System.Drawing.Point(231, 42);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(0, 30);
            this.lblId.TabIndex = 48;
            this.lblId.Visible = false;
            // 
            // lblRole
            // 
            this.lblRole.AutoSize = true;
            this.lblRole.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold);
            this.lblRole.Location = new System.Drawing.Point(23, 101);
            this.lblRole.Name = "lblRole";
            this.lblRole.Size = new System.Drawing.Size(0, 30);
            this.lblRole.TabIndex = 49;
            this.lblRole.Visible = false;
            // 
            // frmRecording
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.AntiqueWhite;
            this.ClientSize = new System.Drawing.Size(501, 235);
            this.Controls.Add(this.lblRole);
            this.Controls.Add(this.lblId);
            this.Controls.Add(this.tlpTop);
            this.Controls.Add(this.btnClose);
            this.Controls.Add(this.btnModerator);
            this.Controls.Add(this.btnJury5);
            this.Controls.Add(this.btnJury4);
            this.Controls.Add(this.btnJury3);
            this.Controls.Add(this.btnJury2);
            this.Controls.Add(this.btnJury1);
            this.Controls.Add(this.lblDirection);
            this.Controls.Add(this.lblEvent);
            this.MaximizeBox = false;
            this.Name = "frmRecording";
            this.ShowIcon = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Load += new System.EventHandler(this.frmRecording_Load);
            this.tlpTop.ResumeLayout(false);
            this.tlpTop.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblEvent;
        private System.Windows.Forms.Label lblDirection;
        private System.Windows.Forms.Button btnJury1;
        private System.Windows.Forms.Button btnJury2;
        private System.Windows.Forms.Button btnJury3;
        private System.Windows.Forms.Button btnJury4;
        private System.Windows.Forms.Button btnJury5;
        private System.Windows.Forms.Button btnModerator;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.TableLayoutPanel tlpTop;
        private System.Windows.Forms.Label lblWindow;
        private System.Windows.Forms.Label lblId;
        private System.Windows.Forms.Label lblRole;
    }
}
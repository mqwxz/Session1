namespace Session1.UI
{
    partial class frmPersonalArea
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
            this.btnClose = new System.Windows.Forms.Button();
            this.cboCountry = new System.Windows.Forms.ComboBox();
            this.mtxPhone = new System.Windows.Forms.MaskedTextBox();
            this.cboRole = new System.Windows.Forms.ComboBox();
            this.cboEvents = new System.Windows.Forms.ComboBox();
            this.lblEvent = new System.Windows.Forms.Label();
            this.cboDirection = new System.Windows.Forms.ComboBox();
            this.lblDirection = new System.Windows.Forms.Label();
            this.lblCountry = new System.Windows.Forms.Label();
            this.dtpDOB = new System.Windows.Forms.DateTimePicker();
            this.lblDob = new System.Windows.Forms.Label();
            this.cboGender = new System.Windows.Forms.ComboBox();
            this.lblPhone = new System.Windows.Forms.Label();
            this.txtEmail = new System.Windows.Forms.TextBox();
            this.lblEmail = new System.Windows.Forms.Label();
            this.lblRole = new System.Windows.Forms.Label();
            this.lblGender = new System.Windows.Forms.Label();
            this.txtFIO = new System.Windows.Forms.TextBox();
            this.lblFIO = new System.Windows.Forms.Label();
            this.txtID = new System.Windows.Forms.TextBox();
            this.lblLogin = new System.Windows.Forms.Label();
            this.btnBrowse = new System.Windows.Forms.Button();
            this.picPhoto = new System.Windows.Forms.PictureBox();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.lblPassword = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnUpdate = new System.Windows.Forms.Button();
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
            this.tlpTop.Size = new System.Drawing.Size(741, 65);
            this.tlpTop.TabIndex = 4;
            // 
            // lblWindow
            // 
            this.lblWindow.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lblWindow.AutoSize = true;
            this.lblWindow.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblWindow.Location = new System.Drawing.Point(281, 17);
            this.lblWindow.Name = "lblWindow";
            this.lblWindow.Size = new System.Drawing.Size(179, 30);
            this.lblWindow.TabIndex = 0;
            this.lblWindow.Text = "Личный кабинет";
            // 
            // btnClose
            // 
            this.btnClose.BackColor = System.Drawing.Color.ForestGreen;
            this.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnClose.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnClose.Location = new System.Drawing.Point(621, 497);
            this.btnClose.Margin = new System.Windows.Forms.Padding(1);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(110, 36);
            this.btnClose.TabIndex = 47;
            this.btnClose.Text = "Назад";
            this.btnClose.UseVisualStyleBackColor = false;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
            // 
            // cboCountry
            // 
            this.cboCountry.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboCountry.DropDownWidth = 400;
            this.cboCountry.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.cboCountry.FormattingEnabled = true;
            this.cboCountry.Items.AddRange(new object[] {
            "",
            "Абхазия",
            "Австралия",
            "Австрия",
            "Азербайджан",
            "Албания",
            "Алжир",
            "Американское Самоа",
            "Ангилья",
            "Ангола",
            "Андорра",
            "Антарктида",
            "Антигуа и Барбуда",
            "Аргентина",
            "Армения",
            "Аруба",
            "Афганистан",
            "Багамы",
            "Бангладеш",
            "Барбадос",
            "Бахрейн",
            "Беларусь",
            "Белиз",
            "Бельгия",
            "Бенин",
            "Бермуды",
            "Болгария",
            "Боливия, Многонациональное Государство",
            "Бонайре, Саба и Синт-Эстатиус",
            "Босния и Герцеговина",
            "Ботсвана",
            "Бразилия",
            "Британская территория в Индийском океане",
            "Бруней-Даруссалам",
            "Буркина-Фасо",
            "Бурунди",
            "Бутан",
            "Вануату",
            "Венгрия",
            "Венесуэла Боливарианская Республика",
            "Виргинские острова, Британские",
            "Виргинские острова, США",
            "Вьетнам",
            "Габон",
            "Гаити",
            "Гайана",
            "Гамбия",
            "Гана",
            "Гваделупа",
            "Гватемала",
            "Гвинея",
            "Гвинея-Бисау",
            "Германия",
            "Гернси",
            "Гибралтар",
            "Гондурас",
            "Гонконг",
            "Гренада",
            "Гренландия",
            "Греция",
            "Грузия",
            "Гуам",
            "Дания",
            "Джерси",
            "Джибути",
            "Доминика",
            "Доминиканская Республика",
            "Египет",
            "Замбия",
            "Западная Сахара",
            "Зимбабве",
            "Израиль",
            "Индия",
            "Индонезия",
            "Иордания",
            "Ирак",
            "Иран, Исламская Республика",
            "Ирландия",
            "Исландия",
            "Испания",
            "Италия",
            "Йемен",
            "Кабо-Верде",
            "Казахстан",
            "Камбоджа",
            "Камерун",
            "Канада",
            "Катар",
            "Кения",
            "Кипр",
            "Киргизия",
            "Кирибати",
            "Китай",
            "Кокосовые (Килинг) острова",
            "Колумбия",
            "Коморы",
            "Конго",
            "Конго, Демократическая Республика",
            "Корея, Народно-Демократическая Республика",
            "Корея, Республика",
            "Коста-Рика",
            "Кот д\'Ивуар",
            "Куба",
            "Кувейт",
            "Кюрасао",
            "Лаос",
            "Латвия",
            "Лесото",
            "Ливан",
            "Ливийская Арабская Джамахирия",
            "Либерия",
            "Лихтенштейн",
            "Литва",
            "Люксембург",
            "Маврикий",
            "Мавритания",
            "Мадагаскар",
            "Майотта",
            "Макао",
            "Малави",
            "Малайзия",
            "Мали",
            "Малые Тихоокеанские отдаленные острова Соединенных Штатов",
            "Мальдивы",
            "Мальта",
            "Марокко",
            "Мартиника",
            "Маршалловы острова",
            "Мексика",
            "Микронезия, Федеративные Штаты",
            "Мозамбик",
            "Молдова, Республика",
            "Монако",
            "Монголия",
            "Монтсеррат",
            "Мьянма",
            "Намибия",
            "Науру",
            "Непал",
            "Нигер",
            "Нигерия",
            "Нидерланды",
            "Никарагуа",
            "Ниуэ",
            "Новая Зеландия",
            "Новая Каледония",
            "Норвегия",
            "Объединенные Арабские Эмираты",
            "Оман",
            "Остров Буве",
            "Остров Мэн",
            "Остров Норфолк",
            "Остров Рождества",
            "Остров Херд и острова Макдональд",
            "Острова Кайман",
            "Острова Кука",
            "Острова Теркс и Кайкос",
            "Пакистан",
            "Палау",
            "Палестинская территория, оккупированная",
            "Панама",
            "Папский Престол (Государство — город Ватикан)",
            "Папуа-Новая Гвинея",
            "Парагвай",
            "Перу",
            "Питкерн",
            "Польша",
            "Португалия",
            "Пуэрто-Рико",
            "Республика Македония",
            "Реюньон",
            "Россия",
            "Руанда",
            "Румыния",
            "Самоа",
            "Сан-Марино",
            "Сан-Томе и Принсипи",
            "Саудовская Аравия",
            "Свазиленд",
            "Святая Елена, Остров вознесения, Тристан-да-Кунья",
            "Северные Марианские острова",
            "Сен-Бартельми",
            "Сен-Мартен",
            "Сенегал",
            "Сент-Винсент и Гренадины",
            "Сент-Люсия",
            "Сент-Китс и Невис",
            "Сент-Пьер и Микелон",
            "Сербия",
            "Сейшелы",
            "Сингапур",
            "Синт-Мартен",
            "Сирийская Арабская Республика",
            "Словакия",
            "Словения",
            "Соединенное Королевство",
            "Соединенные Штаты",
            "Соломоновы острова",
            "Сомали",
            "Судан",
            "Суринам",
            "Сьерра-Леоне",
            "Таджикистан",
            "Таиланд",
            "Тайвань (Китай)",
            "Танзания, Объединенная Республика",
            "Тимор-Лесте",
            "Того",
            "Токелау",
            "Тонга",
            "Тринидад и Тобаго",
            "Тувалу",
            "Тунис",
            "Туркмения",
            "Турция",
            "Уганда",
            "Узбекистан",
            "Украина",
            "Уоллис и Футуна",
            "Уругвай",
            "Фарерские острова",
            "Фиджи",
            "Филиппины",
            "Финляндия",
            "Фолклендские острова (Мальвинские)",
            "Франция",
            "Французская Гвиана",
            "Французская Полинезия",
            "Французские Южные территории",
            "Хорватия",
            "Центрально-Африканская Республика",
            "Чад",
            "Черногория",
            "Чешская Республика",
            "Чили",
            "Швейцария",
            "Швеция",
            "Шпицберген и Ян Майен",
            "Шри-Ланка",
            "Эквадор",
            "Экваториальная Гвинея",
            "Эландские острова",
            "Эль-Сальвадор",
            "Эритрея",
            "Эстония",
            "Эфиопия",
            "Южная Африка",
            "Южная Джорджия и Южные Сандвичевы острова",
            "Южная Осетия",
            "Южный Судан",
            "Ямайка",
            "Япония"});
            this.cboCountry.Location = new System.Drawing.Point(171, 320);
            this.cboCountry.MaxDropDownItems = 20;
            this.cboCountry.Name = "cboCountry";
            this.cboCountry.Size = new System.Drawing.Size(266, 38);
            this.cboCountry.TabIndex = 1;
            // 
            // mtxPhone
            // 
            this.mtxPhone.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.mtxPhone.Location = new System.Drawing.Point(171, 279);
            this.mtxPhone.Mask = "+7(999)-000-00-00";
            this.mtxPhone.Name = "mtxPhone";
            this.mtxPhone.Size = new System.Drawing.Size(266, 35);
            this.mtxPhone.TabIndex = 67;
            // 
            // cboRole
            // 
            this.cboRole.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboRole.Enabled = false;
            this.cboRole.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.cboRole.FormattingEnabled = true;
            this.cboRole.Items.AddRange(new object[] {
            "Модератор",
            "Жюри"});
            this.cboRole.Location = new System.Drawing.Point(170, 195);
            this.cboRole.Name = "cboRole";
            this.cboRole.Size = new System.Drawing.Size(266, 38);
            this.cboRole.TabIndex = 66;
            // 
            // cboEvents
            // 
            this.cboEvents.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboEvents.DropDownWidth = 1000;
            this.cboEvents.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.cboEvents.FormattingEnabled = true;
            this.cboEvents.Location = new System.Drawing.Point(170, 492);
            this.cboEvents.Name = "cboEvents";
            this.cboEvents.Size = new System.Drawing.Size(266, 38);
            this.cboEvents.TabIndex = 65;
            this.cboEvents.Visible = false;
            // 
            // lblEvent
            // 
            this.lblEvent.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblEvent.Location = new System.Drawing.Point(7, 495);
            this.lblEvent.Name = "lblEvent";
            this.lblEvent.Size = new System.Drawing.Size(158, 30);
            this.lblEvent.TabIndex = 64;
            this.lblEvent.Text = "Мероприятие: ";
            this.lblEvent.Visible = false;
            // 
            // cboDirection
            // 
            this.cboDirection.DropDownWidth = 400;
            this.cboDirection.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.cboDirection.FormattingEnabled = true;
            this.cboDirection.Location = new System.Drawing.Point(170, 448);
            this.cboDirection.Name = "cboDirection";
            this.cboDirection.Size = new System.Drawing.Size(266, 38);
            this.cboDirection.TabIndex = 63;
            this.cboDirection.Visible = false;
            // 
            // lblDirection
            // 
            this.lblDirection.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblDirection.Location = new System.Drawing.Point(11, 454);
            this.lblDirection.Name = "lblDirection";
            this.lblDirection.Size = new System.Drawing.Size(153, 30);
            this.lblDirection.TabIndex = 62;
            this.lblDirection.Text = "Направление: ";
            this.lblDirection.Visible = false;
            // 
            // lblCountry
            // 
            this.lblCountry.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblCountry.Location = new System.Drawing.Point(77, 325);
            this.lblCountry.Name = "lblCountry";
            this.lblCountry.Size = new System.Drawing.Size(88, 30);
            this.lblCountry.TabIndex = 61;
            this.lblCountry.Text = "Страна: ";
            // 
            // dtpDOB
            // 
            this.dtpDOB.Enabled = false;
            this.dtpDOB.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.dtpDOB.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDOB.Location = new System.Drawing.Point(170, 366);
            this.dtpDOB.MaxDate = new System.DateTime(2024, 12, 31, 0, 0, 0, 0);
            this.dtpDOB.MinDate = new System.DateTime(1950, 1, 1, 0, 0, 0, 0);
            this.dtpDOB.Name = "dtpDOB";
            this.dtpDOB.Size = new System.Drawing.Size(266, 35);
            this.dtpDOB.TabIndex = 60;
            this.dtpDOB.Value = new System.DateTime(1950, 1, 1, 0, 0, 0, 0);
            // 
            // lblDob
            // 
            this.lblDob.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblDob.Location = new System.Drawing.Point(119, 370);
            this.lblDob.Name = "lblDob";
            this.lblDob.Size = new System.Drawing.Size(45, 30);
            this.lblDob.TabIndex = 59;
            this.lblDob.Text = "ДР:";
            // 
            // cboGender
            // 
            this.cboGender.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboGender.Enabled = false;
            this.cboGender.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.cboGender.FormattingEnabled = true;
            this.cboGender.Items.AddRange(new object[] {
            "мужской",
            "женский"});
            this.cboGender.Location = new System.Drawing.Point(170, 149);
            this.cboGender.Name = "cboGender";
            this.cboGender.Size = new System.Drawing.Size(266, 38);
            this.cboGender.TabIndex = 58;
            // 
            // lblPhone
            // 
            this.lblPhone.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblPhone.Location = new System.Drawing.Point(61, 282);
            this.lblPhone.Name = "lblPhone";
            this.lblPhone.Size = new System.Drawing.Size(104, 30);
            this.lblPhone.TabIndex = 57;
            this.lblPhone.Text = "Телефон: ";
            // 
            // txtEmail
            // 
            this.txtEmail.BackColor = System.Drawing.SystemColors.Window;
            this.txtEmail.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.txtEmail.Location = new System.Drawing.Point(170, 239);
            this.txtEmail.MaxLength = 255;
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(266, 35);
            this.txtEmail.TabIndex = 56;
            // 
            // lblEmail
            // 
            this.lblEmail.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblEmail.Location = new System.Drawing.Point(95, 242);
            this.lblEmail.Name = "lblEmail";
            this.lblEmail.Size = new System.Drawing.Size(69, 30);
            this.lblEmail.TabIndex = 55;
            this.lblEmail.Text = "Email: ";
            // 
            // lblRole
            // 
            this.lblRole.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblRole.Location = new System.Drawing.Point(98, 200);
            this.lblRole.Name = "lblRole";
            this.lblRole.Size = new System.Drawing.Size(66, 30);
            this.lblRole.TabIndex = 54;
            this.lblRole.Text = "Роль: ";
            // 
            // lblGender
            // 
            this.lblGender.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblGender.Location = new System.Drawing.Point(104, 154);
            this.lblGender.Name = "lblGender";
            this.lblGender.Size = new System.Drawing.Size(60, 30);
            this.lblGender.TabIndex = 53;
            this.lblGender.Text = "Пол: ";
            // 
            // txtFIO
            // 
            this.txtFIO.BackColor = System.Drawing.SystemColors.Window;
            this.txtFIO.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.txtFIO.Location = new System.Drawing.Point(170, 110);
            this.txtFIO.MaxLength = 255;
            this.txtFIO.Name = "txtFIO";
            this.txtFIO.Size = new System.Drawing.Size(266, 35);
            this.txtFIO.TabIndex = 52;
            // 
            // lblFIO
            // 
            this.lblFIO.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblFIO.Location = new System.Drawing.Point(97, 113);
            this.lblFIO.Name = "lblFIO";
            this.lblFIO.Size = new System.Drawing.Size(67, 30);
            this.lblFIO.TabIndex = 51;
            this.lblFIO.Text = "ФИО:";
            // 
            // txtID
            // 
            this.txtID.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.txtID.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.txtID.Location = new System.Drawing.Point(171, 71);
            this.txtID.MaxLength = 20;
            this.txtID.Name = "txtID";
            this.txtID.ReadOnly = true;
            this.txtID.Size = new System.Drawing.Size(266, 35);
            this.txtID.TabIndex = 50;
            this.txtID.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lblLogin
            // 
            this.lblLogin.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblLogin.Location = new System.Drawing.Point(43, 74);
            this.lblLogin.Name = "lblLogin";
            this.lblLogin.Size = new System.Drawing.Size(122, 30);
            this.lblLogin.TabIndex = 49;
            this.lblLogin.Text = "Id Number:";
            // 
            // btnBrowse
            // 
            this.btnBrowse.BackColor = System.Drawing.Color.ForestGreen;
            this.btnBrowse.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnBrowse.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnBrowse.Location = new System.Drawing.Point(467, 358);
            this.btnBrowse.Name = "btnBrowse";
            this.btnBrowse.Size = new System.Drawing.Size(266, 36);
            this.btnBrowse.TabIndex = 71;
            this.btnBrowse.Text = "Изменить фото";
            this.btnBrowse.UseVisualStyleBackColor = false;
            this.btnBrowse.Click += new System.EventHandler(this.btnBrowse_Click);
            // 
            // picPhoto
            // 
            this.picPhoto.Location = new System.Drawing.Point(469, 71);
            this.picPhoto.Margin = new System.Windows.Forms.Padding(0);
            this.picPhoto.Name = "picPhoto";
            this.picPhoto.Size = new System.Drawing.Size(262, 279);
            this.picPhoto.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picPhoto.TabIndex = 70;
            this.picPhoto.TabStop = false;
            // 
            // txtPassword
            // 
            this.txtPassword.BackColor = System.Drawing.SystemColors.Window;
            this.txtPassword.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F);
            this.txtPassword.Location = new System.Drawing.Point(171, 407);
            this.txtPassword.MaxLength = 64;
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.Size = new System.Drawing.Size(266, 35);
            this.txtPassword.TabIndex = 69;
            // 
            // lblPassword
            // 
            this.lblPassword.Font = new System.Drawing.Font("Yu Gothic UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblPassword.Location = new System.Drawing.Point(72, 410);
            this.lblPassword.Name = "lblPassword";
            this.lblPassword.Size = new System.Drawing.Size(93, 30);
            this.lblPassword.TabIndex = 68;
            this.lblPassword.Text = "Пароль: ";
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel1.Location = new System.Drawing.Point(467, 69);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(266, 283);
            this.panel1.TabIndex = 74;
            // 
            // btnUpdate
            // 
            this.btnUpdate.BackColor = System.Drawing.Color.ForestGreen;
            this.btnUpdate.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnUpdate.Font = new System.Drawing.Font("Yu Gothic UI", 14.25F, System.Drawing.FontStyle.Bold);
            this.btnUpdate.Location = new System.Drawing.Point(467, 497);
            this.btnUpdate.Margin = new System.Windows.Forms.Padding(1);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(150, 36);
            this.btnUpdate.TabIndex = 75;
            this.btnUpdate.Text = "Изменить";
            this.btnUpdate.UseVisualStyleBackColor = false;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // frmPersonalArea
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.AntiqueWhite;
            this.ClientSize = new System.Drawing.Size(741, 543);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.btnBrowse);
            this.Controls.Add(this.picPhoto);
            this.Controls.Add(this.txtPassword);
            this.Controls.Add(this.lblPassword);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.cboCountry);
            this.Controls.Add(this.mtxPhone);
            this.Controls.Add(this.cboRole);
            this.Controls.Add(this.cboEvents);
            this.Controls.Add(this.lblEvent);
            this.Controls.Add(this.cboDirection);
            this.Controls.Add(this.lblDirection);
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
            this.Controls.Add(this.btnClose);
            this.Controls.Add(this.tlpTop);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "frmPersonalArea";
            this.ShowIcon = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Load += new System.EventHandler(this.frmPersonalArea_Load);
            this.tlpTop.ResumeLayout(false);
            this.tlpTop.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picPhoto)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tlpTop;
        private System.Windows.Forms.Label lblWindow;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.ComboBox cboCountry;
        private System.Windows.Forms.MaskedTextBox mtxPhone;
        private System.Windows.Forms.ComboBox cboRole;
        private System.Windows.Forms.ComboBox cboEvents;
        private System.Windows.Forms.Label lblEvent;
        private System.Windows.Forms.ComboBox cboDirection;
        private System.Windows.Forms.Label lblDirection;
        private System.Windows.Forms.Label lblCountry;
        private System.Windows.Forms.DateTimePicker dtpDOB;
        private System.Windows.Forms.Label lblDob;
        private System.Windows.Forms.ComboBox cboGender;
        private System.Windows.Forms.Label lblPhone;
        private System.Windows.Forms.TextBox txtEmail;
        private System.Windows.Forms.Label lblEmail;
        private System.Windows.Forms.Label lblRole;
        private System.Windows.Forms.Label lblGender;
        private System.Windows.Forms.TextBox txtFIO;
        private System.Windows.Forms.Label lblFIO;
        private System.Windows.Forms.TextBox txtID;
        private System.Windows.Forms.Label lblLogin;
        private System.Windows.Forms.Button btnBrowse;
        private System.Windows.Forms.PictureBox picPhoto;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.Label lblPassword;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnUpdate;
    }
}
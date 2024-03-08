using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Session1.UI
{

    /// <summary>
    /// Класс frmRegistrationJM предоставляет окно с возможностью регистрации
    /// жюри/модератора.
    /// </summary>

    public partial class frmRegistrationJM : Form
    {

        /// <summary>
        /// Строка imgLocation является названием фотографии для добавления
        /// в учётную запись регистрируемого пользователя.
        /// Переменная role необходима для определения роли пользователя.
        /// Переменная peopleId необходима для получения макс. значения Id Number.
        /// </summary>

        private static string imgLocation = "";
        private static int role;
        private static int peopleId;

        /// <summary>
        /// Конструктор frmRegistrationJM представляет метод, который называется 
        /// по имени класса, где может иметь параметры.
        /// InitializeComponent — это метод, определенный в интерфейсе
        /// и используемый для загрузки скомпилированной страницы компонента.
        /// </summary>

        public frmRegistrationJM()
        {
            InitializeComponent();
            GetMaxIdNumber();
            LoadCountries();
            LoadEvents();
            LoadAllDirections();
            txtPassword.UseSystemPasswordChar = true;
            txtPasswordSec.UseSystemPasswordChar = true;
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        /// <summary>
        /// Метод GetMaxIdNumber позволяет получать максимальный Id в качестве логина.
        /// </summary>

        private void GetMaxIdNumber()
        {
            try
            {
                using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                    connectionString.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "GetMaxPeople";
                    cmd.Connection = connectionString;
                    peopleId = (int)cmd.ExecuteScalar();
                    peopleId += 1;
                    txtID.Text = peopleId.ToString();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Метод InsertData позволяет добавить записи учётных данных в таблицу с пользователями.
        /// </summary>

        private void InsertData()
        {

            if (MessageBox.Show("Все данные введены верно? ", "Сообщение",
               MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                    try
                    {
                        connectionString.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "InsertJM";
                        cmd.Connection = connectionString;
                        cmd.Parameters.AddWithValue("@id", int.Parse(txtID.Text));
                        cmd.Parameters.AddWithValue("@role", role);
                        cmd.Parameters.AddWithValue("@fullname", txtFIO.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@dob", dtpDOB.Value.Date);
                        cmd.Parameters.AddWithValue("@country", cboCountry.SelectedIndex + 1);
                        cmd.Parameters.AddWithValue("@phone", mtxPhone.Text);
                        cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                        cmd.Parameters.AddWithValue("@gender", cboGender.SelectedItem);

                        if (picPhoto.Image != null)
                        {
                            cmd.Parameters.AddWithValue("@photo", imgLocation);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@photo", DBNull.Value);
                        }

                        cmd.ExecuteNonQuery();
                        MessageBox.Show($"Поздравляю!\n{txtFIO.Text}\nуспешно добавлен в базу данных.\n" +
                            $"Теперь вы можете привязать его к активности с помощью отдельной кнопки.", "Сообщение",
                            MessageBoxButtons.OK, MessageBoxIcon.Information);
                        btnBinding.Enabled = true;
                    }
                    catch
                    {
                        MessageBox.Show($"Возникла ошибка с базой данных!\n" +
                            $"Возможно пользователь с таким ID уже существует.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    connectionString.Close();
                    ClearElements();
                }
            }
        }

        private void btnAccept_Click(object sender, EventArgs e)
        {
            //Использование регулярных выражений для проверки безопасности пароля.
            Regex rule1 = new Regex(@"[*&{}|+,]+");
            Regex rule2 = new Regex(@"[A-Z]+");
            Regex rule3 = new Regex(@"[a-z]+");
            Regex rule4 = new Regex(@"[0-9]+");

            if (String.IsNullOrWhiteSpace(txtFIO.Text) || String.IsNullOrWhiteSpace(txtEmail.Text)
                || String.IsNullOrWhiteSpace(txtPassword.Text) || String.IsNullOrWhiteSpace(txtPasswordSec.Text))
            {
                MessageBox.Show($"Заполните все поля!", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                if (txtPassword.Text.Length >= 6 && rule2.IsMatch(txtPassword.Text) && rule3.IsMatch(txtPassword.Text)
                  && rule4.IsMatch(txtPassword.Text) != rule1.IsMatch(txtPassword.Text))
                {
                    if (txtPassword.Text == txtPasswordSec.Text)
                    {
                        MessageBox.Show("Пароль безопасен!", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        InsertData();
                    }
                    else
                    {
                        MessageBox.Show("Повторный пароль не совпадает!", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                else
                {
                    MessageBox.Show("Пароль должен соотвествовать следующим требованиям:\n" +
                        "1. Не менее 6 символов;\n" +
                        "2. Заглавные и строчные буквы;\n" +
                        "3. Не менее одного спецсимвола;\n" +
                        "4. Не менее одной цифры.", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void cboRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Определение роли (жюри/модератор) из ComboBox по индексу.
            if (cboRole.SelectedIndex == 0)
            {
                role = 2;
            }
            else if (cboRole.SelectedIndex == 1)
            {
                role = 4;
            }
        }

        /// <summary>
        /// Метод LoadCountries заполняет элемент ComboBox
        /// названиями стран из таблицы.
        /// </summary>

        private void LoadCountries()
        {
            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                try
                {
                    connectionString.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "GetCountry";
                    cmd.Connection = connectionString;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    cboCountry.DataSource = dt;
                    adapter.Fill(dt);

                    cboCountry.DataSource = dt;
                    cboCountry.DisplayMember = "Страна";
                    cboCountry.ValueMember = "Страна";
                }
                catch
                {
                    MessageBox.Show("Не удалось загрузить страны!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                connectionString.Close();
            }
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            /*
             * Открытие диалогового окна Windows для просмотра и выбора файлов
             * с целью загрузки фотографии у пользователя.
            */

            try
            {
                OpenFileDialog ofd = new OpenFileDialog();
                ofd.InitialDirectory = "C:\\";
                ofd.Filter = "Image Files (*.bmp;*.jpg;*.jpeg,*.png)|*.BMP;*.JPG;*.JPEG;*.PNG";
                ofd.FilterIndex = 2;
                if (ofd.ShowDialog() == DialogResult.OK)
                {
                    picPhoto.Image = Image.FromFile(ofd.FileName);
                    imgLocation = ofd.SafeFileName.ToString();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Произошёл сбой!\n{ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void chkPassword_CheckedChanged(object sender, EventArgs e)
        {
            //Изменение видимости пароля.
            if (chkPassword.Checked)
            {
                txtPassword.UseSystemPasswordChar = false;
                txtPasswordSec.UseSystemPasswordChar = false;
            }
            else
            {
                txtPassword.UseSystemPasswordChar = true;
                txtPasswordSec.UseSystemPasswordChar = true;
            }
        }

        /// <summary>
        /// Метод ClearElements очищает заполненные поля после
        /// успешного добавления пользователя в таблицу.
        /// </summary>

        private void ClearElements()
        {
            txtID.Clear();
            GetMaxIdNumber();
            txtFIO.Clear();
            cboGender.SelectedIndex = -1;
            cboRole.SelectedIndex = -1;
            txtEmail.Clear();
            mtxPhone.Clear();
            cboCountry.SelectedIndex = -1;
            dtpDOB.Value = dtpDOB.MinDate;
            mtxPhone.Clear();
            txtPassword.Clear();
            txtPasswordSec.Clear();
            picPhoto.Image = null;
        }

        /// <summary>
        /// Метод LoadEvents заполняет элемент ComboBox
        /// названиями мероприятий из таблицы.
        /// </summary>

        private void LoadEvents()
        {
            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                try
                {
                    connectionString.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "GetEventsName";
                    cmd.Connection = connectionString;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    cboEvents.DataSource = dt;
                    adapter.Fill(dt);

                    cboEvents.DataSource = dt;
                    cboEvents.DisplayMember = "Название мероприятия";
                    cboEvents.ValueMember = "Название мероприятия";
                }
                catch
                {
                    MessageBox.Show("Не удалось загрузить мероприятия!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                connectionString.Close();
            }
        }

        /// <summary>
        /// Метод LoadAllDirections заполняет элемент ComboBox
        /// названиями всех направлений независимо от того, какое 
        /// мероприятие выбрано.
        /// </summary>

        private void LoadAllDirections()
        {
            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                try
                {
                    connectionString.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "GetAllDirections";
                    cmd.Connection = connectionString;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    cboDirection.DataSource = dt;
                    adapter.Fill(dt);

                    cboDirection.DataSource = dt;
                    cboDirection.DisplayMember = "Направление";
                    cboDirection.ValueMember = "Направление";
                }
                catch
                {
                    MessageBox.Show("Не удалось загрузить направления!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                connectionString.Close();
            }
        }

        /// <summary>
        /// Метод LoadDirections заполняет элемент ComboBox
        /// названиями направлений в зависмости от выбранного мероприятия.
        /// </summary>

        private void LoadDirections()
        {
            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                try
                {
                    connectionString.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "GetDirections";
                    cmd.Connection = connectionString;
                    cmd.Parameters.AddWithValue("@event", cboEvents.SelectedIndex + 1);
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    cboDirection.DataSource = dt;
                    adapter.Fill(dt);

                    cboDirection.DataSource = dt;
                    cboDirection.DisplayMember = "Направление";
                    cboDirection.ValueMember = "Направление";
                }
                catch
                {
                    MessageBox.Show("Не удалось загрузить направления!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                connectionString.Close();
            }
        }

        private void cboEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*
             * Вывод направления в ComboBox по выбранному мероприятию
             * с учётом прикрепления с помощью CheckBox.
            */

            if (chkAttach.Checked)
            {
                LoadDirections();
            }
        }

        private void chkAttach_CheckedChanged(object sender, EventArgs e)
        {
            //Проверка прикрепления направления к определённому мероприятию.
            if (chkAttach.Checked)
            {
                LoadDirections();
                cboDirection.DropDownStyle = ComboBoxStyle.DropDownList;
            }
            else
            {
                LoadAllDirections();
                cboDirection.DropDownStyle = ComboBoxStyle.DropDown;
            }
        }

        private void btnBinding_Click(object sender, EventArgs e)
        {
            new frmRecording(cboEvents.SelectedIndex + 1, cboDirection.Text, peopleId - 1, role).ShowDialog();
        }
    }
}



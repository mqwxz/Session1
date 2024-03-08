using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Threading.Tasks;
using System.Windows.Forms;
using Session1.Classes;

namespace Session1.UI
{

    /// <summary>
    /// Класс frmAuthorization предоставляет окно с авторизацией.
    /// В этом окне необходимо вводить учётные данные пользователя.
    /// Для обеспечения безопасности реализована CAPTCHA, а также
    /// доступно запоминание учётных данных пользователя.
    /// </summary>

    public partial class frmAuthorization : Form
    {

        /// <summary>
        /// Строка word является капчей, которую необходимо разгадать,
        /// чтобы вновь получить доступ к авторизации после неудачных попыток.
        /// Переменная incorrectAnswer является счётчиков неудачных попыток,
        /// а countTrying для визуального отображения оставшихся попыток.
        /// </summary>

        private string word = String.Empty;
        private int incorrectAnswer = 0;
        private int countTrying = 3;

        /// <summary>
        /// Конструктор frmAuthorization представляет метод, который называется 
        /// по имени класса, где может иметь параметры.
        /// InitializeComponent — это метод, определенный в интерфейсе
        /// и используемый для загрузки скомпилированной страницы компонента.
        /// </summary>

        public frmAuthorization()
        {
            InitializeComponent();
            txtPassword.UseSystemPasswordChar = true;
        }

        private void chkPassword_CheckedChanged(object sender, EventArgs e)
        {
            //Возможность показать/скрыть пароль.
            if(chkPassword.Checked)
            {
                txtPassword.UseSystemPasswordChar = false;
            }
            else
            {
                txtPassword.UseSystemPasswordChar= true;
            }
        }

        /// <summary>
        /// Метод GetSettings получает данные после их запоминания пользователем.
        /// </summary>

        private void GetSettings()
        {
            txtLogin.Text = Properties.Settings.Default.login;
            txtPassword.Text = Properties.Settings.Default.password;
        }

        /// <summary>
        /// Метод SaveSettings позволяет запомнить логин:пароль при авторизации.
        /// </summary>

        private void SaveSettings()
        {
            Properties.Settings.Default.login = txtLogin.Text;
            Properties.Settings.Default.password = txtPassword.Text;
            Properties.Settings.Default.Save();
        }

        private void chkRemember_CheckedChanged(object sender, EventArgs e)
        {
            SaveSettings();
            GetSettings();
        }
        
        private void frmAuthorization_Load(object sender, EventArgs e)
        {
            GetSettings();
        }

        private async void btnAuth_Click(object sender, EventArgs e)
        {
            string login = txtLogin.Text.Trim();
            string password = txtPassword.Text.Trim();

            //Проверка на пустоту таких полей, как логин:пароль.
            if (String.IsNullOrEmpty(txtLogin.Text) || String.IsNullOrEmpty(txtPassword.Text))
            {
                MessageBox.Show("Заполните все поля!", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                try
                {
                    connectionString.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "CheckCredentials";
                    cmd.Parameters.AddWithValue("@login", login);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Connection = connectionString;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        reader.Read();

                        if (reader.HasRows)
                        {
                            People.id_people = reader.GetInt32(0);
                            People.people_role = reader.GetInt32(1);
                            People.people_fio = reader.GetString(2);
                            People.people_post = reader.GetString(3);
                            People.people_dob = reader.GetDateTime(4);
                            People.people_country = reader.GetInt32(5);
                            People.people_phone = reader.GetString(6);
                            People.people_pass = reader.GetString(7);
                            People.people_photo = reader.GetString(8);
                            People.people_gender = reader.GetString(9);
                        }
                        else
                        {

                            incorrectAnswer++;

                            if (countTrying > 0)
                            {
                                MessageBox.Show($"Неверное имя пользователя или пароль!\nОсталось попыток: {--countTrying}",
                                    "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            }
                            if (incorrectAnswer == 3)
                            {
                                MessageBox.Show("Много неудачных попыток.\nДоступ был заблокирован на 10 секунд. " +
                                    "Пожалуйста, подождите.", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                                btnAuth.Enabled = false;
                                await Task.Delay(10000);
                                btnAuth.Enabled = true;
                            }
                            if (incorrectAnswer > 3)
                            {
                                MessageBox.Show($"К сожалению, настало время капчи.", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                word = String.Empty;
                                LoadCaptcha();
                                txtCaptcha.Visible = true;
                                btnAnswer.Visible = true;
                                btnReset.Visible = true;
                                btnAuth.Enabled = false;
                            }

                            reader.Close();
                        }
                        
                        //Открытие форм с определёнными возможностями в зависимости от роли пользователя.
                        switch (People.people_role)
                        {
                            case 1:
                                frmOrganizer organizer = new frmOrganizer();
                                this.Hide();
                                organizer.ShowDialog();
                                this.Show();
                                break;
                            case 2:
                                frmModerator moderator = new frmModerator();
                                this.Hide();
                                moderator.ShowDialog();

                                break;
                            case 3:
                                frmParticipant participant = new frmParticipant();
                                this.Hide();
                                participant.ShowDialog();
                                this.Show();
                                break;
                            case 4:
                                frmJury jury = new frmJury();
                                this.Hide();
                                jury.ShowDialog();
                                this.Show();
                                break;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                connectionString.Close();
            }
        }

        /// <summary>
        /// Метод LoadCaptcha вызывает капчу при неудачных попытках авторизации.
        /// </summary>

        private void LoadCaptcha()
        {
            picCaptcha.Visible = true;

            //Рандомизация переменной word (капчи), которую необходимо разгадать.
            Random random = new Random();
            string chars = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
            for (int i = 0; i < 6; ++i)
                word += chars[random.Next(chars.Length)];

            //Отрисовка капчи (шрифт, размер, стиль, цвета).
            var ing = new Bitmap(this.picCaptcha.Width, this.picCaptcha.Height);
            var font = new Font("Arial", 30, FontStyle.Italic, GraphicsUnit.Pixel);
            var graphics = Graphics.FromImage(ing);
            graphics.Clear(Color.White);
            graphics.DrawString(word.ToString(), font, Brushes.DarkGray, new Point(15, 35));
            
            //Отрисовка линий для имитации усложнения разгадывания капчи.
            graphics.DrawLine(Pens.Red, new Point(0, 0), new Point(Width - 5, Height - 1));
            graphics.DrawLine(Pens.Blue, new Point(0, 100), new Point(150, 0));
            graphics.DrawLine(Pens.Black, new Point(40, 1000), new Point(70, 0));
            
            picCaptcha.Image = ing;
        }

        private void btnAnswer_Click(object sender, EventArgs e)
        {
            if (txtCaptcha.Text == word.ToString())
            {
                MessageBox.Show($"Капча прошла проверку!", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Information);
                btnAuth.Enabled = true;
            }
            else
            {
                MessageBox.Show($"Капча не прошла проверку!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            word = String.Empty;
            LoadCaptcha();
        }


        //Ввод только цифр для логина.
        private void txtLogin_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void btnBackToMain_Click(object sender, EventArgs e)
        {
            this.Close();
            frmSystem system = new frmSystem();
            system.Show();
        }
    }
}

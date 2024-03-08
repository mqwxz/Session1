using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using Session1.Classes;

namespace Session1.UI
{

    /// <summary>
    /// Класс frmPersonalAre предоставляет окно с возможностью редактирования
    /// учётных данных пользователя.
    /// </summary>

    public partial class frmPersonalArea : Form
    {

        //Хранение названия файла, чтобы считывать из ресурсов проекта.
        private static string imgLocation = "";

        /// <summary>
        /// Конструктор frmPerosnalArea представляет метод, который называется 
        /// по имени класса, где может иметь параметры.
        /// InitializeComponent — это метод, определенный в интерфейсе
        /// и используемый для загрузки скомпилированной страницы компонента.
        /// </summary>

        public frmPersonalArea()
        {
            InitializeComponent();
            
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmPersonalArea_Load(object sender, EventArgs e)
        {
            //Загрузка данных в элементы формы.
            txtID.Text = People.id_people.ToString();
            txtFIO.Text = People.people_fio.ToString();
            cboGender.SelectedItem = People.people_gender.ToString().Trim();
            cboRole.SelectedIndex = People.people_role;
            txtEmail.Text = People.people_post.ToString();
            mtxPhone.Text = People.people_phone.ToString();
            cboCountry.SelectedIndex = People.people_country;
            dtpDOB.Text = People.people_dob.ToString();
            txtPassword.Text = People.people_pass.ToString();

            //Загрузка фотографии профиля.
            string projectDirectory = Directory.GetParent(Environment.CurrentDirectory).Parent.FullName;
            string personalPhoto = People.people_photo.ToString();
            string photoPath = Path.Combine(projectDirectory, $"Resources\\Personal Area Photos\\Organizers\\{personalPhoto}");

            try
            {
                if (File.Exists(photoPath))
                {
                    picPhoto.ImageLocation = Path.Combine(projectDirectory, $"Resources\\Personal Area Photos\\Organizers\\{personalPhoto}");
                }
            }
            catch
            {
                MessageBox.Show($"Не удалось загрузить личную фотографию!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void UpdateData()
        {
            if (MessageBox.Show("Вы уверены, что хотите изменить данные? ", "Сообщение",
               MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                    try
                    {
                        connectionString.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "UpdatePersonalArea";
                        cmd.Connection = connectionString;
                        cmd.Parameters.AddWithValue("@people", Convert.ToInt32(txtID.Text));
                        cmd.Parameters.AddWithValue("@fullname", txtFIO.Text);
                        cmd.Parameters.AddWithValue("@post", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@phone", mtxPhone.Text);
                        cmd.Parameters.AddWithValue("@country", cboCountry.SelectedIndex);
                        cmd.Parameters.AddWithValue("@password", txtPassword.Text);

                        //Если фотография не была изменена, то всё остаётся прежним.
                        if(imgLocation == "")
                        {
                            cmd.Parameters.AddWithValue("@photo", People.people_photo.ToString());
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@photo", imgLocation);
                        }

                        cmd.ExecuteNonQuery();
                        MessageBox.Show("Данные успешно изменены!", "Сообщение",
                            MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch
                    {
                        MessageBox.Show($"Такой страны не существует!", "Предупреждение",
                            MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                    connectionString.Close();
                }
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            //Использование регулярных выражений для проверки безопасности пароля.
            Regex rule1 = new Regex(@"[*&{}|+,]+");
            Regex rule2 = new Regex(@"[A-Z]+");
            Regex rule3 = new Regex(@"[a-z]+");
            Regex rule4 = new Regex(@"[0-9]+");

            if (String.IsNullOrWhiteSpace(txtFIO.Text) || String.IsNullOrWhiteSpace(txtEmail.Text)
                || String.IsNullOrWhiteSpace(txtPassword.Text))
            {
                MessageBox.Show($"Заполните все поля!", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                if (txtPassword.Text.Length >= 6 && rule2.IsMatch(txtPassword.Text) && rule3.IsMatch(txtPassword.Text)
                    && rule4.IsMatch(txtPassword.Text) != rule1.IsMatch(txtPassword.Text))
                {
                    MessageBox.Show("Пароль безопасен!", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    UpdateData();
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

        private void btnBrowse_Click(object sender, EventArgs e)
        {
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
    }
}

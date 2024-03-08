using System;
using System.IO;
using System.Windows.Forms;
using Session1.Classes;

namespace Session1.UI
{

    /// <summary>
    /// Класс frmOrganizer предоставляет окно возможностей у организатора.
    /// В этом окне предоставляется доступ к просмотру участников, мероприятий,
    /// регистрации жюри/модераторов и к личному кабинету.
    /// </summary>

    public partial class frmOrganizer : Form
    {
        //Определение настоящего времени на текущий момент с устройства пользователя.
        private int currentHour = DateTime.Now.Hour;

        /// <summary>
        /// Конструктор frmOrganizer представляет метод, который называется 
        /// по имени класса, где может иметь параметры.
        /// InitializeComponent — это метод, определенный в интерфейсе
        /// и используемый для загрузки скомпилированной страницы компонента.
        /// </summary>

        public frmOrganizer()
        {
            InitializeComponent();
            LoadWelcome();
        }

        private void LoadWelcome()
        {

            /*
             * Приветствие пользователя по ФИО с указанием времени работы: 
             * 9:00 - 11.00 - Утро
             * 11:00 - 18:00 - День
             * 18:00 - 24:00 - Вечер
             * Отсутствует ночь.
            */

            string time = "";

            if (currentHour >= 9 && currentHour < 11)
            {
                time = "Доброе утро!";
            }

            if (currentHour >= 11 && currentHour < 18)
            {
                time = "Добрый день!";
            }

            if (currentHour >= 18 && currentHour < 24)
            {
                time = "Добрый вечер!";
            }

            lblWelcome.Text += $"{time} \n {People.people_fio}";
        }

        private void btnProfile_Click(object sender, EventArgs e)
        {
            frmPersonalArea personalArea = new frmPersonalArea();
            this.Hide();
            personalArea.ShowDialog();
            this.Show();
        }

        private void btnRegistrationJM_Click(object sender, EventArgs e)
        {
            frmRegistrationJM registrationJM = new frmRegistrationJM();
            this.Hide();
            registrationJM.ShowDialog();
            this.Show();
        }

        private void frmOrganizer_Load(object sender, EventArgs e)
        {
            //Загрузка фотографии профиля.
            string projectDirectory = Directory.GetParent(Environment.CurrentDirectory).Parent.FullName;
            string personalPhoto = People.people_photo.ToString();
            string photoPath = Path.Combine(projectDirectory, $"Resources\\Personal Area Photos\\Organizers\\{personalPhoto}");

            try
            {
                if (File.Exists(photoPath))
                {
                    picOrganizer.ImageLocation = Path.Combine(projectDirectory, $"Resources\\Personal Area Photos\\Organizers\\{personalPhoto}");
                }
            }
            catch
            {
                MessageBox.Show($"Не удалось загрузить личную фотографию!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnJury_Click(object sender, EventArgs e)
        {
            MessageBox.Show("В задании не описано что здесь должно быть.", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Question);
        }

        private void btnEvents_Click(object sender, EventArgs e)
        {
            frmEvents events = new frmEvents();
            this.Hide();
            events.ShowDialog();
            this.Show();
        }

        private void btnParticipant_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Данная функция находится на стадии разработки", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnBackToAuth_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}

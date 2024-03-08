using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Session1.Classes;

namespace Session1.UI
{

    /// <summary>
    /// Класс frmRecording предоставляет окно с возможностью
    /// выбора места жюри/модератора в зависимости от 
    /// выбранного мероприятия и направления.
    /// жюри/модератора.
    /// </summary>

    public partial class frmRecording : Form
    {
        /// <summary>
        /// Конструктор frmRecording представляет метод, который называется 
        /// по имени класса, где может иметь параметры.
        /// InitializeComponent — это метод, определенный в интерфейсе
        /// и используемый для загрузки скомпилированной страницы компонента.
        /// </summary>
        /// <param name="selectedEvent">Выбранное мероприятие</param>
        /// <param name="selectedDirection">Выбранное направление</param>
        /// <param name="peopleId">Логин пользователя</param>
        /// <param name="role">Роль пользователя</param>

        public frmRecording(int selectedEvent, string selectedDirection, int peopleId, int role)
        {
            InitializeComponent();
            lblEvent.Text = selectedEvent.ToString();
            lblDirection.Text = selectedDirection;
            lblId.Text = peopleId.ToString();
            lblRole.Text = role.ToString();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnJury3_Click(object sender, EventArgs e)
        {
            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                try
                {
                    connectionString.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "InsertJury3";
                    cmd.Connection = connectionString;
                    cmd.Parameters.AddWithValue("@jury3", Convert.ToInt32(lblId.Text));
                    cmd.Parameters.AddWithValue("@event", Convert.ToInt32(lblEvent.Text));
                    cmd.Parameters.AddWithValue("@direction", lblDirection.Text);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Жюри успешно добавлен!", "Сообщение",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Это место уже занято!{ex.Message}", "Предупреждение",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                connectionString.Close();
            }
            OffButtons();
        }

        private void btnJury1_Click(object sender, EventArgs e)
        {
            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                try
                {
                    connectionString.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "InsertJury1";
                    cmd.Connection = connectionString;
                    cmd.Parameters.AddWithValue("@jury1", Convert.ToInt32(lblId.Text));
                    cmd.Parameters.AddWithValue("@event", Convert.ToInt32(lblEvent.Text));
                    cmd.Parameters.AddWithValue("@direction", lblDirection.Text);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Жюри успешно добавлен!", "Сообщение",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Это место уже занято!{ex.Message}", "Предупреждение",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                connectionString.Close();
            }
            OffButtons();
        }

        private void btnJury2_Click(object sender, EventArgs e)
        {
            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                try
                {
                    connectionString.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "InsertJury2";
                    cmd.Connection = connectionString;
                    cmd.Parameters.AddWithValue("@jury2", Convert.ToInt32(lblId.Text));
                    cmd.Parameters.AddWithValue("@event", Convert.ToInt32(lblEvent.Text));
                    cmd.Parameters.AddWithValue("@direction", lblDirection.Text);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Жюри успешно добавлен!", "Сообщение",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Это место уже занято!{ex.Message}", "Предупреждение",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                connectionString.Close();
            }
            OffButtons();
        }

        /// <summary>
        /// Метод OffButtons отключает доступ к кнопкам
        /// после успешной привязки жюри/модератора к активности.
        /// </summary>

        private void OffButtons()
        {
            btnJury1.Enabled = false;
            btnJury2.Enabled = false;
            btnJury3.Enabled = false;
            btnJury4.Enabled = false;
            btnJury5.Enabled = false;
            btnModerator.Enabled = false;
        }

        private void btnJury4_Click(object sender, EventArgs e)
        {
            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                try
                {
                    connectionString.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "InsertJury4";
                    cmd.Connection = connectionString;
                    cmd.Parameters.AddWithValue("@jury4", Convert.ToInt32(lblId.Text));
                    cmd.Parameters.AddWithValue("@event", Convert.ToInt32(lblEvent.Text));
                    cmd.Parameters.AddWithValue("@direction", lblDirection.Text);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Жюри успешно добавлен!", "Сообщение",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Это место уже занято!{ex.Message}", "Предупреждение",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                connectionString.Close();
            }
            OffButtons();
        }

        private void btnJury5_Click(object sender, EventArgs e)
        {
            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                try
                {
                    connectionString.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "InsertJury5";
                    cmd.Connection = connectionString;
                    cmd.Parameters.AddWithValue("@jury5", Convert.ToInt32(lblId.Text));
                    cmd.Parameters.AddWithValue("@event", Convert.ToInt32(lblEvent.Text));
                    cmd.Parameters.AddWithValue("@direction", lblDirection.Text);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Жюри успешно добавлен!", "Сообщение",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Это место уже занято!{ex.Message}", "Предупреждение",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                connectionString.Close();
            }
            OffButtons();
        }

        private void frmRecording_Load(object sender, EventArgs e)
        {
            //Доступ к кнопкам в зависимости от выбранной роли пользователя.
            if(lblRole.Text == "2")
            {
                OffButtons();
                btnModerator.Enabled = true;
            }
            else if(lblRole.Text == "4") 
            {
                btnModerator.Enabled = false;
            }
        }

        private void btnModerator_Click(object sender, EventArgs e)
        {
            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                try
                {
                    connectionString.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "InsertModerator";
                    cmd.Connection = connectionString;
                    cmd.Parameters.AddWithValue("@moder", Convert.ToInt32(lblId.Text));
                    cmd.Parameters.AddWithValue("@event", Convert.ToInt32(lblEvent.Text));
                    cmd.Parameters.AddWithValue("@direction", lblDirection.Text);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Модератор успешно добавлен!", "Сообщение",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Это место уже занято!{ex.Message}", "Предупреждение",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                connectionString.Close();
            }
            OffButtons();
        }
    }
}

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

namespace Session1.UI
{

    /// <summary>
    /// Класс frmEvents предоставляет окно с возможностью
    /// добавления нового мероприятия с активностью.
    /// </summary>

    public partial class frmEvents : Form
    {

        /// <summary>
        /// Конструктор frmEvents представляет метод, который называется 
        /// по имени класса, где может иметь параметры.
        /// InitializeComponent — это метод, определенный в интерфейсе
        /// и используемый для загрузки скомпилированной страницы компонента.
        /// </summary>

        public frmEvents()
        {
            InitializeComponent();
            LoadDirectionsAndCities();
            LoadEvents();
        }

        /// <summary>
        /// Метод LoadDirectionsAndCities позволяет загружать 
        /// в элементы ComboBox данные о направлениях и городах.
        /// </summary>

        private void LoadDirectionsAndCities()
        {
            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                try
                {
                    connectionString.Open();

                    //Получение всех направлений.
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


                    //Получение всех городов
                    SqlCommand cmd2 = new SqlCommand();
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.CommandText = "GetCity";
                    cmd2.Connection = connectionString;
                    SqlDataAdapter adapter2 = new SqlDataAdapter(cmd2);
                    DataTable dt2 = new DataTable();
                    cboEvents.DataSource = dt2;
                    adapter2.Fill(dt2);

                    cboCity.DataSource = dt2;
                    cboCity.DisplayMember = "city_name";
                    cboCity.ValueMember = "Город";
                }
                catch
                {
                    MessageBox.Show("Не удалось загрузить данные!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                connectionString.Close();
            }
        }

        /// <summary>
        /// Метод LoadEvents позволяет загружать 
        /// в элемент ComboBox названия мероприятий.
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
                    cmd.CommandText = "GetEventName";
                    cmd.Connection = connectionString;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    cboEvents.DataSource = dt;
                    cboEvents.DisplayMember = "Название мероприятия";
                    cboEvents.ValueMember = "event";
                }
                catch
                {
                    MessageBox.Show("Не удалось загрузить мероприятия!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                connectionString.Close();
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void InsertEvent()
        {

            if (MessageBox.Show("Вы действительно хотите добавить новое мероприятие? ", "Сообщение",
               MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                    try
                    {
                        connectionString.Open();

                        //Добавление мероприятия.
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "InsertEvent";
                        cmd.Connection = connectionString;
                        cmd.Parameters.AddWithValue("@event_name", cboEvents.Text);
                        cmd.Parameters.AddWithValue("@date_event", dtpDOB.Value.Date);
                        cmd.Parameters.AddWithValue("@days_event", nudDays.Value);
                        cmd.Parameters.AddWithValue("@city", cboCity.SelectedValue);

                        //Добавление активности.
                        SqlCommand cmd1 = new SqlCommand();
                        cmd1.CommandType = CommandType.StoredProcedure;
                        cmd1.CommandText = "InsertActivity";
                        cmd1.Connection = connectionString;
                        cmd1.Parameters.AddWithValue("@date_event", dtpDOB.Value.Date);
                        cmd1.Parameters.AddWithValue("@days_activity", nudDays.Value);

                        //Добавление данных в общую таблицу.
                        SqlCommand cmd2 = new SqlCommand();
                        cmd2.CommandType = CommandType.StoredProcedure;
                        cmd2.CommandText = "InsertActivityStaff";
                        cmd2.Connection = connectionString;
                        cmd2.Parameters.AddWithValue("@activity_name", cboDirection.Text);
                        cmd2.Parameters.AddWithValue("@activity_day", nudDayActivity.Value);
                        cmd2.Parameters.AddWithValue("@time", dtpTime.Value);

                        cmd.ExecuteNonQuery();
                        cmd1.ExecuteNonQuery();
                        cmd2.ExecuteNonQuery();

                        MessageBox.Show("Пока что так", "Сообщение",
                            MessageBoxButtons.OK, MessageBoxIcon.Information);

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show($"Возникла ошибка с базой данных!{ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    connectionString.Close();
                }
            }
        }

        private void btnAddEvent_Click(object sender, EventArgs e)
        {
            InsertEvent();
        }
    }
}

    

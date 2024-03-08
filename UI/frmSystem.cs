using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Windows.Forms;
using Session1.UI;

namespace Session1
{

    /// <summary>
    /// Класс frmSystem предоставляет главное окно системы приложения.
    /// В этом окне неавторизованный пользователь может посмотреть
    /// мероприятия, отфильтровав их по направлению или по дате.
    /// </summary>

    public partial class frmSystem : Form
    {

        /// <summary>
        /// Конструктор frmSystem представляет метод, который называется 
        /// по имени класса, где может иметь параметры.
        /// InitializeComponent — это метод, определенный в интерфейсе
        /// и используемый для загрузки скомпилированной страницы компонента.
        /// </summary>

        public frmSystem()
        {
            InitializeComponent();
            LoadEvents();
            LoadDirections();
        }

        private void btnAuth_Click(object sender, EventArgs e)
        {
            frmAuthorization authorization = new frmAuthorization();
            this.Hide();
            authorization.Show();
        }

        /// <summary>
        /// Метод LoadEvents позволяет выводить мероприятия в DataGridView. 
        /// </summary>
        /// <exception cref="SqlConnection">Не удалось загрузить данные!</exception>

        private void LoadEvents()
        {
            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                try
                {
                    DataTable dt = new DataTable();
                    connectionString.Open();

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "GetEvents";
                    cmd.Connection = connectionString;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        dt.Load(reader);
                    }
                    dgvEvent.DataSource = dt;

                    dgvEvent.Columns[0].FillWeight = 30;
                    dgvEvent.Columns[1].FillWeight = 280;
                }
                catch
                {
                    MessageBox.Show($"Не удалось загрузить данные!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                connectionString.Close();
            }
        }

        /// <summary>
        /// Метод FilterDate позволяет фильтровать мероприятия по дате.
        /// в ComboBox из DataGridView
        /// </summary>
        /// <exception cref="Exception">Не удалось загрузить данные!</exception>

        private void FilterDate()
        {
            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                try
                {
                    connectionString.Open();

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "FilterDate";
                    cmd.Connection = connectionString;
                    cmd.Parameters.AddWithValue("@date", dtpEvents.Value.ToString("dd.MM.yyyy"));

                    DataTable dt = (DataTable)dgvEvent.DataSource;
                    DataView dv = new DataView();
                    dv = dt.DefaultView;
                    dv.RowFilter = String.Format("[Дата] = '{0}'", dtpEvents.Value.ToString("dd.MM.yyyy"));

                }
                catch (Exception ex) 
                {
                    MessageBox.Show($"Не удалось выполнить фильтрацию мероприятия по дате!"
                        + $"\n{ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                connectionString.Close();
            }
        }

        /// <summary>
        /// Метод LoadDirections позволяет выводить направления
        /// в ComboBox из DataGridView
        /// </summary>

        private void LoadDirections()
        {
            foreach (DataGridViewRow row in dgvEvent.Rows)
            {
                cboDirection.Items.Add(row.Cells[2].Value.ToString());
            }
        }

        private void cboDirection_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Фильтрация мероприятий по направлению.
            if (cboDirection.SelectedIndex == 0)
            {
                LoadEvents();
            }
            else
            {
                using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                    try
                    {
                        connectionString.Open();

                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "FilterDirection";
                        cmd.Connection = connectionString;
                        cmd.Parameters.AddWithValue("@direction", cboDirection.SelectedItem.ToString());

                        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                        DataTable dataTable = new DataTable();
                        sqlDataAdapter.Fill(dataTable);
                        dgvEvent.DataSource = dataTable;
                    }
                    catch
                    {
                        MessageBox.Show($"Не удалось выполнить фильтрацию по направлению"
                            , "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    connectionString.Close();
                }
            }

            //Проверка на выбор пустого поля, т.к. у некоторых мероприятий отсутствуют направления.
            if (string.IsNullOrEmpty(cboDirection.Text))
            {
                MessageBox.Show($"Выбрано пустое поле!\n" +
                    $"Причина заключается в отсутствии направлений у некоторых мероприятий!"
                    + $"", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
        }

        private void dgvEvent_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            /*
             * Отображение фотографий продуктов с помощью ЛКМ из ресурсов проекта.
             * При отсутствии изображения выводится сообщение с ошибкой.
            */

            string projectDirectory = Directory.GetParent(Environment.CurrentDirectory).Parent.FullName;
            string eventPhoto = dgvEvent.CurrentRow.Cells[0].Value.ToString();
            string photoPath = Path.Combine(projectDirectory, $"Resources\\Personal Area Photos\\Events\\{eventPhoto}.jpeg");
            
            try
            {
                if (File.Exists(photoPath))
                {
                    picEvents.ImageLocation = Path.Combine(projectDirectory, $"Resources\\Personal Area Photos\\Events\\{eventPhoto}.jpeg");
                }
            }
            catch
            {
                MessageBox.Show($"Не удалось загрузить логотип мероприятия!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dtpEvents_ValueChanged(object sender, EventArgs e)
        {
            FilterDate();
        }
    }
}

using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace DebraEventManagement
{
    public partial class Partners : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPartners();
            }
        }

        private void LoadPartners()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT PartnerName, ContactEmail, ContactPhone FROM Partners";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                rptPartners.DataSource = reader;
                rptPartners.DataBind();
            }
        }
    }
}

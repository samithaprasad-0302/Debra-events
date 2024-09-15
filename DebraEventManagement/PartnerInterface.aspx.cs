using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace DebraEventManagement
{
    public partial class PartnerInterface : Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPartnerInfo();
            }
        }

        private void LoadPartnerInfo()
        {
            // Assuming PartnerID is stored in Session after login
            string partnerID = Session["PartnerID"]?.ToString();
            if (!string.IsNullOrEmpty(partnerID))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT PartnerName, ContactEmail, ContactPhone FROM Partners WHERE PartnerID = @PartnerID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@PartnerID", partnerID);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        lblPartnerInfo.Text = $"Partner Name: {reader["PartnerName"]}<br/>Email: {reader["ContactEmail"]}<br/>Phone: {reader["ContactPhone"]}";
                    }
                    connection.Close();
                }
            }
        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateEvent.aspx");
        }

        protected void btnViewEvents_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewEvents.aspx");
        }

        protected void btnViewSales_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewSales.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Implement logout logic
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}

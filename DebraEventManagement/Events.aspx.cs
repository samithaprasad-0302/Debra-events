using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DebraEventManagement
{
    public partial class Events : Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEvents();
            }
        }

        private void LoadEvents()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT EventID, EventName, Description, EventDate, EventImage FROM Events";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                rptEvents.DataSource = reader;
                rptEvents.DataBind();
                connection.Close();
            }
        }

        protected void btnBook_Command(object sender, CommandEventArgs e)
        {
            string eventID = e.CommandArgument.ToString();
            Response.Redirect("BookTickets.aspx?EventID=" + eventID);
        }
    }
}

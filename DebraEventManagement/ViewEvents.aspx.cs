using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace DebraEventManagement
{
    public partial class ViewEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEvents();
            }
        }

        protected void rptEvents_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteEvent")
            {
                int eventID = Convert.ToInt32(e.CommandArgument);
                DeleteEvent(eventID);
                BindEvents(); // Rebind events after deletion
            }
        }

        private void BindEvents()
        {
            // Ensure PartnerID is stored in session
            string partnerID = Session["PartnerID"]?.ToString();
            if (string.IsNullOrEmpty(partnerID))
            {
                // Handle the case where PartnerID is not in session
                Response.Redirect("Login.aspx");
                return;
            }

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT EventID, EventName, EventDate, Location, Description, EventImage FROM Events WHERE PartnerID = @PartnerID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@PartnerID", partnerID);
                connection.Open();
                rptEvents.DataSource = command.ExecuteReader();
                rptEvents.DataBind();
            }
        }

        private void DeleteEvent(int eventID)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Tickets WHERE EventID = @EventID; DELETE FROM Events WHERE EventID = @EventID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@EventID", eventID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
}

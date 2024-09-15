using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace DebraEventManagement
{
    public partial class ManageEvents : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Optional: Load default event or perform any necessary initialization
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Events WHERE EventID = @EventID", con))
                {
                    cmd.Parameters.AddWithValue("@EventID", txtEventID.Text.Trim());
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtEventName.Text = reader["EventName"].ToString();
                        txtEventDate.Text = Convert.ToDateTime(reader["EventDate"]).ToString("yyyy-MM-dd");
                        txtEventLocation.Text = reader["Location"].ToString();
                        txtEventDescription.Text = reader["Description"].ToString();
                        txtEventImage.Text = reader["EventImage"].ToString();
                    }
                    else
                    {
                        lblMessage.Text = "Event not found.";
                        ClearFields();
                    }
                    con.Close();
                }
            }
        }

        protected void btnCreateEvent_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Events (EventName, EventDate, Location, Description, EventImage) VALUES (@EventName, @EventDate, @Location, @Description, @EventImage)", con))
                {
                    cmd.Parameters.AddWithValue("@EventName", txtEventName.Text.Trim());
                    cmd.Parameters.AddWithValue("@EventDate", DateTime.Parse(txtEventDate.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Location", txtEventLocation.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtEventDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@EventImage", txtEventImage.Text.Trim());
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblMessage.Text = "Event created successfully.";
                    ClearFields();
                }
            }
        }

        protected void btnDeleteEvent_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Events WHERE EventID = @EventID", con))
                {
                    cmd.Parameters.AddWithValue("@EventID", txtEventID.Text.Trim());
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();
                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Event deleted successfully.";
                        ClearFields();
                    }
                    else
                    {
                        lblMessage.Text = "Failed to delete event.";
                    }
                }
            }
        }

        protected void btnClearFields_Click(object sender, EventArgs e)
        {
            ClearFields();
        }
        protected void btnBackToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx"); // Replace "Home.aspx" with the actual home page URL
        }

        private void ClearFields()
        {
            txtEventID.Text = "";
            txtEventName.Text = "";
            txtEventDate.Text = "";
            txtEventLocation.Text = "";
            txtEventDescription.Text = "";
            txtEventImage.Text = "";
        }
    }
}

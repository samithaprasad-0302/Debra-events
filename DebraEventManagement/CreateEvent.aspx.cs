using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Configuration;

namespace DebraEventManagement
{
    public partial class CreateEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: You can add additional logic here if needed
        }

        protected void btnCreateEvent_Click(object sender, EventArgs e)
        {
            // Retrieve PartnerID from session
            int partnerID;
            if (Session["PartnerID"] != null && int.TryParse(Session["PartnerID"].ToString(), out partnerID))
            {
                // Get other event details from form
                string eventName = txtEventName.Text;
                DateTime eventDate;
                if (!DateTime.TryParse(txtEventDate.Text, out eventDate))
                {
                    lblMessage.Text = "Invalid date format.";
                    return;
                }
                string location = txtLocation.Text;
                string description = txtDescription.Text;

                // Upload and save event image if needed
                string imagePath = UploadEventImage();

                // Insert into database
                string connectionString = WebConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Events (EventName, EventDate, Location, Description, EventImage, PartnerID) " +
                                   "VALUES (@EventName, @EventDate, @Location, @Description, @EventImage, @PartnerID); " +
                                   "SELECT SCOPE_IDENTITY()";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@EventName", eventName);
                        command.Parameters.AddWithValue("@EventDate", eventDate);
                        command.Parameters.AddWithValue("@Location", location);
                        command.Parameters.AddWithValue("@Description", description);
                        command.Parameters.AddWithValue("@EventImage", imagePath); // Assuming imagePath is the path to the saved image
                        command.Parameters.AddWithValue("@PartnerID", partnerID);

                        try
                        {
                            connection.Open();
                            int eventID = Convert.ToInt32(command.ExecuteScalar());

                            // Insert ticket details
                            InsertTicketDetails(eventID, txtTicketType.Text, decimal.Parse(txtPrice.Text), int.Parse(txtQuantity.Text));

                            lblMessage.Text = "Event created successfully!";
                            // Clear form fields after successful creation if needed
                            ClearFormFields();
                        }
                        catch (Exception ex)
                        {
                            lblMessage.Text = "Error: " + ex.Message;
                        }
                    }
                }
            }
            else
            {
                lblMessage.Text = "Partner session expired. Please log in again.";
                // Optionally redirect to login page or handle expired session scenario
            }
        }

        private void InsertTicketDetails(int eventID, string ticketType, decimal price, int quantity)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Tickets (EventID, TicketType, Price, Quantity) " +
                               "VALUES (@EventID, @TicketType, @Price, @Quantity)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EventID", eventID);
                    command.Parameters.AddWithValue("@TicketType", ticketType);
                    command.Parameters.AddWithValue("@Price", price);
                    command.Parameters.AddWithValue("@Quantity", quantity);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Failed to insert ticket details: " + ex.Message);
                    }
                }
            }
        }

        private string UploadEventImage()
        {
            if (fuEventImage.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(fuEventImage.FileName);
                    string imagePath = "~/EventImages/" + filename; // Save image to a specific folder (ensure folder exists)
                    fuEventImage.SaveAs(Server.MapPath(imagePath)); // Save file to server
                    return imagePath; // Return path to saved image
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to upload event image: " + ex.Message);
                }
            }
            else
            {
                throw new Exception("No event image selected.");
            }
        }

        private void ClearFormFields()
        {
            txtEventName.Text = "";
            txtEventDate.Text = "";
            txtLocation.Text = "";
            txtDescription.Text = "";
            txtTicketType.Text = "";
            txtPrice.Text = "";
            txtQuantity.Text = "";
        }
    }
}

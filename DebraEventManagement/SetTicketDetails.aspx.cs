using System;
using System.Data.SqlClient;
using System.Configuration;

namespace DebraEventManagement
{
    public partial class SetTicketDetails : System.Web.UI.Page
    {
        protected void btnSetTicketDetails_Click(object sender, EventArgs e)
        {
            // Retrieve connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;

            // Validate input data
            int eventID;
            if (!int.TryParse(txtEventID.Text, out eventID))
            {
                lblMessage.Text = "Event ID must be a valid integer.";
                return;
            }

            decimal price;
            if (!decimal.TryParse(txtPrice.Text, out price))
            {
                lblMessage.Text = "Price must be a valid decimal number.";
                return;
            }

            int quantity;
            if (!int.TryParse(txtQuantity.Text, out quantity))
            {
                lblMessage.Text = "Quantity must be a valid integer.";
                return;
            }

            // Insert ticket details into database
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Tickets (EventID, TicketType, Price, Quantity) VALUES (@EventID, @TicketType, @Price, @Quantity)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EventID", eventID);
                cmd.Parameters.AddWithValue("@TicketType", ddlTicketType.SelectedValue); // Use selected value from dropdown list
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Quantity", quantity);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Ticket details set successfully.";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}

using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace DebraEventManagement
{
    public partial class BookTickets : Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;
        protected decimal ticketPrice = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEventDetails();
                LoadTicketPrice();
            }
        }

        private void LoadEventDetails()
        {
            string eventID = Request.QueryString["EventID"];
            if (!string.IsNullOrEmpty(eventID))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT EventName FROM Events WHERE EventID = @EventID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@EventID", eventID);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        lblEventName.Text = reader["EventName"].ToString();
                    }
                    connection.Close();
                }
            }
        }

        private void LoadTicketPrice()
        {
            string eventID = Request.QueryString["EventID"];
            if (!string.IsNullOrEmpty(eventID))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT TOP 1 Price FROM Tickets WHERE EventID = @EventID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@EventID", eventID);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        ticketPrice = Convert.ToDecimal(reader["Price"]);
                        txtPrice.Text = ticketPrice.ToString("F2");
                    }
                    connection.Close();
                }
            }
        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            UpdateTotalPrice();
        }

        private void UpdateTotalPrice()
        {
            if (int.TryParse(txtQuantity.Text, out int quantity))
            {
                decimal totalPrice = quantity * ticketPrice;
                txtTotal.Text = totalPrice.ToString("F2");
            }
            else
            {
                txtTotal.Text = "0.00";
            }
        }

        protected void btnBookTicket_Click(object sender, EventArgs e)
        {
            string eventID = Request.QueryString["EventID"];
            if (int.TryParse(txtQuantity.Text, out int quantity) && decimal.TryParse(txtTotal.Text, out decimal totalPrice) && quantity > 0)
            {
                string cardNumber = txtCardNumber.Text;
                string cardName = txtCardName.Text;
                string expiryDate = txtExpiryDate.Text;
                string cvv = txtCVV.Text;

                if (ValidateCardDetails(cardNumber, cardName, expiryDate, cvv))
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string query = "INSERT INTO Bookings (EventID, Quantity, TotalPrice, BookingDate) VALUES (@EventID, @Quantity, @TotalPrice, GETDATE())";
                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@EventID", eventID);
                        command.Parameters.AddWithValue("@Quantity", quantity);
                        command.Parameters.AddWithValue("@TotalPrice", totalPrice);
                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                    }

                    // Redirect to a confirmation page with query parameters for display
                    Response.Redirect($"BookingConfirmation.aspx?EventID={eventID}&Quantity={quantity}&TotalPrice={totalPrice}");
                }
                else
                {
                    // Display error message for invalid card details
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid card details. Please check and try again.');", true);
                }
            }
        }

        private bool ValidateCardDetails(string cardNumber, string cardName, string expiryDate, string cvv)
        {
            // Perform basic validation on card details (e.g., length check, numeric check)
            // In a real-world application, more comprehensive validation and integration with a payment gateway would be needed
            if (cardNumber.Length == 16 && cardName.Length > 0 && expiryDate.Length == 5 && cvv.Length == 3)
            {
                // Additional validation can be added here
                return true;
            }
            return false;
        }
    }
}

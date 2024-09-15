using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace DebraEventManagement
{
    public partial class RegisterPartner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string partnerName = txtPartnerName.Text;
            string contactEmail = txtContactEmail.Text;
            string contactPhone = txtContactPhone.Text;
            string password = txtPassword.Text;

            string connectionString = WebConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Partners (PartnerName, ContactEmail, ContactPhone, Password) VALUES (@PartnerName, @ContactEmail, @ContactPhone, @Password)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@PartnerName", partnerName);
                    command.Parameters.AddWithValue("@ContactEmail", contactEmail);
                    command.Parameters.AddWithValue("@ContactPhone", contactPhone);
                    command.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        lblMessage.Text = "Registration successful!";

                        // Clear the input fields after successful registration
                        txtPartnerName.Text = "";
                        txtContactEmail.Text = "";
                        txtContactPhone.Text = "";
                        txtPassword.Text = "";
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                    }
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("PartnerLogin.aspx");
        }
    }
}

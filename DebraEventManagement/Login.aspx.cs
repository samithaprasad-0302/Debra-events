using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace DebraEventManagement
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            string connectionString = WebConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username AND PasswordHash = @PasswordHash";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@PasswordHash", password);

                    try
                    {
                        connection.Open();
                        int count = (int)(command.ExecuteScalar() ?? 0);

                        if (count > 0)
                        {
                            lblMessage.Text = "Login successful!";
                            // Redirect to the home page
                            Response.Redirect("Home.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Invalid username or password.";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                    }
                }
            }
        }
    }
}

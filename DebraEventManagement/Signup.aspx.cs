using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace DebraEventManagement
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string fullName = ""; // Provide a default value or fetch from UI

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "All fields are required.";
                return;
            }

            string connectionString = WebConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (Username, Email, PasswordHash, FullName) VALUES (@Username, @Email, @PasswordHash, @FullName)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PasswordHash", password); // Note: Password should be hashed in a real application
                cmd.Parameters.AddWithValue("@FullName", fullName); // Provide a default value or fetch from UI

                conn.Open();
                int result = cmd.ExecuteNonQuery();
                conn.Close();

                if (result > 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Signup successful! You can now login.";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Signup failed. Please try again.";
                }
            }
        }
    }
}
        
  


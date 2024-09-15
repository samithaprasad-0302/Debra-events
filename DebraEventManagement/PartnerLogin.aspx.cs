using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace DebraEventManagement
{
    public partial class PartnerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string partnerName = txtPartnerName.Text;
            string password = txtPassword.Text;

            string connectionString = WebConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;
            string query = "SELECT PartnerID FROM Partners WHERE PartnerName = @PartnerName AND Password = @Password";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@PartnerName", partnerName);
                    command.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        connection.Open();
                        object result = command.ExecuteScalar();
                        if (result != null)
                        {
                            // Authentication successful
                            int partnerID = Convert.ToInt32(result);
                            Session["PartnerID"] = partnerID;
                            Session["PartnerName"] = partnerName; // Optional: Store partner name in session if needed
                            Response.Redirect("PartnerInterface.aspx");
                        }
                        else
                        {
                            // Authentication failed
                            lblMessage.Text = "Invalid Partner Name or Password";
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

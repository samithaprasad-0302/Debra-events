using System;
using System.Web.UI;
using DebraEventManagement.AdminServiceRef; // Ensure this matches the namespace of your service reference

namespace DebraEventManagement
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Use the correct namespace based on your service reference
            using (AdminServiceRef.AdminServiceSoapClient client = new AdminServiceRef.AdminServiceSoapClient())
            {
                bool isValid = client.ValidateAdmin(username, password);

                if (isValid)
                {
                    // Redirect to admin dashboard or desired page
                    Response.Redirect("~/AdminHome.aspx");
                }
                else
                {
                    lblErrorMessage.Text = "Invalid username or password.";
                }
            }
        }
    }
}

using System;
using System.Web.UI;

namespace DebraEventManagement
{
    public partial class ContactUs : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Retrieve the form data
            string name = txtName.Text;
            string email = txtEmail.Text;
            string message = txtMessage.Text;

            // Here you can handle the form submission, for example, by sending an email or saving the data to the database
            // For demonstration purposes, we'll just display a message
            Response.Write("<script>alert('Thank you for contacting us, " + name + ". We will get back to you shortly.');</script>");

            // Clear the form fields
            txtName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";
        }
    }
}

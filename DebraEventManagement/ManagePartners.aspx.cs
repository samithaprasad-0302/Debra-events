using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace DebraEventManagement
{
    public partial class ManagePartners : Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string partnerID = txtPartnerID.Text;
            if (!string.IsNullOrEmpty(partnerID))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT * FROM Partners WHERE PartnerID = @PartnerID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@PartnerID", partnerID);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        txtPartnerName.Text = reader["PartnerName"].ToString();
                        txtPartnerEmail.Text = reader["ContactEmail"].ToString();
                        txtPartnerPhone.Text = reader["ContactPhone"].ToString();
                        lblMessage.Text = "";
                    }
                    else
                    {
                        lblMessage.Text = "Partner not found!";
                        ClearFields();
                    }
                    connection.Close();
                }
            }
        }

        protected void btnAddPartner_Click(object sender, EventArgs e)
        {
            string partnerName = txtPartnerName.Text;
            string partnerEmail = txtPartnerEmail.Text;
            string partnerPhone = txtPartnerPhone.Text;

            if (!string.IsNullOrEmpty(partnerName) && !string.IsNullOrEmpty(partnerEmail) && !string.IsNullOrEmpty(partnerPhone))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Partners (PartnerName, ContactEmail, ContactPhone) VALUES (@PartnerName, @ContactEmail, @ContactPhone)";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@PartnerName", partnerName);
                    command.Parameters.AddWithValue("@ContactEmail", partnerEmail);
                    command.Parameters.AddWithValue("@ContactPhone", partnerPhone);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                    lblMessage.Text = "Partner added successfully!";
                    ClearFields();
                }
            }
            else
            {
                lblMessage.Text = "Please fill in all fields!";
            }
        }

        protected void btnDeletePartner_Click(object sender, EventArgs e)
        {
            string partnerID = txtPartnerID.Text;

            if (!string.IsNullOrEmpty(partnerID))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Partners WHERE PartnerID = @PartnerID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@PartnerID", partnerID);
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    connection.Close();

                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Partner deleted successfully!";
                        ClearFields();
                    }
                    else
                    {
                        lblMessage.Text = "Partner not found!";
                    }
                }
            }
            else
            {
                lblMessage.Text = "Please enter a Partner ID!";
            }
        }

        protected void btnClearFields_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        protected void btnBackToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }

        private void ClearFields()
        {
            txtPartnerID.Text = "";
            txtPartnerName.Text = "";
            txtPartnerEmail.Text = "";
            txtPartnerPhone.Text = "";
        }
    }
}

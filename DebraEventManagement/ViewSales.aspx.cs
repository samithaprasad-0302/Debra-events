using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace DebraEventManagement
{
    public partial class ViewSales : Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSalesDetails();
            }
        }

        private void LoadSalesDetails()
        {
            string partnerID = Session["PartnerID"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT E.EventName, B.Quantity, B.TotalPrice
                    FROM Bookings B
                    INNER JOIN Events E ON B.EventID = E.EventID
                    WHERE E.PartnerID = @PartnerID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@PartnerID", partnerID);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable salesTable = new DataTable();
                adapter.Fill(salesTable);
                gvSales.DataSource = salesTable;
                gvSales.DataBind();
            }
        }
    }
}

using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace DebraEventManagement
{
    public partial class ManageSales : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSalesData();
            }
        }

        private void LoadSalesData()
        {
            // Replace with your actual connection string
            string connectionString = WebConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        E.EventName, 
                        P.PartnerName, 
                        B.Quantity, 
                        B.TotalPrice, 
                        B.BookingDate
                    FROM 
                        Bookings B
                    INNER JOIN Events E ON B.EventID = E.EventID
                    INNER JOIN Partners P ON E.PartnerID = P.PartnerID";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                gvSales.DataSource = dataTable;
                gvSales.DataBind();

                decimal totalIncome = CalculateTotalIncome(dataTable);
                lblTotalIncome.Text = totalIncome.ToString("C");
            }
        }
        protected void btnBackToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx"); // Replace "Home.aspx" with the actual home page URL
        }

        private decimal CalculateTotalIncome(DataTable dataTable)
        {
            decimal totalIncome = 0;
            foreach (DataRow row in dataTable.Rows)
            {
                totalIncome += Convert.ToDecimal(row["TotalPrice"]);
            }
            return totalIncome;
        }
    }
}

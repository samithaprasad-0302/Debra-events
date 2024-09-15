using System;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web.UI;
using QRCoder;

namespace DebraEventManagement
{
    public partial class BookingConfirmation : Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DebraEventManagement"].ConnectionString;
        string qrCodeFilePath;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookingDetails();
            }
        }

        private void LoadBookingDetails()
        {
            string eventID = Request.QueryString["EventID"];
            string quantity = Request.QueryString["Quantity"];
            string totalPrice = Request.QueryString["TotalPrice"];

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

                lblQuantity.Text = quantity;
                lblTotalPrice.Text = totalPrice;
                lblBookingDate.Text = DateTime.Now.ToString("MMMM dd, yyyy, h:mm tt");

                // Generate QR code
                GenerateQRCode(eventID, quantity, totalPrice);
            }
        }

        private void GenerateQRCode(string eventID, string quantity, string totalPrice)
        {
            string qrData = $"EventID: {eventID}\nQuantity: {quantity}\nTotal Price: {totalPrice}\nBooking Date: {DateTime.Now}";
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(qrData, QRCodeGenerator.ECCLevel.Q);
            QRCode qrCode = new QRCode(qrCodeData);

            try
            {
                using (Bitmap bitmap = qrCode.GetGraphic(2)) // Reduced size
                {
                    string directoryPath = Server.MapPath("QRCodeImages");
                    if (!Directory.Exists(directoryPath))
                    {
                        Directory.CreateDirectory(directoryPath);
                    }
                    qrCodeFilePath = Path.Combine(directoryPath, "QRCode.png");
                    bitmap.Save(qrCodeFilePath, ImageFormat.Png);
                    using (MemoryStream ms = new MemoryStream())
                    {
                        bitmap.Save(ms, ImageFormat.Png);
                        byte[] byteImage = ms.ToArray();
                        imgQRCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception (e.g., log the error, show a message to the user)
                Response.Write("<script>alert('An error occurred while generating the QR code: " + ex.Message + "');</script>");
            }
        }

        protected void btnDownloadQRCode_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(qrCodeFilePath) && File.Exists(qrCodeFilePath))
            {
                Response.ContentType = "image/png";
                Response.AppendHeader("Content-Disposition", "attachment; filename=QRCode.png");
                Response.TransmitFile(qrCodeFilePath);
                Response.Flush();
                Response.End();
            }
            else
            {
                Response.Write("<script>alert('QR code file not found.');</script>");
            }
        }
    }
}

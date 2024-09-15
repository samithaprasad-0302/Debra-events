<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingConfirmation.aspx.cs" Inherits="DebraEventManagement.BookingConfirmation" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Booking Confirmation - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        .confirmation-container {
            width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: outset;
            border-radius: 5px;
            background-color: #ffffffa7;
            text-align: center;
        }
        body {
            background-image: url('Images/event.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
        }
        .confirmation-container h2 {
            margin-bottom: 20px;
        }
        .confirmation-container p {
            font-size: 16px;
            margin-bottom: 10px;
        }
        .confirmation-container .btn-home {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .confirmation-container .btn-home:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <h1>EVENTS BY DEBRA</h1>
                <nav>
                    <ul>
                        <li><a href="Home.aspx">Home</a></li>
                        <li><a href="Events.aspx">Events</a></li>
                        <li><a href="Partners.aspx">Partners</a></li>
                        <li><a href="AboutUs.aspx">About Us</a></li>
                        <li><a href="ContactUs.aspx">Contact Us</a></li>
                    </ul>
                </nav>
            </header>
            <main>
                <div class="confirmation-container">
                    <h2>Booking Confirmation</h2>
                    <p>Thank you for your booking!</p>
                    <p>Event: <asp:Label ID="lblEventName" runat="server"></asp:Label></p>
                    <p>Quantity: <asp:Label ID="lblQuantity" runat="server"></asp:Label></p>
                    <p>Total Price: <asp:Label ID="lblTotalPrice" runat="server"></asp:Label></p>
                    <p>Booking Date: <asp:Label ID="lblBookingDate" runat="server"></asp:Label></p>
                    <asp:Image ID="imgQRCode" runat="server" />
                    <asp:Button ID="btnDownloadQRCode" runat="server" Text="Download QR Code" OnClick="btnDownloadQRCode_Click" CssClass="btn-home" />
                    <a href="Home.aspx" class="btn-home">Back to Home</a>
                </div>
            </main>
        </div>
    </form>
</body>
</html>

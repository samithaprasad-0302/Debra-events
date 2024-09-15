<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookTickets.aspx.cs" Inherits="DebraEventManagement.BookTickets" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Book Tickets - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        .form-container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: double;
            border-radius: 10px;
            background: rgba(0, 0, 0, 0.50);
            backdrop-filter: blur(10px);
        }
        body {
            background-image: url('Images/event.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
        }
        .form-container h2 {
            margin-bottom: 25px;
            color: white;
        }
        .form-container .form-group {
            margin-bottom: 15px;
        }
        .form-container .form-group label {
            display: block;
            margin-bottom: 5px;
            color: white;
        }
        .form-container .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            font: bold;
        }
        .form-container .btn-submit {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
            text-align: center;
            width: 100%;
        }
        .form-container .btn-submit:hover {
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
                <div class="form-container">
                    <h2>Book Tickets</h2>
                    <div class="form-group">
                        <label for="lblEventName">Event Name:</label>
                        <asp:Label ID="lblEventName" runat="server"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="txtQuantity">Quantity:</label>
                        <asp:TextBox ID="txtQuantity" runat="server" OnTextChanged="txtQuantity_TextChanged" AutoPostBack="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtPrice">Price:</label>
                        <asp:TextBox ID="txtPrice" runat="server" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtTotal">Total Price:</label>
                        <asp:TextBox ID="txtTotal" runat="server"></asp:TextBox>
                    </div>
                    <!-- Card Details Fields -->
                    <div class="form-group">
                        <label for="txtCardNumber">Card Number:</label>
                        <asp:TextBox ID="txtCardNumber" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtCardName">Name on Card:</label>
                        <asp:TextBox ID="txtCardName" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtExpiryDate">Expiry Date (MM/YY):</label>
                        <asp:TextBox ID="txtExpiryDate" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtCVV">CVV:</label>
                        <asp:TextBox ID="txtCVV" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnBookTicket" runat="server" Text="Book Ticket" CssClass="btn-submit" OnClick="btnBookTicket_Click" />
                    </div>
                </div>
            </main>
        </div>
    </form>
</body>
</html>

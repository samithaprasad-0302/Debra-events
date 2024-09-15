<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetTicketDetails.aspx.cs" Inherits="DebraEventManagement.SetTicketDetails" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Set Ticket Details</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 80px);
        }
        .ticket-details-container {
            background-color: #f0f0f0;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
            width: 500px;
            text-align: left;
        }
        .ticket-details-container h2 {
            margin-bottom: 20px;
            font-size: 24px;
        }
        .ticket-details-container p {
            margin: 10px 0;
        }
        .ticket-details-container input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .ticket-details-container input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .ticket-details-container input[type="submit"]:hover {
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
                        
                        <li><a href="AboutUs.aspx">About Us</a></li>
                        <li><a href="ContactUs.aspx">Contact Us</a></li>
                        <li><a href="PartnerInterface.aspx">Partner Interface</a></li>
                        <li><a href="#" onclick="document.getElementById('logoutForm').submit();">Logout</a></li>
                    </ul>
                </nav>
            </header>
            <div class="container">
                <div class="ticket-details-container">
                    <h2>Set Ticket Details</h2>
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                    <p>
                        <asp:Label ID="lblEventID" runat="server" Text="Event ID:"></asp:Label>
                        <asp:TextBox ID="txtEventID" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblTicketType" runat="server" Text="Ticket Type:"></asp:Label>
                        <asp:DropDownList ID="ddlTicketType" runat="server">
                            <asp:ListItem Text="Select Ticket Type" Value="" />
                            <asp:ListItem Text="Standing" Value="Standing" />
                            <asp:ListItem Text="VIP" Value="VIP" />
                        </asp:DropDownList>
                    </p>
                    <p>
                        <asp:Label ID="lblPrice" runat="server" Text="Price:"></asp:Label>
                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblQuantity" runat="server" Text="Quantity:"></asp:Label>
                        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Button ID="btnSetTicketDetails" runat="server" Text="Set Ticket Details" OnClick="btnSetTicketDetails_Click" />
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

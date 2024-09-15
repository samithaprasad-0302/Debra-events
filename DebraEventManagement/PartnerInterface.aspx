<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartnerInterface.aspx.cs" Inherits="DebraEventManagement.PartnerInterface" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Partner Interface - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 80px);
            
        }
        body {
            background-image: url('Images/partner.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
        }
        .partner-info-container {
            background-color:cadetblue;
            padding: 20px;
            border-radius: 20px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
            width: 500px;
            text-align:center;
        }
        .partner-info-container h2 {
            margin-bottom: 20px;
            font-size: 30px;
           
        }
        .partner-info-container p {
            margin-bottom: 10px;
            font-size:24px;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .button-container input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
            margin: 5px;
        }
        .button-container input[type="submit"]:hover {
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
                        
                        
                        <li><a href="AboutUs.aspx">About Us</a></li>
                        <li><a href="ContactUs.aspx">Contact Us</a></li>
                        <li><a href="RegisterPartner.aspx">Logout</a></li>
                    </ul>
                </nav>
            </header>
            <div class="container">
                <div class="partner-info-container">
                    <h2>Partner Information</h2>
                    <asp:Label ID="lblPartnerInfo" runat="server" Text=""></asp:Label>
                    <div class="button-container">
                        <asp:Button ID="btnAddEvent" runat="server" Text="Add New Event" OnClick="btnAddEvent_Click" />
                        <asp:Button ID="btnViewEvents" runat="server" Text="View Events" OnClick="btnViewEvents_Click" />
                        <asp:Button ID="btnViewSales" runat="server" Text="View Sales" OnClick="btnViewSales_Click" />
                    </div>
                </div>
            </div>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" style="display:none;" />
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSales.aspx.cs" Inherits="DebraEventManagement.ViewSales" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Sales - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        .sales-table {
            width: 80%;
            margin: 50px auto;
            border-collapse:collapse;
            border:outset;
            
        }
        .sales-table th, .sales-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        body {
            background-image: url('Images/sales1.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            
        }
        .sales-table th {
            background-color:darkcyan;
            text-align: left;
        }
        .sales-table tr:nth-child(even) {
            background-color:cyan;
        }
        .sales-table tr:hover {
            background-color: #ddd;
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
                        <li><a href="PartnerInterface.aspx">Partner Interface</a></li>
                        <li><a href="RegisterPartner.aspx">Logout</a></li>
                    </ul>
                </nav>
            </header>
            <main>
                <h2>Sales Details</h2>
                <asp:GridView ID="gvSales" runat="server" CssClass="sales-table" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="EventName" HeaderText="Event Name" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="{0:C}" />
                    </Columns>
                </asp:GridView>
            </main>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageSales.aspx.cs" Inherits="DebraEventManagement.ManageSales" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Sales - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        .manage-sales-container {
            width: 800px;
            
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            margin-left:600px;
            margin-top:300px;

        }
        body {
            background-image: url('Images/admin.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
        }

        .manage-sales-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .sales-details {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .sales-details th, .sales-details td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .sales-details th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }
        .totals {
            margin-top: 20px;
            text-align: right;
        }
        .totals label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="manage-sales-container">
            <h2>Manage Sales</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            <asp:GridView ID="gvSales" runat="server" AutoGenerateColumns="False" CssClass="sales-details">
                <Columns>
                    <asp:BoundField DataField="EventName" HeaderText="Event Name" />
                    <asp:BoundField DataField="PartnerName" HeaderText="Partner Name" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" DataFormatString="{0:yyyy-MM-dd}" />
                </Columns>
            </asp:GridView>
            <div class="totals">
                <label>Total Income: </label>
                <asp:Label ID="lblTotalIncome" runat="server" Text=""></asp:Label><br />
            </div>
        </div>
         <div class="back-button-container">
    <asp:Button ID="btnBackToHome" runat="server" Text="Back to Home" OnClick="btnBackToHome_Click" />
</div>
    </form>
</body>
</html>

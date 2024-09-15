<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTicketSales.aspx.cs" Inherits="DebraEventManagement.ViewTicketSales" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>View Ticket Sales</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>View Ticket Sales</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SaleID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="SaleID" HeaderText="SaleID" ReadOnly="True" SortExpression="SaleID" />
                    <asp:BoundField DataField="TicketID" HeaderText="TicketID" SortExpression="TicketID" />
                    <asp:BoundField DataField="SaleDate" HeaderText="SaleDate" SortExpression="SaleDate" />
                    <asp:BoundField DataField="QuantitySold" HeaderText="QuantitySold" SortExpression="QuantitySold" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DebraEventManagement %>" 
                SelectCommand="SELECT * FROM TicketSales">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>

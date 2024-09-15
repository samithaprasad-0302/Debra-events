<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewEvents.aspx.cs" Inherits="DebraEventManagement.ViewEvents" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Events - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        .event-card {
            background-color: #f8f8f8;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
            margin: 10px;
            padding: 15px;
            width: 300px;
            text-align: center;
            
        }
        body {
            background-image: url('Images/event.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            color:white;
        }
        .event-card img {
            max-width: 100%;
            border-radius: 8px;
            margin-bottom: 10px;
        }
        .event-card h3 {
            margin: 10px 0;
            font-size: 20px;
        }
        .event-card p {
            margin: 5px 0;
            color: #555;
        }
        .event-card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .delete-button {
            margin-top: 10px;
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
        }
        .delete-button:hover {
            background-color: #c82333;
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
            <h2>View Events</h2>
            <div class="event-card-container">
                <asp:Repeater ID="rptEvents" runat="server" OnItemCommand="rptEvents_ItemCommand">
                    <ItemTemplate>
                        <div class="event-card">
                            <asp:Image ID="imgEvent" runat="server" ImageUrl='<%# Eval("EventImage") %>' AlternateText="Event Image" />
                            <h3><%# Eval("EventName") %></h3>
                            <p><%# Eval("EventDate", "{0:MMMM dd, yyyy}") %></p>
                            <p><%# Eval("Location") %></p>
                            <p><%# Eval("Description") %></p>
                            <asp:Button ID="btnDelete" runat="server" CssClass="delete-button" Text="Delete" CommandName="DeleteEvent" CommandArgument='<%# Eval("EventID") %>' />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</body>
</html>

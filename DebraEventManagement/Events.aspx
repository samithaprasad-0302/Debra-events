<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="DebraEventManagement.Events" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Events - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        .event-card {
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            margin: 10px;
            padding: 10px;
            width: calc(50% - 20px);
            max-width: 300px;
            display: inline-block;
            vertical-align: top;
            text-align: left;
            background-color: #f9f9f9;
            transition: transform 0.3s ease-out;
        }
        body {
            background-image: url('Images/event.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            
            
        }
        .event-card:hover {
            transform: scale(1.05);
        }
        .event-card img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .event-card h3 {
            margin-top: 10px;
        }
        .event-card p {
            font-size: 14px;
        }
        .event-card .btn-book {
            display: block;
            margin-top: 10px;
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .event-card .btn-book:hover {
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
                        <li><a href="Login.aspx">Login</a></li>
                        <li><a href="Signup.aspx">Signup</a></li>
                    </ul>
                </nav>
            </header>
            <main>
                <h2>Events</h2>
                <div class="event-cards">
                    <asp:Repeater ID="rptEvents" runat="server">
                        <ItemTemplate>
                            <div class="event-card">
                                <asp:Image ID="imgEvent" runat="server" ImageUrl='<%# Eval("EventImage") %>' AlternateText="Event Image" />
                                <h3><%# Eval("EventName") %></h3>
                                <p><%# Eval("Description") %></p>
                                <p>Date/Time: <%# Eval("EventDate", "{0:MMMM dd, yyyy, h:mm tt}") %></p>
                                
                                <asp:Button ID="btnBook" runat="server" Text="Book Ticket" CommandArgument='<%# Eval("EventID") %>' OnCommand="btnBook_Command" CssClass="btn-book" />

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </main>
        </div>
    </form>
</body>
</html>

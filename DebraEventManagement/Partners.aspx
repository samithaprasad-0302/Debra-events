<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Partners.aspx.cs" Inherits="DebraEventManagement.Partners" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Partners - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        .partner-card {
            
           
            width:500px;
            border: 1px solid #ccc;
            padding: 16px;
            margin: 16px;
            text-align: center;
            transition: transform 0.2s;
            border-radius: 10px;
            display:inline-grid;
            background:#49a0ffb9;
            backdrop-filter:blur(5px);
        }
        body {
            background-image: url('Images/partner1.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 105vh;
            margin: 0;
        }
        .partner-card:hover {
            transform: scale(1.05);
        }
        .partner-card h3 {
            margin: 0;
            padding: 8px 0;
            font-size:25px;
        }
        .partner-card p{
            font-size:18px;
        }
        .join-button {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            background-color:midnightblue;
            color: white;
            text-align: center;
            text-decoration: none;
            font-size:25px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .join-button:hover {
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
                <h2>Our Partners</h2>
                <asp:Repeater ID="rptPartners" runat="server">
                    <ItemTemplate>
                        <div class="partner-card">
                            <h3><%# Eval("PartnerName") %></h3>
                            <p>Email: <%# Eval("ContactEmail") %></p>
                            <p>Phone: <%# Eval("ContactPhone") %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <a class="join-button" href="RegisterPartner.aspx">Join with Us</a>
            </main>
        </div>
    </form>
</body>
</html>

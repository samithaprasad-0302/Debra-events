<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DebraEventManagement.Home" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Home - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        .banner {
            width: 100%;
            height: auto;
            margin: 10px 0;
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
        .event-banners {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .event-banner {
            margin: 10px;
        }
        .login-button {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #28a745;
            color: white;
            font-size: 14px;
            cursor: pointer;
            text-align: center;
        }
        .login-button:hover {
            background-color: #218838;
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
                <h2>UPCOMING EVENTS</h2>
                <section class="event-banners">
                    <div class="event-banner">
                        <img src="Images/event1.jpg" alt="Event 1" class="banner" />
                    </div>
                    <div class="event-banner">
                        <img src="Images/event2.jpg" alt="Event 2" class="banner" />
                    </div>
                    <div class="event-banner">
                        <img src="Images/event3.jpg" alt="Event 3" class="banner" />
                    </div>
                </section>
                <button type="button" class="login-button" onclick="location.href='AdminLogin.aspx'">Admin Login</button>
            </main>
        </div>
    </form>
</body>
</html>

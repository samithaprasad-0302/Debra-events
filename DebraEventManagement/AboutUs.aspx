<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="DebraEventManagement.AboutUs" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>About Us - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        header {
            text-align: center;
            padding: 20px 0;
            background-color:black;
            color: white;
        }
        header h1 {
            margin: 0;
            font-size: 2.5em;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin: 0 10px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        main {
            background-color: #f0f0f0;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
        }
        main h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 2em;
        }
        .section {
            margin-bottom: 40px;
        }
        .section h3 {
            margin-bottom: 10px;
            font-size: 1.5em;
        }
        .section p {
            line-height: 1.6;
        }
        .team {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }
        .team-member {
            width: 30%;
            margin-bottom: 20px;
            text-align: center;
        }
        .team-member img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
        <div class="container">
            <main>
                <h2>About Us</h2>
                <div class="section">
                    <h3>Our Mission</h3>
                    <p>At Debra Event Management, our mission is to create unforgettable experiences for all our clients. We strive to deliver excellence in every event we manage, ensuring that each one is unique and perfectly tailored to our client's vision.</p>
                </div>
                <div class="section">
                    <h3>Our History</h3>
                    <p>Founded in 2010, Debra Event Management has grown from a small local business to a leading event management company. Over the past decade, we have successfully organized a wide range of events, from corporate conferences to private parties, each executed with meticulous attention to detail.</p>
                </div>
                <div class="section">
                    <h3>Our Team</h3>
                    <div class="team">
                        <div class="team-member">
                            <img src="images/11.jpg" alt="Debra Smith">
                            <h4>steve mark</h4>
                            <p>Founder & CEO</p>
                        </div>
                        <div class="team-member">
                            <img src="images/22.jpg" alt="John Doe">
                            <h4>michel adams</h4>
                            <p>Event Coordinator</p>
                        </div>
                        <div class="team-member">
                            <img src="images/33.jpg" alt="Jane Roe">
                            <h4>harry heyman</h4>
                            <p>Marketing Manager</p>
                        </div>
                    </div>
                </div>
                <div class="section">
                    <h3>Contact Information</h3>
                    <p>If you have any questions or would like to know more about our services, please feel free to reach out to us:</p>
                    <p>Email: info@debraevents.com<br>Phone: (123) 456-7890<br>Address: 123 Event St, Suite 456, City, State, ZIP</p>
                </div>
            </main>
        </div>
    </form>
</body>
</html>

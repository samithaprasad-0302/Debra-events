<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="DebraEventManagement.ContactUs" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Contact Us - Debra Event Management</title>
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
        .contact-form {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .contact-details, .form-container {
            width: 48%;
        }
        .contact-details h3, .form-container h3 {
            margin-bottom: 10px;
            font-size: 1.5em;
        }
        .contact-details p, .form-container p {
            line-height: 1.6;
        }
        .form-container form {
            display: flex;
            flex-direction: column;
        }
        .form-container label {
            margin-top: 10px;
            font-weight: bold;
        }
        .form-container input, .form-container textarea {
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-container input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            margin-top: 20px;
            font-size: 16px;
        }
        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .map-container {
            width: 100%;
            height: 400px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Debra Event Management</h1>
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
                <h2>Contact Us</h2>
                <div class="contact-form">
                    <div class="contact-details">
                        <h3>Our Contact Information</h3>
                        <p>
                            <strong>Email:</strong> info@debraevents.com<br>
                            <strong>Phone:</strong> (123) 456-7890<br>
                            <strong>Address:</strong> 123 Event St, Suite 456, City, State, ZIP
                        </p>
                        <div class="map-container">
                            <!-- Embed Google Map here -->
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3153.5002846267527!2d144.96305841531106!3d-37.81410787975153!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad642af0f11fd81%3A0xf5770c1a7f6ea21d!2sVictoria%20State%20Library!5e0!3m2!1sen!2sau!4v1605665232433!5m2!1sen!2sau"
                                width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false"
                                tabindex="0"></iframe>
                        </div>
                    </div>
                    <div class="form-container">
                        <h3>Send Us a Message</h3>
                        <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:Label ID="lblMessage" runat="server" Text="Message:"></asp:Label>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </main>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartnerLogin.aspx.cs" Inherits="DebraEventManagement.PartnerLogin" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Partner Login - Debra Event Management</title>
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
        .login-container {
            background-color: cadetblue;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
            width: 500px;
            text-align: center;
        }
        .login-container h2 {
            margin-bottom: 20px;
            font-size: 30px;
        }
        .login-container p {
            margin: 10px 0;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 5px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .login-container input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 20px;
        }
        .login-container input[type="submit"]:hover {
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
            <div class="container">
                <div class="login-container">
                    <h2>Partner Login</h2>
                    <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    <p>
                        <asp:Label ID="lblPartnerName" runat="server" Text="Partner Name:"></asp:Label>
                        <asp:TextBox ID="txtPartnerName" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

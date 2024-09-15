<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="DebraEventManagement.Signup" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Signup - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        .container {
            display:flex;
            justify-content: center;
            align-items:center;
            height: calc(100vh - 80px);
        }
        body {
            background-image: url('Images/event.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
        }
        .signup-form-container {
            background-color: rgba(240, 240, 240, 0.4);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
            width: 600px;
            text-align:center;
            backdrop-filter:blur(50px);
            
        }
        .signup-form-container h2 {
            margin-bottom: 20px;
            font-size: 30px;
            text-align: center;
        }
        .signup-form-container p {
            margin-bottom: 10px;
            font-size:20px;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .button-container input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 20px;
            
        }
        .button-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .button-container button {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-left: 10px;
        }
        .button-container button:hover {
            background-color: #c82333;
        }
    </style>
    <script>
        function togglePassword() {
            var passwordField = document.getElementById("txtPassword");
            var toggleBtn = document.getElementById("btnTogglePassword");
            
            if (passwordField.type === "password") {
                passwordField.type = "text";
                toggleBtn.textContent = "Hide";
            } else {
                passwordField.type = "password";
                toggleBtn.textContent = "Show";
            }
        }
        
        function clearFields() {
            document.getElementById("txtUsername").value = "";
            document.getElementById("txtEmail").value = "";
            document.getElementById("txtPassword").value = "";
        }
    </script>
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
                    </ul>
                </nav>
            </header>
            <div class="container">
                <div class="signup-form-container">
                    <h2>Signup</h2>
                    <p>
                        <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <button type="button" id="btnTogglePassword" onclick="togglePassword()">Show</button>
                    </p>
                    <div class="button-container">
                        <asp:Button ID="btnSignup" runat="server" Text="Signup" OnClick="btnSignup_Click" />
                        <button type="button" onclick="clearFields()">Clear</button>
                    </div>
                    <p>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

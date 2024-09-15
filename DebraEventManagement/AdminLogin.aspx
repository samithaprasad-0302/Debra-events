<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="DebraEventManagement.AdminLogin" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Login - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        .login-container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 20px;
            background-color:antiquewhite;
            margin-top:200px;
            box-shadow: 0 0 80px rgba(0, 0, 0, 0.4);
        }
        body  {
            background-image: url('Images/admin.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
}
        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .login-container input[type="submit"] {
            width: 60%;
            padding: 10px;
            border: none;
            border-radius: 8px;
            background-color: #28a745;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-left:70px;
            
            
        }
        .login-container input[type="submit"]:hover {
            background-color: #218838;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
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
             
         </ul>
     </nav>
 </header>
        <div class="login-container">
            <h2>Admin Login</h2>
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message"></asp:Label>
            <label for="username">Username:</label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <label for="password">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>

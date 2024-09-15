<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="DebraEventManagement.AdminHome" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Home - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        body {
            background-image: url('Images/admin.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100%;
            width:30%;
            background-color:antiquewhite;
            padding: 20px;
            border-radius: 30px;
            box-shadow: 0 0 80px rgba(0, 0, 0, 0.4);
            margin-left:700px;
            margin-top:150px;
        }
        .admin-options {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px 0;
        }
        .admin-option {
            margin: 10px;
        }
        .admin-option button {
            padding: 15px 25px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
            width: 200px;
        }
        .admin-option button:hover {
            background-color: #0056b3;
        }
        header, main {
            text-align: center;
        }
        header {
            margin-bottom: 20px;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin-right: 10px;
        }
        nav ul li a {
            text-decoration: none;
            color: #007bff;
        }
        nav ul li a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Admin Dashboard</h1>
            <nav>
                <ul>
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a href="AdminHome.aspx">Admin Home</a></li>
                    <li><a href="Logout.aspx">Logout</a></li>
                </ul>
            </nav>
        </header>
        <div class="container">
            <main>
                <h2>Admin Options</h2>
                <div class="admin-options">
                    <div class="admin-option">
                        <button type="button" onclick="location.href='ManageEvents.aspx'">Manage Events</button>
                    </div>
                    <div class="admin-option">
                        <button type="button" onclick="location.href='ManagePartners.aspx'">Manage Partners</button>
                    </div>
                    <div class="admin-option">
                        <button type="button" onclick="location.href='ManageSales.aspx'">Manage Sales</button>
                    </div>
                </div>
            </main>
        </div>
    </form>
</body>
</html>

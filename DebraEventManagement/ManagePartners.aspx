<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagePartners.aspx.cs" Inherits="DebraEventManagement.ManagePartners" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Partners - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        .manage-partners-container {
           
            width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 20px;
            background-color:antiquewhite;
            margin-left:700px;
            box-shadow: 0 0 80px rgba(0, 0, 0, 0.4);
            margin-top:100px;
        }
        body {
           background-image: url('Images/admin.jpg');
           background-size: cover;
           background-position: center;
           background-repeat: no-repeat;
           height: 100vh;
           margin: 0;
           
        }
        .back-button-container {
            text-align: center;
            margin-top: 20px;
        }
        .manage-partners-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .manage-partners-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .manage-partners-container input[type="text"],
        .manage-partners-container textarea {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .manage-partners-container input[type="submit"],
        .manage-partners-container button {
            width: 80%;
            padding: 10px;
            border:outset;
            border-radius: 3px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-left:50px;
        }
        .manage-partners-container button.delete-button {
            background-color: #dc3545;
        }
        .manage-partners-container input[type="submit"]:hover,
        .manage-partners-container button:hover {
            background-color: #0056b3;
        }
        .manage-partners-container button.delete-button:hover {
            background-color: #c82333;
        }
        .partner-info {
            margin-top: 20px;
        }
        .buttons {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 10px;
        }
        .buttons button,
        .buttons input[type="submit"] {
            width: calc(50% - 5px);
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="manage-partners-container">
            <h2>Manage Partners</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            <label for="partnerID">Search Partner by ID:</label>
            <asp:TextBox ID="txtPartnerID" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search Partner" OnClick="btnSearch_Click" />

            <div class="partner-info">
                <label for="partnerName">Partner Name:</label>
                <asp:TextBox ID="txtPartnerName" runat="server"></asp:TextBox>

                <label for="partnerEmail">Contact Email:</label>
                <asp:TextBox ID="txtPartnerEmail" runat="server"></asp:TextBox>

                <label for="partnerPhone">Contact Phone:</label>
                <asp:TextBox ID="txtPartnerPhone" runat="server"></asp:TextBox>

                <asp:Button ID="btnAddPartner" runat="server" Text="Add Partner" OnClick="btnAddPartner_Click" />
                <asp:Button ID="btnDeletePartner" runat="server" Text="Delete Partner" CssClass="delete-button" OnClick="btnDeletePartner_Click" />
                <asp:Button ID="btnClearFields" runat="server" Text="Clear Fields" OnClick="btnClearFields_Click" />
            </div>
        </div>
        <asp:Button ID="btnBackToHome" runat="server" Text="Back to Home" OnClick="btnBackToHome_Click" />
    </form>
</body>
</html>

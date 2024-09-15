<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageEvents.aspx.cs" Inherits="DebraEventManagement.ManageEvents" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Events - Debra Event Management</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>

        .manage-events-container {
            width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color:antiquewhite;
            margin-left:700px;
            box-shadow: 0 0 80px rgba(0, 0, 0, 0.4);
        }
 body {
     background-image: url('Images/admin.jpg');
     background-size: cover;
     background-position: center;
     background-repeat: no-repeat;
     height: 100vh;
     margin: 0;
 }
        .manage-events-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .manage-events-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .manage-events-container input[type="text"],
        .manage-events-container input[type="date"],
        .manage-events-container textarea {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .manage-events-container input[type="submit"],
        .manage-events-container button {
            width: 80%;
            padding: 10px;
            border:outset;
            border-radius: 10px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-left:50px;
            
        }
        .manage-events-container button.delete-button {
            background-color: #dc3545;
            
            
            
            
        }
        .back-button-container {
            text-align: center;
            margin-top: 20px;
           
        }
        .manage-events-container button.clear-button {
            background-color: #6c757d;
            
        }
        .manage-events-container input[type="submit"]:hover,
        .manage-events-container button:hover {
            background-color: #0056b3;
        }
        .manage-events-container button.delete-button:hover {
            background-color: #c82333;
        }
        .manage-events-container button.clear-button:hover {
            background-color: #5a6268;
        }
        .event-info {
            margin-top: 20px;
        }
        .back-button-container button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="manage-events-container">
            <h2>Manage Events</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            <label for="eventID">Search Event by ID:</label>
            <asp:TextBox ID="txtEventID" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search Event" OnClick="btnSearch_Click" />

            <div class="event-info">
                <label for="eventName">Event Name:</label>
                <asp:TextBox ID="txtEventName" runat="server"></asp:TextBox>

                <label for="eventDate">Event Date:</label>
                <asp:TextBox ID="txtEventDate" runat="server" TextMode="Date"></asp:TextBox>

                <label for="eventLocation">Location:</label>
                <asp:TextBox ID="txtEventLocation" runat="server"></asp:TextBox>

                <label for="eventDescription">Event Description:</label>
                <asp:TextBox ID="txtEventDescription" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>

                <label for="eventImage">Event Image URL:</label>
                <asp:TextBox ID="txtEventImage" runat="server"></asp:TextBox>

                <asp:Button ID="btnCreateEvent" runat="server" Text="Create Event" OnClick="btnCreateEvent_Click" />
                <asp:Button ID="btnDeleteEvent" runat="server" Text="Delete Event" CssClass="delete-button" OnClick="btnDeleteEvent_Click" />
                <asp:Button ID="btnClearFields" runat="server" Text="Clear Fields" CssClass="clear-button" OnClick="btnClearFields_Click" />
            </div>
        </div>
         <div class="back-button-container">
            <asp:Button ID="btnBackToHome" runat="server" Text="Back to Home" OnClick="btnBackToHome_Click" />
        </div>
    </form>
</body>
</html>

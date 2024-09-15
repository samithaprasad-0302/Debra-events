<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateEvent.aspx.cs" Inherits="DebraEventManagement.CreateEvent" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Create Event</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        .container {
            
            display: flex;
            justify-content: center;
            align-items: center;
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
        .event-form-container {
            
   
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 40px rgba(0, 0, 0, 0.1);
            width: 500px;
            text-align:center;
            backdrop-filter:blur(10px);
            border:outset;
        }
        .event-form-container h2 {
            margin-bottom: 20px;
            font-size: 30px;
        }
        .event-form-container p {
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
            font-size: 18px;
        }
        .button-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <header>
                <h1>EVENTS BY DEBRA</h1>
                <nav>
                    <ul>
                        <li><a href="Home.aspx">Home</a></li>
                        <li><a href="PartnerInterface.aspx">Partner Interface</a></li>
                        <li><a href="AboutUs.aspx">About Us</a></li>
                        <li><a href="ContactUs.aspx">Contact Us</a></li>
                        <li><a href="RegisterPartner.aspx">Logout</a></li>
                    </ul>
                </nav>
            </header>
            <div class="container">
                <div class="event-form-container">
                    <h2>Create a New Event</h2>
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                    <p>
                        <asp:Label ID="lblEventName" runat="server" Text="Event Name:"></asp:Label>
                        <asp:TextBox ID="txtEventName" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblEventDate" runat="server" Text="Event Date:"></asp:Label>
                        <asp:TextBox ID="txtEventDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="ceEventDate" runat="server" TargetControlID="txtEventDate" Format="MM/dd/yyyy"></asp:CalendarExtender>
                    </p>
                    <p>
                        <asp:Label ID="lblLocation" runat="server" Text="Location:"></asp:Label>
                        <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblEventImage" runat="server" Text="Event Image:"></asp:Label>
                        <asp:FileUpload ID="fuEventImage" runat="server" />
                    </p>
                    <h3>Set Ticket Details</h3>
                    <p>
                        <asp:Label ID="lblTicketType" runat="server" Text="Ticket Type:"></asp:Label>
                        <asp:TextBox ID="txtTicketType" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblPrice" runat="server" Text="Price:"></asp:Label>
                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblQuantity" runat="server" Text="Quantity:"></asp:Label>
                        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                    </p>
                    <p class="button-container">
                        <asp:Button ID="btnCreateEvent" runat="server" Text="Create Event" OnClick="btnCreateEvent_Click" />
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

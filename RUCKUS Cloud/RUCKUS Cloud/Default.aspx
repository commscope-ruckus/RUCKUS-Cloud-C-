<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RUCKUS_Cloud.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 100px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
       <table style="width: 100%;">
            <tr><td class="auto-style2"><asp:Label ID="Label1" runat="server" Text="Email:" Font-Names="Calibri" Font-Size="10pt"></asp:Label></td><td><asp:TextBox ID="txtEmail" runat="server" Width="300px" Font-Names="Calibri">marcelo.molinari@ruckuswireless.com</asp:TextBox></td></tr>
        	<tr><td class="auto-style2"><asp:Label ID="Label2" runat="server" Text="Password:" Font-Names="Calibri" Font-Size="10pt"></asp:Label></td><td><asp:TextBox ID="txtPassword" runat="server" Width="300px" Font-Names="Calibri">password</asp:TextBox></td></tr>
       		<tr><td class="auto-style2"><asp:Button ID="btnGetToken" runat="server" Text="Get Token" OnClick="getToken_Click" Font-Names="Calibri" /></td><td><asp:TextBox ID="txtToken" runat="server" Width="840px" Height="50px" TextMode="MultiLine" Font-Names="Calibri"></asp:TextBox></td></tr>
        </table>
       <table style="width: 100%;">
            <tr><td class="auto-style2"><asp:Button ID="btnGetVenues" runat="server" Text="Get Venues" OnClick="getVenues_Click" Font-Names="Calibri" /></td><td><asp:TextBox ID="txtGetVenues" runat="server" Width="840px" Font-Names="Calibri" Height="50px" TextMode="MultiLine"></asp:TextBox></td></tr>
            <tr><td class="auto-style2"><asp:Button ID="btvGetNetworks" runat="server" Text="Get Networks" OnClick="getNetworks_Click" Font-Names="Calibri" /></td><td><asp:TextBox ID="txtGetNetworks" runat="server" Width="840px" Font-Names="Calibri" Height="95px" TextMode="MultiLine"></asp:TextBox></td></tr>
        	<tr><td class="auto-style2"><asp:Label ID="Label3" runat="server" Text="Name:" Font-Names="Calibri" Font-Size="10pt"></asp:Label></td><td><asp:TextBox ID="txtName" runat="server" Width="350px" Font-Names="Calibri">marcelo</asp:TextBox></td></tr>
        	<tr><td class="auto-style2"><asp:Label ID="Label4" runat="server" Text="Phone:" Font-Names="Calibri" Font-Size="10pt"></asp:Label></td><td><asp:TextBox ID="txtPhone" runat="server" Width="350px" Font-Names="Calibri">+19541234567</asp:TextBox></td></tr>
        	<tr><td class="auto-style2"><asp:Label ID="Label5" runat="server" Text="Network ID:" Font-Names="Calibri" Font-Size="10pt"></asp:Label></td><td><asp:TextBox ID="txtNetworkId" runat="server" Width="350px" Font-Names="Calibri">794e80f2314440fea8aa0f98da18ffff</asp:TextBox></td></tr>
            <tr><td class="auto-style2"><asp:Button ID="btnCreateGuestPass" runat="server" Text="Create Pass" OnClick="createPass_Click" Font-Names="Calibri" /></td><td><asp:TextBox ID="txtCreatePass" runat="server" Width="840px" Font-Names="Calibri" Height="385px" TextMode="MultiLine"></asp:TextBox></td></tr>
       	</table>
    </form>
</body>
</html>

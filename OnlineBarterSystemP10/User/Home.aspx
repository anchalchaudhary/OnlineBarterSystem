<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%--<p>
            <asp:Textbox ID="tbxSearchUser" runat="server" placeholder="Enter Name of User"></asp:Textbox>
            <asp:Button ID="btnSearchUser" runat="server" Text="Search" OnClick="btnSearchUser_Click" />
            <asp:TextBox ID="tbxSearchSkill" runat="server" placeholder="Enter Skill"></asp:TextBox>
            <asp:Button ID="btnSearchSkill" runat="server" Text="Search" OnClick="btnSearchSkill_Click" />
        </p>--%>
        <p>
        <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="tbxName" runat="server" placeholder="Name"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="tbxEmail" runat="server" placeholder="Enter Email"></asp:TextBox>
    </p>
        <asp:Label ID="lblQuery" runat="server" Text="Write your Query"></asp:Label>
        <asp:TextBox ID="tbxQuery" runat="server" TextMode="MultiLine"></asp:TextBox>
    
    
        <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" OnClick="btnSubmit_click" />
    </div>
    </form>
</body>
</html>

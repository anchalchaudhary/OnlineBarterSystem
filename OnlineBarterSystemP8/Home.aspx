<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"  AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
            <asp:Textbox ID="tbxSearchUser" runat="server" placeholder="Enter Name of User"></asp:Textbox>
            <asp:Button ID="btnSearchUser" runat="server" Text="Search" OnClick="btnSearchUser_Click" />
            <asp:TextBox ID="tbxSearchSkill" runat="server" placeholder="Enter Skill"></asp:TextBox>
            <asp:Button ID="btnSearchSkill" runat="server" Text="Search" OnClick="btnSearchSkill_Click" />
        </p>
    </div>
    </form>
</body>
</html>

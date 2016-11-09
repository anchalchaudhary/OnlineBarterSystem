<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="btnAddSkill" runat="server" Text="Add Skill" />
        <asp:TextBox ID="tbxAddSkill" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnSearchSkill" runat="server" Text="Search Need" OnClick="btnSearchSkill_Click" />
        <asp:TextBox ID="tbxSearchSkill" runat="server"></asp:TextBox>
    
    </div>
    </form>
</body>
</html>

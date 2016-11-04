<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddSkills.aspx.cs" Inherits="AddSkills" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ADD YOUR SKILLS</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
            <asp:Label ID="lblSelectGenre" runat="server" Text="Genre Name"></asp:Label>
            <asp:DropDownList ID="ddlGenre" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlGenre_SelectedIndexChange"></asp:DropDownList>
        </p>
        <p>
            <asp:Label ID="lblEnterGenre" runat="server" Text="Enter Name of the Genre"></asp:Label>
            <asp:TextBox ID="tbxGenreName" runat="server" input type="Text"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="lblEnterSkill" runat="server" Text="Enter Your Skill"></asp:Label>
            <asp:TextBox ID="tbxEnterSkill" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_click" />
        </p>
    </div>
    </form>
</body>
</html>

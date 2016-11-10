<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddSkills.aspx.cs" Inherits="AddSkills" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ADD YOUR SKILLS</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
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
            <asp:Button ID="btnAddGenre" runat="server" Text="Add Genre" OnClick="btnAddGenre_click" />
        </p>
        <p>
            <asp:Label ID="lblGenre" runat="server" Text="Selected Genre: "></asp:Label>
            <asp:Label ID="lblSelectedGenre" runat="server"></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblEnterSkill" runat="server" Text="Enter Your Skill"></asp:Label>
            <asp:TextBox ID="tbxEnterSkill" runat="server"></asp:TextBox>
            <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="tbxEnterSkill" MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="5" CompletionInterval="10" ServiceMethod="Get_Skills" >
            </ajaxToolkit:AutoCompleteExtender>
        </p>
        <p>
            <asp:Label ID="lblSkillDetails" runat="server" Text="Details of Skill"></asp:Label>
            <textarea id="txtSkillDetails" cols="50" rows="5"></textarea>
        </p>
        <p>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_click" />
        </p>
    </div>
    </form>
</body>
</html>

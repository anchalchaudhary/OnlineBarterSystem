﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddSkills.aspx.cs" Inherits="AddSkills" %>

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
        <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
        <p>
            <asp:Label ID="lblSelectGenre" runat="server" Text="Genre Name"></asp:Label>
            <asp:DropDownList ID="ddlGenre" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlGenre_SelectedIndexChange"></asp:DropDownList>
        </p>
            <ajaxToolkit:ModalPopupExtender ID="MpeAddGenre" runat="server" PopupControlID="PnlAddGenre" TargetControlID="lnkDummy" CancelControlID="btnDone">
            </ajaxToolkit:ModalPopupExtender>
            
            <asp:Panel ID="PnlAddGenre" runat="server" align="center" style = "display:none">
                <iframe src="AddGenre.aspx" runat="server"></iframe>
                <asp:Button ID="btnDone" runat="server" OnClick="Refresh" Text="Done" />
            </asp:Panel>
        
        <%--<p>
            <asp:Label ID="lblEnterGenre" runat="server" Text="Enter Name of the Genre"></asp:Label>
            <asp:TextBox ID="tbxGenreName" runat="server" input type="Text"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btnAddGenre" runat="server" Text="Add Genre" OnClick="btnAddGenre_click" />
        </p>--%>
        
        <p>
            <asp:Label ID="lblEnterSkill" runat="server" Text="Enter Your Skill"></asp:Label>
            <asp:TextBox ID="tbxEnterSkill" runat="server"></asp:TextBox>
            <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="tbxEnterSkill" MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="5" CompletionInterval="10" ServiceMethod="Get_Skills" >
            </ajaxToolkit:AutoCompleteExtender>
        </p>
        <p>
            <asp:Label ID="lblSkillDetails" runat="server" Text="Details of Skill"></asp:Label>
            <asp:TextBox id="tbxSkillDetails" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btnAddSkill" runat="server" Text="Add Skill" OnClick="btnAddSkill_click" />
        </p>
        <p>
            <%--<asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_click" />--%>
        </p>
        <p>
            <asp:Button id="btnRefresh" runat="server" Text="Refresh" Onclick="Refresh" />
        </p>
        <p>
            <asp:Button ID="btnSearchSkill" runat="server" Text="Search Skill" OnClick="SearchSkill" />
        </p>
        <p>
            <asp:Button ID="btnComment" runat="server" Text="Comment" OnClick="Comment" />
        </p>
        <p>
            <asp:Button ID="btnNotification" runat="server" Text="Notification" OnClick="Notification" />
        </p>
    </div>
    </form>
</body>
</html>
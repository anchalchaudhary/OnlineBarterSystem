<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchSkills.aspx.cs" Inherits="SearchSkills" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
    
            <br />
    
            <asp:Label ID="lblSearchGener" runat="server" Text="EnterGener"></asp:Label>
            <asp:TextBox ID="tbxEnterGener" runat="server" AutoPostBack="True" OnTextChanged="tbxEnterGener_TextChanged"></asp:TextBox>
            <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="tbxEnterGener" MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="5" CompletionInterval="10" ServiceMethod="Get_Genre" >
            </ajaxToolkit:AutoCompleteExtender>
        <br />
        <asp:DropDownList ID="ddlSkills" runat="server" OnSelectedIndexChanged="ddlSkills_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="SearchProvider" />
    
    </div>
    </form>
</body>
</html>

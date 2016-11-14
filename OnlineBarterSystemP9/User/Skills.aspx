<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Skills.aspx.cs" Inherits="SearchSkills" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        #lnkUser{
            text-decoration:none;
        }
    </style>
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
        <asp:DropDownList ID="ddlSkills" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SearchProvider">
        </asp:DropDownList>
    <asp:Repeater ID="RepeaterComment" OnItemCommand="RepeaterLink" runat="server">
                <ItemTemplate>
                    <table>
                        <tr>
                            <th>
                                Provider
                            </th>
                            <th>
                                Discription
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lnkUser" runat="server" Text='<%#Eval("Email") %>'></asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("SkillDetails") %>'></asp:Label>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                    </ItemTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>

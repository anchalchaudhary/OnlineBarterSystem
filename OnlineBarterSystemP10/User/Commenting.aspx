﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Commenting.aspx.cs" Inherits="Commenting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Repeater</title>
    <meta http-equiv="refresh" content="30;url=../Commenting.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="tbxComment" TextMode="multiline" Columns="50" Rows="5" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnComment" runat="server" OnClick="Comment_Click" Text="Comment" ValidateRequestMode="Disabled" />
            <br />
            <asp:Repeater ID="RepeaterComment" runat="server">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblSender" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="ldlSemiColon" runat="server" Text=" : "></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblComment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
            <div>
                <asp:Button ID="lblLogout" runat="server" Text="Logout" OnClick="lblLogout_Click" />
            </div>
        </div>
    </form>
</body>
</html>


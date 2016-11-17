<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Requests.aspx.cs" Inherits="Requests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>REQUESTS</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="RepeaterRequest" runat="server">
            <ItemTemplate>
                <table>
                    <tr>
                        <th>
                            Follower
                        </th>
                        <th>
                            Skill Needed
                        </th>
                        <th>
                            Response
                        </th>
                        </tr>
                    <tr>
                        <td>
            <asp:Label id="lblFollower" runat="server" Text='<%#Eval("FollowerId") %>'></asp:Label>
                            </td>
                        <td>
                            <asp:Label ID="lblSkill" runat="server" Text='<%#Eval("SkillId") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnAccept" runat="server" Text="Accept" />
                        </td>
                        </tr>
                </table>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>

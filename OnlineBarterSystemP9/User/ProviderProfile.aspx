<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProviderProfile.aspx.cs" Inherits="ProviderProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater ID="RepeaterProfile" runat="server">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:ImageButton ID="imgProfile" runat="server" ImageUrl='<%#Eval("ProfilePicture") %>' />
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPhone" runat="server" Text='<%#Eval("Phone") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCity" runat="server" Text='<%#Eval("City") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
            <table>
                <tr>
                    <th>Skills
                    </th>
                    <th>Description
                    </th>
                    <th>Ratings
                    </th>
                    <th>Rate
                    </th>
                </tr>
                <asp:Repeater ID="RepeaterSkills" OnItemCommand="SkillSelecting" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lblSkill" runat="server" Text='<%#Eval("SkillName") %>'></asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label ID="lblDetails" runat="server" Text='<%#Eval("SkillDetails") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblRating" runat="server" Text='<%#Eval("Rating") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbxRate" runat="server" Text=""></asp:TextBox>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            <p>
                TO Apply for a Need click on the respective skill
            </p>
            <p>
                <asp:Label ID="lblInfo" runat="server" ForeColor="#CC00CC" ></asp:Label>
            </p>
        </div>
    </form>
</body>
</html>

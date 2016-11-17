<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="User_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PROFILE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater ID="RepeaterDetails" runat="server" OnItemCommand="RepeaterProfile">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <div style="height:230px;width:230px;">
                                <asp:Image ID="imgProfile" runat="server" style="height:100%;width:100%;max-height:100%;max-width:100%;"/>
                                    </div>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="name" runat="server" Text="Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" Text=" : "></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' Visible="true"></asp:Label>
                                            <asp:TextBox ID="tbxName" runat="server" Text='<%#Eval("Name") %>' Visible="false"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" Display="Dynamic" ControlToValidate="tbxName" ErrorMessage="Name is required" ForeColor="red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="email" runat="server" Text="Email"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" Text=" : "></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>' Visible="true"></asp:Label>
                                            <asp:TextBox ID="tbxEmail" runat="server" Text='<%#Eval("Email") %>' Visible="false"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" Display="Dynamic" ControlToValidate="tbxEmail" ErrorMessage="Email is required" ForeColor="red"></asp:RequiredFieldValidator>
                                        </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="gender" runat="server" Text="Gender" ></asp:Label>
                                            </td>
                                        <td>
                                            <asp:Label runat="server" Text=" : "></asp:Label>
                                        </td>
                                            <td>
                                                <asp:Label ID="lblGender" runat="server" Text='<%#Eval("Gender") %>' Visible="true"></asp:Label>
                                                <asp:RadioButton ID="RadioButtonMale" runat="server" Text=" Male" GroupName="Gender" Visible="false" Enabled="false" />
                                                <asp:RadioButton ID="RadioButtonFemale" runat="server" Text=" Female" GroupName="Gender" Visible="false" Enabled="false"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="city" runat="server" Text="City" ></asp:Label>
                                            </td>
                                        <td>
                                            <asp:Label runat="server" Text=" : "></asp:Label>
                                        </td>
                                            <td>
                                                <asp:Label ID="lblCity" runat="server" Text='<%#Eval("City") %>' Visible="true"></asp:Label>
                                                <asp:TextBox ID="tbxCity" runat="server" Text='<%#Eval("City") %>' Visible="false"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" Display="Dynamic" ControlToValidate="tbxCity" ErrorMessage="Enter City" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="phone" runat="server" Text="Phone" ></asp:Label>
                                            </td>
                                        <td>
                                            <asp:Label runat="server" Text=" : "></asp:Label>
                                        </td>
                                            <td>
                                                <asp:Label ID="lblPhone" runat="server" Text='<%#Eval("Phone") %>' Visible="true"></asp:Label>
                                                <asp:TextBox ID="tbxPhone" runat="server" Text='<%#Eval("Phone") %>' Visible="false"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="dob" runat="server" Text="Date Of Birth" ></asp:Label>
                                            </td>
                                        <td>
                                            <asp:Label runat="server" Text=" : "></asp:Label>
                                        </td>
                                            <td>
                                                <asp:Label ID="lblDob" runat="server" Text='<%#Eval("Dob") %>' Visible="true"></asp:Label>
                                                <asp:Label ID="tbxDob" runat="server" Text='<%#Eval("Dob") %>' Visible="false"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" Display="Dynamic" ControlToValidate="tbxPhone" ErrorMessage="Phone is required" ForeColor="red"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server" Display="Dynamic" ControlToValidate="tbxPhone" ValidationExpression="[7-9][0-9]{9}" ErrorMessage="Enter a valid phone number" ForeColor="red"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                    <tr>
                                        <asp:ImageButton ID="btnEdit" runat="server" class="glyphicon glyphicon-edit"  CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Text="Edit" />
                                        <asp:ImageButton ID="btnUpdate" runat="server" class="glyphicon glyphicon-thumbs-down"  CommandName="Update" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Text="Udate" Visible="false" />
                                    </tr>
                                    <tr>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
            <br />
            <br />
            <table>
                <tr>
                    <th>
                        Skill
                    </th>
                    <th>
                        Ratings
                    </th>
                </tr>
                <tr>
            <asp:Repeater ID="RepeaterSkills" runat="server" OnItemCommand="FillSkills">
                <ItemTemplate>
                    <td>
                            <asp:Label ID="lblSkillName" runat="server" Text='<%#Eval("SkillId") %>'></asp:Label>
                        </td>
                    <td>
                        <asp:Label ID="lblRating" runat="server" Text='<%#Eval("Rating") %>'></asp:Label>
                    </td>
                    
                </ItemTemplate>
            </asp:Repeater>
                    </tr>
                </table>
        </div>
    </form>
</body>
</html>

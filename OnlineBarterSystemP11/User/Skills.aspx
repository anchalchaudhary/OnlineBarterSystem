<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Skills.aspx.cs" Inherits="SearchSkills" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">VERBENDEN</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="Profile.aspx"><span class="glyphicon glyphicon-eye-open"></span>View Profile</a></li>
      <li><a href="Requests.aspx"><span class="glyphicon glyphicon-bookmark"></span>Notification</a></li>
      <li><a href="AddSkills.aspx"><span class="glyphicon glyphicon-plus"></span>Add Skill</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Home.aspx"><span class="glyphicon glyphicon-pencil"></span>Query Us</a></li>
      <li><a href="Logout.aspx"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
    </ul>
  </div>
</nav>
    <form id="form1" runat="server">
        <div id="container">
            <div class="col-sm-4">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <%--<asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>--%>

            <br />

            <asp:Label ID="lblSearchGener" runat="server" Text="EnterGener"></asp:Label>
            <asp:TextBox ID="tbxEnterGener" class="form-control"  runat="server" AutoPostBack="True" OnTextChanged="tbxEnterGener_TextChanged"></asp:TextBox>
            <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="tbxEnterGener" MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="5" CompletionInterval="10" ServiceMethod="Get_Genre">
            </ajaxToolkit:AutoCompleteExtender>
            <br />
            <asp:DropDownList ID="ddlSkills"  class="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SearchProvider">
            </asp:DropDownList>
            </div>
            <table>
                <tr>
                    <th>

                    </th>
                    <th >

                        Name
                    </th>
                    <th>Provider
                    </th>
                    <th>Ratings
                    </th>
                </tr>
                <asp:Repeater ID="RepeaterComment" OnItemCommand="RepeaterLink" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                *
                            </td>
                            <td>
                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkUser" runat="server" Text='<%#Eval("Email") %>'></asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("Rating") %>'></asp:Label>
                            </td>
                            <td></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </form>
</body>
</html>

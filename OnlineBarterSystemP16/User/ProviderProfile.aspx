<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProviderProfile.aspx.cs" Inherits="ProviderProfile" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <title>PROVIDER PROFILE</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
    <!-- Compiled and minified jQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <!-- Compiled and minified JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".button-collapse").sideNav();
        });

    </script>

    <style>
        .nav-wrapper {
            background-color: whitesmoke !important;
        }

        nav ul li a {
            color: grey !important;
            font-family: 'Roboto Slab', serif;
            overflow-x: hidden;
            font-size: large;
            padding-left: 1%;
        }

            nav ul li a:hover {
                border-top: 1px solid black;
                border-bottom: 1px solid black !important;
                color: black !important;
            }

        .container {
            width: 100%;
        }

        a:hover {
            color: Highlight !important;
        }

        body {
            display: flex;
            min-height: 100vh;
            flex-direction: column;
        }

        .row {
            margin-bottom: 0%;
        }
    </style>
</head>
<body>
    <div>
        <nav>
            <div class="nav-wrapper">
                <a href="Home.aspx" class="brand-logo">
                    <img src="../image/nav_logo.png" class="responsive-img" style="margin-left: 10%" />
                </a>
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons cyan-text">menu</i></a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li><a href="Home.aspx#about-barter">ABOUT</a></li>
                    <li><a href="Query.aspx">QUERY US</a></li>
                    <li><a href="Home.aspx">LOGOUT</a></li>
                </ul>
                <ul class="side-nav" id="mobile-demo">
                    <li><a href="Home.aspx#about-barter">ABOUT</a></li>
                    <li><a href="Query.aspx">QUERY US</a></li>
                    <li><a href="Home.aspx">LOGOUT</a></li>
                </ul>
            </div>
        </nav>
        <nav>
            <div class="nav-wrapper">
                <ul>
                    <li><a href="Profile.aspx" style="font-size: medium">PROFILE</a></li>
                    <li><a href="Skills.aspx" style="font-size: medium">SEARCH SKILLS</a></li>
                    <%--<li><a href="AddSkills.aspx" style="font-size: medium">ADD SKILLS</a></li>--%>
                    <li><a href="Requests.aspx" style="font-size: medium">REQUESTS</a></li>
                </ul>
            </div>
        </nav>
    </div>
    
    <div>&nbsp</div>
    <div>&nbsp</div>
    <form id="form1" runat="server">
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div class="row">
            <div class="col m3 s3">
                <%--<div style="height:230px;width:230px;">--%>
                <asp:Image ID="imgProfile" runat="server" class="circle responsive-img" Style="height: 90%; width: 90%; max-height: 100%; max-width: 100%;" />
            </div>
            <div class="col m6 s6">
                <asp:Repeater ID="RepeaterProfile" OnItemCommand="RepeaterProfile_ItemCommand" runat="server">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' Font-Bold="true" Font-Size="X-Large"></asp:Label>
                                                <div>
                                                    <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>' Font-Size="Large"></asp:Label>
                                                </div>
                                                <div>
                                                    <asp:Label ID="lblPhone" runat="server" Text='<%#Eval("Phone") %>' Font-Size="Large"></asp:Label>
                                                </div>
                                                <div>
                                                    <asp:Label ID="lblCity" runat="server" Text='<%#Eval("City") %>' Font-Size="Large"></asp:Label>
                                                </div>
                                            </td>
                                            <%--<td>
                                            <asp:ImageButton ID="btnPhoto" runat="server" class="glyphicon glyphicon-edit" CommandName="Apply" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Text="Photo" />
                                        </td>--%>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="col m3 s3">
            <asp:Button ID="btnMessage" class="btn btn-primary" runat="server" OnClick="btnMessage_Click" Text="Message" />
        
            </div>
        </div>
        <div class="row">
            <div class="col m3 s3"></div>
            <div class="col m6 s6">
                <table class="highlight" style="margin-bottom: 10px">
                    <tr>
                        <th class="auto-style3">Skills
                        </th>
                        <th class="auto-style3">Description
                        </th>
                        <th class="auto-style3">Ratings
                        </th>
                        <th class="auto-style3">Rate
                        </th>
                    </tr>
                    <br />
                    <asp:Repeater ID="RepeaterSkills" OnItemCommand="SkillSelecting" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lblSkill" runat="server" CommandName="RequestSkill" Text='<%#Eval("SkillName") %>'></asp:LinkButton>
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
                            <td>
                                <%--<asp:Button ID="btnApply" runat="server"  CommandName="Apply" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Text="Edit" />
                                <asp:Button ID="btnCancel" runat="server"  CommandName="Cancel" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Text="Udate" Visible="false" />--%>
                            </td>
                            <td>
                                <asp:Label ID="lblRequested" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="btnReview" runat="server" Text="Reviews" CommandName="Show_Reviews" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                </table>

                <p style="color: rebeccapurple">
                    To Apply for a Need click on the respective skill
                </p>
                <p>
                    <asp:Label ID="lblInfo" runat="server" ForeColor="#CC00CC"></asp:Label>

                </p>
            </div>
            <div class="col m2 s3"></div>
        </div>
        <footer class="page-footer  grey darken-4" style="margin-bottom: 0%">
            <%--<div class="container">--%>
            <div class="row">
                <div class="col m4 s4">
                    <a class="white-text left-align" href="Query.aspx">CONTACT US</a>
                </div>

                <div class="col m4 s4">
                    <h5 class="white-text center-align">
                        <img src="../image/bartar_logo_footer.png" class="responsive-img" /></h5>
                </div>

                <div class="col m4 s4">
                    <p class="white-text right-align ">FOLLOW US</p>
                    <div class="abc" style="float: right">
                        <%--<div class="col m3 s3">--%>
                        <img src="../image/fb.png" height="20vmin" width="20vmin" style="float: right; margin: 2px" />
                        <%--</div>--%>
                        <%--<div class="col m3 s3">--%>
                        <img src="../image/twitter.png" height="20vmin" width="20vmin" style="float: right; margin: 2px" />
                        <%--</div>--%>
                        <%--<div class="col m3 s3">--%>
                        <img src="../image/gplus.png" height="20vmin" width="20vmin" style="float: right; margin: 2px" />
                        <%--</div>--%>
                        <%--<div class="col m3 s3">--%>
                        <img src="../image/insta.png" height="20vmin" width="20vmin" style="float: right; margin: 2px" />
                        <%--</div>--%>
                    </div>
                </div>
            </div>
            <%--</div>--%>
        </footer>
    </form>
</body>
</html>

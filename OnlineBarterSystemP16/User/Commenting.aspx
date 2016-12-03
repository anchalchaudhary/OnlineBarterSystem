<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Commenting.aspx.cs" Inherits="Commenting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <title>POST</title>
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
            color: blue !important;
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
    <div>&nbsp</div>
    <div>&nbsp</div>


    <form id="form1" runat="server">

        <div class="row">
            <div class="col m3 s3"></div>
            <div class="col m6 s6">
                <asp:Label ID="lblPost" runat="server" Text="What do you know and what do you want to learn...?" Font-Italic="true" Font-Bold="true" Font-Size="Small"></asp:Label>
                <asp:TextBox ID="tbxComment" class="form-control" TextMode="multiline" Columns="50" Rows="5" runat="server" placeholder="Write here..."></asp:TextBox>
                <br />
                <asp:Button ID="btnComment" class="btn btn-primary" runat="server" OnClick="Comment_Click" Text="Post" ValidateRequestMode="Disabled" />
            </div>
            <div class="col m3 s3"></div>
        </div>
        <br />
        <br />
        <br />

        <asp:Repeater ID="RepeaterComment" runat="server" OnItemCommand="RepeaterReply" OnItemDataBound="BoundReply">
            <ItemTemplate>
                <div class="row">
                    <div class="col m3 s3">
                    </div>
                    <div class="col m6 s6">
                        <div class="card grey lighten-4">
                            <div class="card-content black-text">
                                <br />
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Image ID="imgCommentImage" ImageUrl='<%# Eval("Image")%>' runat="server" Style="height: 40px; width: 40px" />

                                            <asp:Label ID="lblCommentId" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblSender" runat="server" Text='<%#Eval("Name") %>' Font-Bold="true" Font-Size="Medium"></asp:Label>

                                            <asp:Label ID="ldlSemiColon" runat="server" Text=" : " Font-Bold="true" Font-Size="Medium"></asp:Label>

                                            <asp:Label ID="lblComment" runat="server" Text='<%#Eval("Comment") %>' Font-Size="Large"></asp:Label>

                                            <asp:LinkButton ID="btnReply" runat="server" class="glyphicon glyphicon-comment" CommandName="reply" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Text="Reply" />
                                            <asp:LinkButton ID="btnPost" runat="server" class="glyphicon glyphicon-pushpin" CommandName="post" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Visible="false" Text="Comment" />

                                            <asp:ImageButton ID="btnLike" class="glyphicon glyphicon-thumbs-up" runat="server" CommandName="like" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' AlternateText="Like"></asp:ImageButton>
                                            <asp:ImageButton ID="btnUnLike" class="glyphicon glyphicon-thumbs-down" runat="server" Visible="false" CommandName="Unlike" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' AlternateText="UnLike"></asp:ImageButton>
                                        </td>
                                    </tr>
                                    <asp:Repeater ID="RepeaterReply" runat="server">
                                        <ItemTemplate>
                                            <table style="margin-left: 5%">
                                                <tr>
                                                    <td>&nbsp
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblContinue" runat="server"></asp:Label>
                                                        <asp:Image ID="imgReplyImage" ImageUrl='<%# Eval("Image")%>' runat="server" Style="height: 40px; width: 40px" />
                                                        <asp:Label ID="lblSender" runat="server" Text='<%#Eval("Name") %>' Font-Bold="true" Font-Size="Medium"></asp:Label>
                                                        <asp:Label ID="lblSemiColon" runat="server" Text=" : " Font-Bold="true"></asp:Label>
                                                        <asp:Label ID="lblReply" runat="server" Text='<%#Eval("Reply") %>' Font-Size="Medium"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <asp:HiddenField ID="hfCustomerId" runat="server" Value='<%# Eval("Id") %>' />
                                    <tr>
                                        <asp:TextBox ID="tbxReply" class="form-control" runat="server" Visible="false"></asp:TextBox>
                                    </tr>
                                </table>
                            </div>
                            </div>
                </div>
                <div class="col m3 s3"></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <!--footer-->
        <footer class="page-footer  grey darken-4" style="margin-bottom: 0%;">
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
    <script>
        //function Reply()
        //{
        //    tbxReply.Visible = true;
        //}
    </script>
</body>
</html>


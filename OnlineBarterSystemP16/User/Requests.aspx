﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Requests.aspx.cs" Inherits="Requests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <title>REQUESTS</title>
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

        .auto-style2 {
            width: 55px;
        }
    </style>
</head>
<body>
    <!-- Above navigation bar -->

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
                    <%--<li class="tab"><a href="AddSkills.aspx" >ADD SKILLS</a></li>--%>
                    <li><a href="Skills.aspx" style="font-size: medium">SEARCH SKILLS</a></li>
                    <%--<li><a href="AddSkills.aspx" style="font-size: medium">ADD SKILLS</a></li>--%>
                    <li class="active"><a href="Requests.aspx" style="font-size: medium">REQUESTS</a></li>
                </ul>
            </div>
        </nav>
    </div>
    
    <div>&nbsp</div>
    <div>&nbsp</div>
    <form id="form1" runat="server">
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div class="row">
            <div class="col m3 s3"></div>
            <div class="col m6 s6">
                <div class="table">
                    <table class="highlight" "text-align: center;">
                        <tr>
                            <th class="auto-style6">&nbsp&nbsp Followers
                            </th>
                            <th class="auto-style6">&nbsp&nbsp Skill Needed
                            </th>
                            <th class="auto-style6">&nbsp&nbsp Response
                            </th>
                        </tr>
                        <asp:Repeater ID="RepeaterRequest" runat="server" OnItemCommand="RepeaterRequest_ItemCommand">
                            <ItemTemplate>
                                <tr>

                                    <td>
                                        <asp:Label ID="lblFollower" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblSkill" runat="server" Text='<%#Eval("SkillName") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnAccept" runat="server" CommandName="Accept" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Text="Accept" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                    <asp:Label ID="lblInfo" runat="server" ForeColor="#CC0000"></asp:Label>
                </div>
            </div>
            <div class="col m3 s3"></div>
        </div>
        
            <br />
        <div class="row">
            <div class="col m3 s3">
                
            </div>
            <div class="col m6 s6">
                
                <asp:Label ID="lblRequests" runat="server" Text="MESSAGES : " Font-Bold="true" ForeColor="Red"></asp:Label>
            <div><asp:Repeater id="RepeaterMessages" runat="server" OnItemCommand="RepeaterMessageViewed_ItemCommand">
                 <%----%>
                <ItemTemplate>
            <table>
                <tr>
                    <asp:LinkButton ID="btnSender" runat="server" CommandName="Message" Text='<%#Eval("Email") %>'></asp:LinkButton>
                </tr>
            </table>
                    </ItemTemplate>
                </asp:Repeater>
                </div>
            <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000" ></asp:Label>
                </div>
            <div class="col m3 s3"></div>
        </div>
        <!--footer-->
        <footer class="page-footer  grey darken-4" style="margin-top: 18%; margin-bottom: 0%; padding-bottom: 1.2%">
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

﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reviews.aspx.cs" Inherits="User_Reviews" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <title>REVIEWS</title>
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
    <form id="form1" runat="server">
        <asp:Label ID="lblReviewedUser" runat="server"></asp:Label>
        <asp:Label ID="lblSkillReviewed" runat="server"></asp:Label>

        <div class="row">
            <div class="col m2 s2"></div>
            <div class="col m8 s8">
        <div class="table table-condensed">
            <table class="auto-style5">
                <asp:Repeater ID="RepeaterReviews" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="lblReviewer" runat="server" Text='<%#Eval("Name") %>' Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblReview" runat="server" Text='<%#Eval("Review") %>'></asp:Label>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
                
</div>
            <div class="col m2 s2"></div>
        <div>
        </div>
        <div class="col m2 s2"></div>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
        <!--footer-->
        <footer class="page-footer  grey darken-4" style="margin-top: 29%;">
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
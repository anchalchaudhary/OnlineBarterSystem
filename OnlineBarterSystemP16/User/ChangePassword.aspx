<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="User_ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <title>CHANGE PASSWORD</title>
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
    <form id="form1" runat="server">
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
                    <%--<li><a href="Home.aspx">LOGOUT</a></li>--%>
                </ul>
                <ul class="side-nav" id="mobile-demo">
                    <li><a href="Home.aspx#about-barter">ABOUT</a></li>
                    <li><a href="Query.aspx">QUERY US</a></li>
                    <%--<li><a href="Home.aspx">LOGOUT</a></li>--%>
                </ul>
            </div>
        </nav>
        </div>
        <div><br /></div>
        
    <div>&nbsp</div>
        <div class="row"></div>
        <div class="row">
            <div class="col m3 s3"></div>
            <div class="card grey lighten-4 col m6 s6">
                <div class="card-content black-text">
                    <span class="card-title">CHANGE PASSWORD</span>
                    <asp:Label ID="lblPassWord" runat="server"></asp:Label>
                    <asp:TextBox ID="tbxPassword" class="form-control" type="password" runat="server" placeholder="Enter Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" Display="Dynamic" ControlToValidate="tbxPassword" ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server" Display="Dynamic" ErrorMessage="Password length must be between 8 to 15. Characters allowed: a-z A-Z 0-9 . #" ControlToValidate="tbxPassword" ValidationExpression="^[a-zA-Z0-9.#\s]{7,15}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:Label ID="Label1" runat="server" Text="Confirm Password"></asp:Label>
                    <asp:TextBox ID="tbxConfirmPassword" class="form-control" input type="password" runat="server" placeholder="Re-enter Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" Display="Dynamic" ControlToValidate="tbxConfirmPassword" ErrorMessage="Re-enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ErrorMessage="Passwords do not match" runat="server" Display="Dynamic" ControlToCompare="tbxPassword" ControlToValidate="tbxConfirmPassword" ForeColor="Red"></asp:CompareValidator>
                    <asp:Button ID="btnChange" class="btn btn-primary"  runat="server" Text="Change Password" OnClick="Change" />
                </div>
            </div>
        </div><!--footer-->
        <footer class="page-footer  grey darken-4" style="margin-top: 13%; margin-bottom: 0%; padding-bottom: 1.2%">
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

﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/f299e4c7c4.js"></script>
    <link href="../css/stylehome.css" rel="stylesheet" type="text/css" />
    <link href="../css/nav_footer.css" rel="stylesheet" type="text/css" />
    <style>
        .main_img {
            background-image: url("../image/hero_img.png") !important;
            background-size: contain;
            background-repeat: no-repeat;
            width: 106%;
        }

        @media (min-width: 700px) and (max-width: 990px) {
            .main_img {
                width: 122%;
            }
        }

        @media (min-width: 500px)(max-width: 700px) {
            .main_img {
                width: 122%;
            }
        }

        @media (max-width: 500px) {
            .main_img {
                width: 106%;
            }
        }
    </style>
</head>
<body>
    <!-- Above navigation bar -->

    <nav class="[ navbar navbar-fixed-top ][ navbar-bootsnipp animate ]" role="navigation">
        <div class="[container-fluid ]">

            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="[ navbar-header ]">
                <button type="button" class="[ navbar-toggle ]" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="[ sr-only ]">Toggle navigation</span>
                    <span class="[ icon-bar ]"></span>
                    <span class="[ icon-bar ]"></span>
                    <span class="[ icon-bar ]"></span>
                </button>
                <div class="[ animbrand ]">
                    <a class="[ navbar-brand ][ animate ]" href="Home.aspx">
                        <img src="../image/nav_logo.png" class="img-responsive" alt="Responsive image"></a>
                </div>
            </div>





            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="[ collapse navbar-collapse ]" id="bs-example-navbar-collapse-1">
                <ul class="[ nav navbar-nav navbar-right ]">
                    <li class="[ visible-xs ]">
                        <form role="search">
                            <div class="[ input-group ]">
                                <input type="text" class="[ form-control ]" name="q" placeholder="Search for snippets">
                                <span class="[ input-group-btn ]">
                                    <button class="[ btn btn-primary ]" type="submit"><span class="[ glyphicon glyphicon-search ]"></span></button>
                                    <button class="[ btn btn-danger ]" type="reset"><span class="[ glyphicon glyphicon-remove ]"></span></button>
                                </span>
                            </div>
                        </form>
                    </li>

                    <li><a href="#about-barter" class="[ animate ]">ABOUT</a></li>
                    <li><a href="Query.aspx" class="[ animate ]">QUERY US</a></li>
                    <li>
                        <%--<a href="#" class="[ dropdown-toggle ][ animate ]" data-toggle="dropdown">GENRES <span class="[ caret ]"></span></a>--%>
                        <%--<ul class="[ dropdown-menu ]" role="menu">
							<li><a href="#" class="[ animate ]">Blog</a></li>
							<li><a href="#" class="[ animate ]">List of resources </a></li>
							<li><a href="#" class="[ animate ]">Download Bootstrap </a></li>
							
							<li><a href="#" class="[ animate ]">Browse Templates </a></li>
							
							<li><a href="#" class="[ animate ]">Form Builder </a></li>
							<li><a href="#" class="[ animate ]">Button Builder </a></li>
						</ul>--%>
                    </li>


                    <li><a class="animate" href="Registration.aspx">SIGNUP</a></li>
            </div>
        </div>
    </nav>

    <form id="form1" runat="server">
        <div id="container">
            <div class="jumbotron text-center">
                <h1>Log in
                </h1>
            </div>
            <div class="col-sm-4">
            </div>
            <div class="col-sm-4">
                <p>
                    <asp:Label ID="lblEmail" runat="server" Text="Email" Font-Bold="true" Font-Size="Medium"></asp:Label>
                    <asp:TextBox ID="tbxEmail" class="form-control" input type="email" placeholder="Enter Email" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" Display="Dynamic" ControlToValidate="tbxEmail" ErrorMessage="Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblIncorrectEmail" runat="server" display="Dynamic" ForeColor="Red"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="lblPassword" runat="server" Text="Password" Font-Bold="true" Font-Size="Medium"></asp:Label>
                    <asp:TextBox ID="tbxPassword" class="form-control" input type="password" placeholder="Enter Password" runat="server"></asp:TextBox>
                    <asp:Label ID="lblIncorrectPassword" runat="server" Text="Incorrect Password" display="Dynamic" ForeColor="Red"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" Display="Dynamic" ControlToValidate="tbxPassword" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <div class="forget-password-link" style="float: left;">
                    <a href="ForgotPassword.aspx">Forgot Password?</a>
                </div>
                <p>
                    <asp:Button ID="btnLogin" class="btn btn-primary btn-block" runat="server" style="width:85%;background-color:#1fbad6;" Text="Login" OnClick="btnLogin_Click" />
                </p>
                <div class="not-register-yet-link">
                    NOT YET REGISTERED? <a href="#">SIGN UP</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

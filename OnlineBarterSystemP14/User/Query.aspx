<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Query.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QUERY US</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
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
        .auto-style2 {
            width: 100px
        }
        .auto-style3 {
            width: 100px;
            height: 50px;
        }
        .auto-style4 {
            height: 50px;
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
                    
                    <%--<li><a href="Query.aspx" class="[ animate ]">PROFILE</a></li>
                    <li><a href="Commenting.aspx" class="[ animate ]">POSTS</a></li>
                    <li><a href="AddSkills.aspx" class="[ animate ]">ADD SKILLS</a></li>
                    <li><a href="Skills.aspx" class="[ animate ]">SEARCH SKILLS</a></li>
                    <li><a href="Requests.aspx" class="[ animate ]">REQUESTS</a></li> --%>                  
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


                    <%--<li><a class="animate" href="Logout.aspx">LOGOUT</a></li>--%>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div>&nbsp</div>
    <div id="container">
        <%--<p>
            <asp:Textbox ID="tbxSearchUser" runat="server" placeholder="Enter Name of User"></asp:Textbox>
            <asp:Button ID="btnSearchUser" runat="server" Text="Search" OnClick="btnSearchUser_Click" />
            <asp:TextBox ID="tbxSearchSkill" runat="server" placeholder="Enter Skill"></asp:TextBox>
            <asp:Button ID="btnSearchSkill" runat="server" Text="Search" OnClick="btnSearchSkill_Click" />
        </p>--%>
        <div class="col-sm-4">

        </div>
            <div class="col-sm-4">
        <asp:Label ID="lblName" runat="server" Text="Name" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <asp:TextBox ID="tbxName"  class="form-control" runat="server" placeholder="Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredName" display="Dynamic" runat="server" ControlToValidate="tbxName" ErrorMessage="Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
    <p>
        <asp:Label ID="lblEmail" runat="server" Text="Email" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <asp:TextBox ID="tbxEmail" class="form-control"  runat="server" placeholder="Enter Email"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredEmail" display="Dynamic" runat="server" ControlToValidate="tbxEmail" ErrorMessage="Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p><asp:Label ID="lblQuery" runat="server" Text="Write your Query" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <asp:TextBox ID="tbxQuery" class="form-control"  runat="server" TextMode="MultiLine"></asp:TextBox>
    
                <asp:RequiredFieldValidator ID="RequiredQuery" display="Dynamic" runat="server" ControlToValidate="tbxQuery" ErrorMessage="Enter Query" ForeColor="Red"></asp:RequiredFieldValidator>
    </p>
                <p>
        <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" Text="SUBMIT" OnClick="btnSubmit_click" />
               </p> </div>
    </div>
    </form>
</body>
</html>

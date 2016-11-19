<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Skills.aspx.cs" Inherits="SearchSkills" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SKILLS</title>
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
        .auto-style4 {
            width: 100px;
        }
        .auto-style5 {
            height: 50px;
        }
        .auto-style6 {
            width: 100px;
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
                                      
                    <li><a href="Profile.aspx" class="[ animate ]">PROFILE</a></li>
                    <li><a href="Commenting.aspx" class="[ animate ]">POSTS</a></li>
                    <li><a href="AddSkills.aspx" class="[ animate ]">ADD SKILLS</a></li>
                   <%-- <li><a href="Skills.aspx" class="[ animate ]">SEARCH SKILLS</a></li>--%>
                    <li><a href="Requests.aspx" class="[ animate ]">REQUESTS</a></li> 
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


                    <li><a class="animate" href="Logout.aspx">LOGOUT</a></li>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <div id="container">
            <div>&nbsp</div>
        <div>&nbsp</div><div>&nbsp</div>
        <div>&nbsp</div>
            <div class="col-sm-4">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <%--<asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>--%>

            <br />

            <asp:Label ID="lblSearchGener" runat="server" Text="Select Genre" Font-Bold="true" Font-Size="Medium"></asp:Label>
           <asp:DropDownList ID="ddlGenre"  class="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="tbxEnterGener_TextChanged">
            </asp:DropDownList>
                 <%--<asp:TextBox ID="tbxEnterGener" class="form-control"  runat="server" AutoPostBack="True" OnTextChanged="tbxEnterGener_TextChanged"></asp:TextBox>--%>
            <%--<ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="tbxEnterGener" MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="5" CompletionInterval="10" ServiceMethod="Get_Genre">--%>
            <%--</ajaxToolkit:AutoCompleteExtender>--%>
            <br />
                <asp:Label ID="lblSelectSkills" runat="server" Text="Select Skill" Font-Bold="true" Font-Size="Medium"></asp:Label>
            <asp:DropDownList ID="ddlSkills"  class="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SearchProvider">
            </asp:DropDownList>
            </div>
            <div>&nbsp</div>
            <div class="table-condensed">
            <table class="table">
                <tr>
                    <th class="auto-style4" >
                    Name
                    </th>
                    <th class="auto-style4">Provider
                    </th>
                    <th class="auto-style4">Ratings
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
            <asp:Label ID="lblInfo" runat="server" ></asp:Label>
        </div>
    </form>
</body>
</html>

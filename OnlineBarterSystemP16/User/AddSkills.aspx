<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddSkills.aspx.cs" Inherits="AddSkills" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <title>ADD SKILLS</title>
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
    <%--<link href="../css/stylehome.css" rel="stylesheet" type="text/css" />
    <link href="../css/nav_footer.css" rel="stylesheet" type="text/css" />--%>
    <script runat="server">
        protected void ServerButton_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "key", "btnAddGenre_click();", true);
        }
    </script>
    <script>
        $(document).ready(function () {
            // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
            $('.modal').modal();
        });
    </script>
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
            width: 100px;
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
    <form id="form1" runat="server">
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div>&nbsp</div>

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div id="container">
            <div class="row">
                <div class="col m3 s3">
                </div>
                <div class="col m6 s6">
                    <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
                    <asp:Label ID="lblSelectGenre" runat="server" Text="Genre Name" Font-Bold="true" Font-Size="Medium"></asp:Label>
                    <asp:DropDownList ID="ddlGenre"  CssClass="browser-default" runat="server" AutoPostBack="true" Visible="true" OnSelectedIndexChanged="ddlGenre_SelectedIndexChange"></asp:DropDownList>
                    <p>
                        <asp:Button ID="Button1" class="waves-effect waves-light btn" runat="server" Text="Other" data-toggle="modal" data-target="myModal" />
                    </p>
                    <asp:Label ID="lblGenreAdded" runat="server" Text="New Genre Added" ForeColor="Red" Visible="false"></asp:Label>
                    <%--<ajaxToolkit:ModalPopupExtender ID="MpeAddGenre" runat="server" PopupControlID="PnlAddGenre" TargetControlID="lnkDummy" CancelControlID="btnDone">
            </ajaxToolkit:ModalPopupExtender>
            
            <asp:Panel ID="PnlAddGenre" runat="server" align="center" style = "display:none">
                <iframe src="AddGenre.aspx" runat="server"></iframe>
                <asp:Button ID="btnDone" runat="server" OnClick="Refresh" Text="Done" />
            </asp:Panel>--%>

                    <%--<p>
            <asp:Label ID="lblEnterGenre" runat="server" Text="Enter Name of the Genre"></asp:Label>
            <asp:TextBox ID="tbxGenreName" runat="server" input type="Text"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btnAddGenre" runat="server" Text="Add Genre" OnClick="btnAddGenre_click" />
        </p>--%>
                    <div>
                        <asp:Label ID="lblEnterSkill" runat="server" Text="Enter Your Skill" Font-Bold="true" Font-Size="Medium"></asp:Label>
                        <asp:TextBox ID="tbxEnterSkill" class="form-control" placeholder="Enter Skill..." runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredSkill" runat="server" ControlToValidate="tbxEnterSkill" Display="Dynamic" ErrorMessage="Enter Skill Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="tbxEnterSkill" MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="5" CompletionInterval="10" ServiceMethod="Get_Skills">
                        </ajaxToolkit:AutoCompleteExtender>
                    </div>
                    <asp:Label ID="lblSkillDetails" runat="server" Text="Details of Skill" Font-Bold="true" Font-Size="Medium"></asp:Label>
                    <asp:TextBox ID="tbxSkillDetails" class="form-control" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDetail" runat="server" ControlToValidate="tbxSkillDetails" Display="Dynamic" ErrorMessage="Enter Details" ForeColor="Red"></asp:RequiredFieldValidator>
                    <p>
                        <asp:Button ID="btnAddSkill" class="waves-effect waves-light btn" runat="server" Text="Add Skill" OnClick="btnAddSkill_click" />
                    </p>
                </div>
                <div class="col m3 s3"></div>
            </div>


            <%--<asp:Button ID="btnComment"  class="btn btn-primary"  runat="server" Text="Comment" OnClick="Comment" />--%>

            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add Genre</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblEnterGenre" runat="server" Text="Enter Name of the Genre"></asp:Label>
                            <asp:TextBox ID="tbxGenreName" class="form-control" runat="server" type="Text"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredGenre" runat="server" ControlToValidate="tbxGenreName" ErrorMessage="Enter name of genre" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        </div>
                        <div class="modal-footer">
                            <asp:Button runat="server" class="btn btn-default" OnClientClick="ServerButton_Click" OnClick="btnAddGenre_click" Text="Add"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="logOutModal" role="dialog">
                <div class="modal-dialog">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Are you Sure</h4>
                        </div>
                        <%--<div class="modal-body">
          <asp:Label ID="Label1" runat="server" Text="Enter Name of the Genre"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"  type="Text"></asp:TextBox>
        </div>--%>
                        <div class="modal-footer">
                            <asp:Button runat="server" class="btn btn-default" Text="No"></asp:Button>
                            <asp:Button runat="server" class="btn btn-default" OnClick="btnLogout_Click" Text="Yes"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div><br /><br /></div>
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
</body>
</html>

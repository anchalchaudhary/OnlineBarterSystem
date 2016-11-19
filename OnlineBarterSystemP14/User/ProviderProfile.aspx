<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProviderProfile.aspx.cs" Inherits="ProviderProfile" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PROVIDER</title>
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
        .auto-style3 {
            width: 100px;
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
                    <li><a href="Skills.aspx" class="[ animate ]">SEARCH SKILLS</a></li>
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
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div>&nbsp</div>
        
                                <div style="height:230px;width:230px;">
                                <asp:Image ID="imgProfile" runat="server" style="height:100%;width:100%;max-height:100%;max-width:100%;"/>
                                    </div>
        <div>
            <asp:Repeater ID="RepeaterProfile" OnItemCommand="RepeaterProfile_ItemCommand" runat="server">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                            </td>
                            <th>&nbsp&nbsp</th>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' Font-Bold="true" Font-Size="X-Large"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>' Font-Bold="true" Font-Size="Large"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPhone" runat="server" Text='<%#Eval("Phone") %>' Font-Bold="true" Font-Size="Large"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCity" runat="server" Text='<%#Eval("City") %>' Font-Bold="true" Font-Size="Large"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
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
            <table class="table table-condensed" style="margin-bottom: 10px">
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
                                <asp:LinkButton ID="lblSkill" runat="server" Text='<%#Eval("SkillName") %>'></asp:LinkButton>
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
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            <p style="color: rebeccapurple">
                TO Apply for a Need click on the respective skill
            </p>
            <p>
                <asp:Label ID="lblInfo" runat="server" ForeColor="#CC00CC"></asp:Label>

            </p>
        </div>
    </form>
</body>
</html>

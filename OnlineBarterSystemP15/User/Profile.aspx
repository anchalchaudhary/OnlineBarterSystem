<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="User_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PROFILE</title>
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
            width: 100px;
        }

        .auto-style3 {
            width: 100px;
            height: 50px;
        }

        .auto-style5 {
            margin-right: 18px;
        }
        .wallpaper{
            background-image:url("../image/wallpaper.jpg");
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
                        <img src="../image/nav_logo.png" class="img-responsive" alt="Responsive image" /></a>
                </div>
            </div>





            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="[ collapse navbar-collapse ]" id="bs-example-navbar-collapse-1">
                <ul class="[ nav navbar-nav navbar-right ]">
                    <li class="[ visible-xs ]">
                        <form role="search">
                            <div class="[ input-group ]">
                                <input type="text" runat="server" class="[ form-control ]" name="q" placeholder="Search for snippets" />
                                <span class="[ input-group-btn ]">
                                    <button class="[ btn btn-primary ]" type="submit"><span class="[ glyphicon glyphicon-search ]"></span></button>
                                    <button class="[ btn btn-danger ]" type="reset"><span class="[ glyphicon glyphicon-remove ]"></span></button>
                                </span>
                            </div>
                        </form>
                    </li>

                    <li><a href="Commenting.aspx" class="[ animate ]">POSTS</a></li>
                    <li><a href="AddSkills.aspx" class="[ animate ]">ADD SKILLS</a></li>
                    <li><a href="Skills.aspx" class="[ animate ]">SEARCH SKILLS</a></li>
                    <li><a href="Requests.aspx" class="[ animate ]">REQUESTS</a></li>
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


                    <li><a class="animate" href="Logout.aspx">LOGOUT</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div>
            <div class="container">
                <div class="wallpaper">
                <%--<asp:Image ID="imgWallpaper" runat="server" ImageUrl="../image/wallpaper.jpg" Style="width: 100%; position:relative; height: 236px;"/>--%>
                <asp:Image ID="imgProfile" class="img-circle" runat="server" Style="width: 30%; height: 236px; float: right;" />
                </div>
                <div>
                    <asp:Repeater ID="RepeaterDetails" runat="server" OnItemCommand="RepeaterProfile">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td></td>
                                <th>&nbsp&nbsp</th>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="name" runat="server" Text="Name" Font-Bold="true" Font-Size="Large"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label runat="server" Text=" : "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' Visible="true" Font-Size="Large"></asp:Label>
                                                <asp:TextBox ID="tbxName" runat="server" class="form-control" Text='<%#Eval("Name") %>' Visible="false"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" Display="Dynamic" ControlToValidate="tbxName" ErrorMessage="Name is required" ForeColor="red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="email" runat="server" Text="Email" Font-Bold="true" Font-Size="Large"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label runat="server" Text=" : "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>' Visible="true" Font-Size="Large"></asp:Label>
                                                <asp:TextBox ID="tbxEmail" runat="server" class="form-control" Text='<%#Eval("Email") %>' Visible="false"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" Display="Dynamic" ControlToValidate="tbxEmail" ErrorMessage="Email is required" ForeColor="red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="gender" runat="server" Text="Gender" Font-Bold="true" Font-Size="Large"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label runat="server" Text=" : "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblGender" runat="server" Text='<%#Eval("Gender") %>' Visible="true" Font-Size="Large"></asp:Label>
                                                <asp:RadioButton ID="RadioButtonMale" runat="server" Text=" Male" GroupName="Gender" Visible="false" Enabled="false" />
                                                <asp:RadioButton ID="RadioButtonFemale" runat="server" Text=" Female" GroupName="Gender" Visible="false" Enabled="false" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="city" runat="server" Text="City" Font-Bold="true" Font-Size="Large"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label runat="server" Text=" : "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblCity" runat="server" Text='<%#Eval("City") %>' Visible="true" Font-Size="Large"></asp:Label>
                                                <asp:TextBox ID="tbxCity" runat="server" class="form-control" Text='<%#Eval("City") %>' Visible="false"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" Display="Dynamic" ControlToValidate="tbxCity" ErrorMessage="Enter City" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="phone" runat="server" Text="Phone" Font-Bold="true" Font-Size="Large"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label runat="server" Text=" : "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblPhone" runat="server" Text='<%#Eval("Phone") %>' Visible="true" Font-Size="Large"></asp:Label>
                                                <asp:TextBox ID="tbxPhone" class="form-control" runat="server" Text='<%#Eval("Phone") %>' Visible="false"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="dob" runat="server" Text="Date Of Birth" Font-Bold="true" Font-Size="Large"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label runat="server" Text=" : "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblDob" runat="server" Text='<%#Eval("Dob") %>' Visible="true" Font-Size="Large"></asp:Label>
                                                <asp:Label ID="tbxDob" runat="server" Text='<%#Eval("Dob") %>' Visible="false"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" Display="Dynamic" ControlToValidate="tbxPhone" ErrorMessage="Phone is required" ForeColor="red"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server" Display="Dynamic" ControlToValidate="tbxPhone" ValidationExpression="[7-9][0-9]{9}" ErrorMessage="Enter a valid phone number" ForeColor="red"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>

                                            </td>
                                            <td>

                                            </td>
                                            <td>
                                            <asp:Button ID="btnEdit" runat="server" class="btn btn-primary" CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Text="Edit Profile" />
                                            <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary" CommandName="Update" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Text="Update" Visible="false" />
                                        </td>
                                                </tr>
                                        <tr>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <br />
            <br />
            <div class="col-sm-4">
            </div>
            <asp:Label ID="lblYourSkills" runat="server" Text="YOUR SKILLS : " Font-Bold="true" ForeColor="Red"></asp:Label>
            <table class="table table-condensed" style="margin-right: 0px">
                <tr>
                    <th class="auto-style2">Skill
                    </th>
                    <th class="auto-style2">Ratings
                    </th>
                </tr>
                <asp:Repeater ID="RepeaterSkills" runat="server" OnItemCommand="FillSkills">
                    <ItemTemplate>

                        <tr>
                            <td>
                                <asp:Label ID="lblSkillName" runat="server" Text='<%#Eval("SkillName") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblRating" runat="server" Text='<%#Eval("Rating") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Text="Delete"></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            <asp:Label ID="lblInfo1" runat="server" ForeColor="#CC0000"></asp:Label>
            <asp:Button ID="btnAddSkill" runat="server" Text="Add Skill" OnClick="btnAddSkill_Click" Visible="false" />
            
            <br />
            <br />
            <div class="col-sm-4">
            </div>
            <asp:Label ID="Label1" runat="server" Text="SKILLS YOU'VE REQUESTED : " Font-Bold="true" ForeColor="Red"></asp:Label>
            <div class="table table-condensed">
                <table class="auto-style5">
                    <tr>
                        <th class="auto-style2">Skill
                        </th>
                        <th class="auto-style2">Provider
                        </th>
                    </tr>
                    <asp:Repeater ID="RepeaterRequested" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblRequestName" runat="server" Text='<%#Eval("SkillName") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblRequestFrom" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
            <asp:Label ID="lblInfo2" runat="server" ForeColor="#CC0000"></asp:Label>

            <asp:Button ID="btnSearchSkill" runat="server" Text="Search Skill" OnClick="btnSearchSkill_Click" Visible="false" />
        </div>

    </form>
</body>
</html>

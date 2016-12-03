<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="User_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <title>PROFILE</title>
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
            color: Highlight !important;
        }

        body {
            display: flex;
            min-height: 100vh;
            flex-direction: column;
        }

        /*#divImg {
            margin-left: 2%;
            float: left;
        }

        #divDetails {
            margin-left: 4%;
            margin-right: 45%;
            float: right;
            background: white;
        }*/
        .row {
            margin-bottom: 0%;
        }

        .auto-style1 {
            width: 200px;
        }

        .auto-style2 {
            width: 305px;
        }

        .auto-style3 {
            width: 120px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
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
                        <li class="active"><a href="Profile.aspx" style="font-size: medium">PROFILE</a></li>
                        <%--<li class="tab"><a href="AddSkills.aspx" >ADD SKILLS</a></li>--%>
                        <li><a href="Skills.aspx" style="font-size: medium">SEARCH SKILLS</a></li>
                        <%--<li><a href="AddSkills.aspx" style="font-size: medium">ADD SKILLS</a></li>--%>
                        <li><a href="Requests.aspx" style="font-size: medium">REQUESTS</a></li>
                    </ul>
                </div>
            </nav>
            <!--DETAILS-->
            <div>&nbsp</div>
            <div class="row">
                <div class="col m3 s3">
                    <asp:Image ID="imgProfile" class="circle responsive-img" runat="server" Style="height: 100%; width: 100%; margin-top: 2%" />
                </div>
                <%--<section>
                    <div id="divImg">
                        <asp:Image ID="imgProfile" class="circle responsive-img" runat="server" Style="margin-top: 2%" />
                    </div>--%>
                <%--<div id="divDetails">--%>
                <div class="col m6 s6">
                    <asp:Repeater ID="RepeaterDetails" runat="server" OnItemCommand="RepeaterProfile">
                        <ItemTemplate>
                            <table>
                                <td>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <%--<asp:Label ID="name" runat="server" Text="Name" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                                                <%--<asp:Label runat="server" Text=" : "></asp:Label>--%>
                                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' Display="Dynamic" Visible="true" Font-Bold="true" Font-Size="Large"></asp:Label>
                                                <asp:TextBox ID="tbxName" runat="server" class="form-control" Display="Dynamic" Text='<%#Eval("Name") %>' placeholder="Enter Name here..." Font-Italic="true" Visible="false"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" Display="Dynamic" ControlToValidate="tbxName" ErrorMessage="Name is required" ForeColor="red"></asp:RequiredFieldValidator>
                                                <div>
                                                    <%--<asp:Label ID="email" runat="server" Text="Email" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                                                    <%--<asp:Label runat="server" Text=" : "></asp:Label>--%>
                                                    <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>' Visible="true" Display="Dynamic" Font-Size="Large"></asp:Label>
                                                    <asp:TextBox ID="tbxEmail" runat="server" Display="Dynamic" placeholder="Enter Email here..." Font-Italic="true" class="form-control" Text='<%#Eval("Email") %>' Visible="false"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" Display="Dynamic" ControlToValidate="tbxEmail" ErrorMessage="Email is required" ForeColor="red"></asp:RequiredFieldValidator>
                                                </div>
                                                <div>
                                                    <%--<asp:Label ID="gender" runat="server" Text="Gender" Font-Bold="true" Display="Dynamic" Font-Size="Large"></asp:Label>--%>
                                                    <%--<asp:Label runat="server" Text=" : "></asp:Label>--%>
                                                    <asp:Label ID="lblGender" runat="server" Text='<%#Eval("Gender") %>' Visible="true" Font-Size="Large"></asp:Label>
                                                    <asp:RadioButton ID="RadioButtonMale" runat="server" Display="Dynamic" Text=" Male" GroupName="Gender" Visible="false" Enabled="false" />
                                                    <asp:RadioButton ID="RadioButtonFemale" runat="server" Display="Dynamic" Text=" Female" GroupName="Gender" Visible="false" Enabled="false" />
                                                </div>
                                                <div>
                                                    <%--<asp:Label ID="city" runat="server" Text="City" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                                                    <%--<asp:Label runat="server" Text=" : "></asp:Label>--%>
                                                    <asp:Label ID="lblCity" runat="server" Text='<%#Eval("City") %>' Visible="true" Display="Dynamic" Font-Size="Large"></asp:Label>
                                                    <asp:TextBox ID="tbxCity" runat="server" class="form-control" placeholder="Enter City here..." Font-Italic="true" Display="Dynamic" Text='<%#Eval("City") %>' Visible="false"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" Display="Dynamic" ControlToValidate="tbxCity" ErrorMessage="Enter City" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                                <div>
                                                    <%--<asp:Label ID="phone" runat="server" Text="Phone" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                                                    <%--<asp:Label runat="server" Text=" : "></asp:Label>--%>
                                                    <asp:Label ID="lblPhone" runat="server" Text='<%#Eval("Phone") %>' Visible="true" Font-Size="Large"></asp:Label>
                                                    <asp:TextBox ID="tbxPhone" class="form-control" runat="server" placeholder="Enter Phone Number here..." Font-Italic="true" Display="Dynamic" Text='<%#Eval("Phone") %>' Visible="false"></asp:TextBox>
                                                </div>
                                                <div>
                                                    <asp:Label ID="dob" runat="server" Text="Date Of Birth" Font-Size="Large"></asp:Label>
                                                    <asp:Label runat="server" Text=" : "></asp:Label>
                                                    <asp:Label ID="lblDob" runat="server" Text='<%#Eval("Dob") %>' Visible="true" Font-Size="Large"></asp:Label>
                                                    <asp:Label ID="tbxDob" runat="server" Text='<%#Eval("Dob") %>' Display="dynamic" Visible="false"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" Display="Dynamic" ControlToValidate="tbxPhone" ErrorMessage="Phone is required" ForeColor="red"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server" Display="Dynamic" ControlToValidate="tbxPhone" ValidationExpression="[7-9][0-9]{9}" ErrorMessage="Enter a valid phone number" ForeColor="red"></asp:RegularExpressionValidator>
                                                </div>
                                                <div>
                                                    <asp:Button ID="btnEdit" runat="server" class="waves-effect waves-light btn" CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Text="Edit Profile" />
                                                    <asp:Button ID="btnUpdate" runat="server" class="waves-effect waves-light btn" CommandName="Update" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Text="Update" Visible="false" />
                                            </td>
                                        </tr>
                                    </tbody>
                            </table>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="col m3 s3">
                    <asp:Button ID="btnPost" class="waves-effect waves-light btn" runat="server" OnClick="btnPost_Click" Text="POST" />
                </div>
                <%--</section>--%>
            </div>
            <br />
            <div class="row">
                <div class="col m2 s2"></div>
                <div class="col m8 s8">
                    <asp:Label ID="lblYourSkills" runat="server" Text="YOUR SKILLS : " Font-Bold="true" ForeColor="Red"></asp:Label>
                    <table class="table table-condensed" style="margin-right: 0px">
                        <tr>
                            <th class="auto-style2">Skill
                            </th>
                            <th class="auto-style2">Details
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
                                        <asp:Label ID="lblDetails" runat="server" Text='<%#Eval("SkillDetails") %>'></asp:Label>
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
                    <asp:Button ID="btnAddSkill" runat="server" class="waves-effect waves-light btn" Text="Add More Skills" OnClick="btnAddSkill_Click" Visible="false" />
                </div>
                <%--<div class="col m2 s2"></div>
            </div>
            <div class="col-sm-4">
                
            </div>--%>

                <div class="row">
                    <br />
                </div>
                <div class="row">
                    <br />
                </div>
                <div class="row">
                    <div class="col m2 s2"></div>
                    <div class="col m8 s8">
                        <asp:Label ID="Label1" runat="server" Text="SKILLS YOU'VE REQUESTED : " Font-Bold="true" ForeColor="Red"></asp:Label>

                        <div class="table table-condensed">
                            <table class="auto-style5">
                                <tr>
                                    <th class="auto-style1">Skill
                                    </th>
                                    <th class="auto-style1">Provider
                                    </th>
                                </tr>
                                <asp:Repeater ID="RepeaterRequested" runat="server" OnItemCommand="RepeaterRequested_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblRequestName" runat="server" Text='<%#Eval("SkillName") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblRequestFrom" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnReview" runat="server" CommandName="Review" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Text="Review"></asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbxReview" class="form-control" runat="server" TextMode="MultiLine" Visible="false"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnPost" runat="server" CommandName="Post" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Text="Post" Visible="false" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                        <asp:Label ID="lblInfo2" runat="server" ForeColor="#CC0000"></asp:Label>

                        <asp:Button ID="btnSearchSkill" class="waves-effect waves-light btn" runat="server" Text="Search Skill" OnClick="btnSearchSkill_Click" Visible="false" />

                    </div>
                    <div class="col m2 s2"></div>
                </div>
                <div class="row">
                    <br />
                </div>
                <div class="row">
                    <br />
                </div>
                <div class="row">
                    <div class="col m2 s2"></div>
                    <div class="col m8 s8">
                        <asp:Label ID="Label2" runat="server" Text="FOLLOWERS : " Font-Bold="true" ForeColor="Red"></asp:Label>
                        <div class="table table-condensed">
                            <table class="auto-style5">
                                <tr>
                                    <th class="auto-style3">Follower
                                    </th>
                                    <th class="auto-style2">Skill
                                    </th>
                                </tr>
                                <asp:Repeater ID="RepeaterRequesters" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblApplier" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblApplierAskedSkill" runat="server" Text='<%#Eval("SkillName") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                            <asp:Label ID="lblInfo3" runat="server" ForeColor="#CC0000"></asp:Label>
                        </div>
                    </div>
                    <div class="col m2 s2"></div>
                </div>
                <footer class="page-footer  grey darken-4" style="margin-bottom: 0%">
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

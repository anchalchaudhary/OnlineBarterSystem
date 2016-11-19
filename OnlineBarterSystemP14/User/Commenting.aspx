<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Commenting.aspx.cs" Inherits="Commenting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>POST</title>
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

                    <li><a href="Profile.aspx" class="[ animate ]">PROFILE</a></li>
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
            </div>
        </div>
    </nav>
    <div>&nbsp</div>
    <div>&nbsp</div>
    <div>&nbsp</div>
    <div>&nbsp</div>

        <asp:Label ID="lblPost" runat="server" Text="What do you know and what do you want to learn...?" Font-Italic="true" Font-Bold="true" Font-Size="Small"></asp:Label>
    <form id="form1" runat="server">
        <div class="col-sm-4">
            <asp:TextBox ID="tbxComment" class="form-control" TextMode="multiline" Columns="50" Rows="5" runat="server" placeholder="Write here..."></asp:TextBox>
            <br />
            <asp:Button ID="btnComment" class="btn btn-primary" runat="server" OnClick="Comment_Click" Text="Post" ValidateRequestMode="Disabled" />
            </div>
            <br />
            <br />
            <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="col-sm-12">
            <asp:Repeater ID="RepeaterComment" runat="server" OnItemCommand="RepeaterReply" OnItemDataBound="BoundReply">
                <ItemTemplate>
                    <br />
                    <table>
                        <th>&nbsp</th>
                        <tr>

                            <td>
                                <asp:Label ID="lblCommentId" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblSender" runat="server" Text='<%#Eval("Name") %>' Font-Bold="true" Font-Size="Medium"></asp:Label>
                            </td>
                            <th>&nbsp&nbsp</th>
                            <td>
                                <asp:Label ID="ldlSemiColon" runat="server" Text=" : " Font-Bold="true" Font-Size="Medium"></asp:Label>
                            </td>
                            <th>&nbsp&nbsp</th>
                            <td>
                                <asp:Label ID="lblComment" runat="server" Text='<%#Eval("Comment") %>' Font-Size="Large"></asp:Label>
                            </td>
                            <th>&nbsp&nbsp</th>
                            <td>
                                <asp:LinkButton ID="btnReply" runat="server" class="glyphicon glyphicon-comment" CommandName="reply" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' />
                                <asp:LinkButton ID="btnPost" runat="server" class="glyphicon glyphicon-pushpin" CommandName="post" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Visible="false" />
                            </td>
                            <th>&nbsp&nbsp</th>
                            <td>
                                <asp:ImageButton ID="btnLike" class="glyphicon glyphicon-thumbs-up" runat="server" CommandName="like" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>'></asp:ImageButton>
                                <asp:ImageButton ID="btnUnLike" class="glyphicon glyphicon-thumbs-down" runat="server" Visible="false" CommandName="Unlike" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>'></asp:ImageButton>
                            </td>
                        </tr>
                        <asp:Repeater ID="RepeaterReply" runat="server">
                            <ItemTemplate>
                                <table style="margin-left: 30px">
                                    <tr>
                                        <th>&nbsp&nbsp</th>
                                        <td>
                                            <asp:Label ID="lblContinue" runat="server" ></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblSender" runat="server" Text='<%#Eval("Name") %>' Font-Bold="true" Font-Size="Medium"></asp:Label>
                                        </td>
                                        <th>&nbsp&nbsp</th>
                                        <td>
                                            <asp:Label ID="lblSemiColon" runat="server" Text=" : " Font-Bold="true"></asp:Label>
                                        </td>
                                        <th>&nbsp&nbsp</th>
                                        <td>
                                            <asp:Label ID="lblReply" runat="server" Text='<%#Eval("Reply") %>' Font-Size="Medium"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:Repeater>
                        
                <asp:HiddenField ID="hfCustomerId" runat="server" Value='<%# Eval("Id") %>' />
                        <tr>
                            <asp:TextBox ID="tbxReply" class="form-control" runat="server" Visible="false"></asp:TextBox>
                        </tr>
                    </table>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            </div>
    </form>
    <script>
        //function Reply()
        //{
        //    tbxReply.Visible = true;
        //}
    </script>
</body>
</html>


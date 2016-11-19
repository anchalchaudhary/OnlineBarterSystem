<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddSkills.aspx.cs" Inherits="AddSkills" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ADD YOUR SKILLS</title><meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/f299e4c7c4.js"></script>
    <link href="../css/stylehome.css" rel="stylesheet" type="text/css" />
    <link href="../css/nav_footer.css" rel="stylesheet" type="text/css" />
    <script runat="server">
 protected void ServerButton_Click(object sender, EventArgs e)
 {
 ClientScript.RegisterStartupScript(this.GetType(), "key", "btnAddGenre_click();", true);
 }
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
                    <li><a href="Commenting.aspx" class="[ animate ]">POSTS</a></li>
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
    <form id="form1" runat="server">
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div>&nbsp</div>
        <div>&nbsp</div>
        
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="container">
        <div class="col-sm-4">

        </div>
        <div class="col-sm-4">
        <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
            <asp:Label ID="lblSelectGenre" runat="server" Text="Genre Name" Font-Bold="true" Font-Size="Medium"></asp:Label>
            <asp:DropDownList ID="ddlGenre" class="form-control"  runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlGenre_SelectedIndexChange"></asp:DropDownList>
            <p>
            <asp:Button ID="Button1"  class="btn btn-primary"  runat="server" Text="Other" data-toggle="modal" data-target="#myModal"/>
            </p>
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
            <asp:Label ID="lblEnterSkill" runat="server" Text="Enter Your Skill"  Font-Bold="true" Font-Size="Medium"></asp:Label>
            <asp:TextBox ID="tbxEnterSkill"  class="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredSkill" runat="server" ControlToValidate="tbxEnterSkill" ErrorMessage="Enter Skill Name" ForeColor="Red"></asp:RequiredFieldValidator>
            <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="tbxEnterSkill" MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="5" CompletionInterval="10" ServiceMethod="Get_Skills" >
            </ajaxToolkit:AutoCompleteExtender>
        </div>
            <asp:Label ID="lblSkillDetails"  runat="server" Text="Details of Skill" Font-Bold="true" Font-Size="Medium"></asp:Label>
            <asp:TextBox id="tbxSkillDetails" class="form-control"  runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDetail" runat="server" ControlToValidate="tbxSkillDetails" Display="Dynamic" ErrorMessage="Enter Details" ForeColor="Red"></asp:RequiredFieldValidator>
            <p><asp:Button ID="btnAddSkill" class="btn btn-primary"  runat="server" Text="Add Skill" OnClick="btnAddSkill_click" /></p>
        
        
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
            <asp:TextBox ID="tbxGenreName" class="form-control" runat="server"  type="Text"></asp:TextBox>
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
            <asp:Button runat="server" class="btn btn-default"  OnClick="btnLogout_Click" Text="Yes"></asp:Button>
        </div>
      </div>
      
    </div>
  </div>
  

        </div>
    </div>
    </form>
</body>
</html>
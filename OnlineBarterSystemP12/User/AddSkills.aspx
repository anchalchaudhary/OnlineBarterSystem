<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddSkills.aspx.cs" Inherits="AddSkills" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ADD YOUR SKILLS</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">VERBENDEN</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="Profile.aspx"><span class="glyphicon glyphicon-eye-open"></span>View Profile</a></li>
      <li><a href="Requests.aspx"><span class="glyphicon glyphicon-bookmark"></span>Notification</a></li>
      <li><a href="Skills.aspx"><span class="glyphicon glyphicon-search"></span>Search Skill</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Home.aspx"><span class="glyphicon glyphicon-pencil"></span>Query Us</a></li>
      <li><a href="Logout.aspx"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
    </ul>
  </div>
</nav>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="container">
        <div class="col-sm-4">

        </div>
        <div class="col-sm-4">
        <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
            <asp:Label ID="lblSelectGenre" runat="server" Text="Genre Name"></asp:Label>
            <asp:DropDownList ID="ddlGenre" class="form-control"  runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlGenre_SelectedIndexChange"></asp:DropDownList>
            <asp:Button id="btnRefresh" runat="server" Text="Refresh" Visible="false" Onclick="Refresh" />
        
            <asp:Button ID="Button1"  class="btn btn-primary"  runat="server" Text="Other" data-toggle="modal" data-target="#myModal"/>

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
        
            <asp:Label ID="lblEnterSkill" runat="server" Text="Enter Your Skill"></asp:Label>
            <asp:TextBox ID="tbxEnterSkill"  class="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredSkill" runat="server" ControlToValidate="tbxEnterSkill" ErrorMessage="Enter Skill Name" ForeColor="Red"></asp:RequiredFieldValidator>
            <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="tbxEnterSkill" MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="5" CompletionInterval="10" ServiceMethod="Get_Skills" >
            </ajaxToolkit:AutoCompleteExtender>

            <asp:Label ID="lblSkillDetails"  runat="server" Text="Details of Skill"></asp:Label>
            <asp:TextBox id="tbxSkillDetails" class="form-control"  runat="server"></asp:TextBox>
        
            <asp:Button ID="btnAddSkill" class="btn btn-primary"  runat="server" Text="Add Skill" OnClick="btnAddSkill_click" />
        
        
            <asp:Button ID="btnComment"  class="btn btn-primary"  runat="server" Text="Comment" OnClick="Comment" />

            <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add Genre</h4>
        </div>
        <div class="modal-body">
          <asp:Label ID="lblEnterGenre" runat="server" Text="Enter Name of the Genre"></asp:Label>
            <asp:TextBox ID="tbxGenreName" runat="server"  type="Text"></asp:TextBox>
        </div>
        <div class="modal-footer">
          <asp:Button runat="server" class="btn btn-default" data-dismiss="modal" OnClick="btnAddGenre_click" Text="Add"></asp:Button>
        </div>
      </div>
      
    </div>
  </div>
  

        </div>
    </div>
    </form>
</body>
</html>
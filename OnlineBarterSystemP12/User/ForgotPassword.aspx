<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="User_ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FORGOT PASSWORD</title>
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
      <a class="navbar-brand" href="#">VERBINDEN</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="#">Home</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Home.aspx"><span class="glyphicon glyphicon-pencil"></span>Query Us</a></li>
      <li><a href="Logout.aspx"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
        <li><a href="Logout.aspx"><span class="glyphicon glyphicon-signup"></span>Sign Up</a></li>
    </ul>
  </div>
</nav>
    <form id="form1" runat="server">
        <div id="container">
            <div class="col-sm-4">
                <p></p>
                <p><asp:Label ID="lblEmail" runat="server" Text="Email"  Font-Bold="true"></asp:Label></p>
            <p>
                <asp:TextBox ID="tbxEmail" runat="server" class="form-control" placeholder="Enter Email"></asp:TextBox>
                </p>
            <p><asp:Button ID="btnSubmit" runat="server" class="btn btn-primary btn-block" Text="Get Link to Change Password" OnClick="SendMail" /></p>
                </div>
        </div>
    </form>
</body>
</html>

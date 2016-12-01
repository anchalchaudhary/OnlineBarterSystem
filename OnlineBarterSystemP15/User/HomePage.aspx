<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HOME</title>
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
      <li><a href="AddSkills.aspx"><span class="glyphicon glyphicon-plus"></span>Add Skill</a></li>
      <li><a href="Commenting.aspx"><span class="glyphicon glyphicon-plus"></span>Post</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Query.aspx"><span class="glyphicon glyphicon-pencil"></span>Query Us</a></li>
      <li><a href="Logout.aspx"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
    </ul>
  </div>
</nav>
    <form id="form1" runat="server">
    <div>
    
    
    </div>
    </form>
</body>
</html>

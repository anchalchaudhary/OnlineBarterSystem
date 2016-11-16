<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <div class="jumbotron text-center">
                <h1>
                    Log in
                </h1>
            </div>
            <div class="col-sm-4">

            </div>
            <div class="col-sm-4" >
        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="tbxEmail" class="form-control" input type="email" placeholder="Enter Email" runat="server"></asp:TextBox>
        <asp:Label ID="lblIncorrectEmail" runat="server" Text="Email not registered" ForeColor="Red"></asp:Label>

        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="tbxPassword" class="form-control" input type="password" placeholder="Enter Password" runat="server"></asp:TextBox>
        <asp:Label ID="lblIncorrectPassword" runat="server" Text="Incorrect Password" ForeColor="Red"></asp:Label>

        <div class="forget-password-link" style="float: left;">
            <a href="ForgotPassword.aspx">Forgot Password?</a>
        </div>

        <asp:Button ID="btnLogin"  class="btn btn-primary"  runat="server" Text="Login" OnClick="btnLogin_Click" />

        <div class="not-register-yet-link">
            NOT YET REGISTERED? <a href="#">SIGN UP</a>
        </div>
                </div>
            </div>
    </form>
</body>
</html>

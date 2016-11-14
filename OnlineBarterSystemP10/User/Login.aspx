<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN</title>

</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="tbxEmail" class="form-control" input type="email" placeholder="Enter Email" runat="server"></asp:TextBox>
        <asp:Label ID="lblIncorrectEmail" runat="server" Text="Email not registered" ForeColor="Red"></asp:Label>

        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="tbxPassword" class="form-control" input type="password" placeholder="Enter Password" runat="server"></asp:TextBox>
        <asp:Label ID="lblIncorrectPassword" runat="server" Text="Incorrect Password" ForeColor="Red"></asp:Label>

        <div class="forget-password-link" style="float: left;">
            <a href="#">Forgot Password?</a>
        </div>

        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />

        <div class="not-register-yet-link">
            NOT YET REGISTERED? <a href="#">SIGN UP</a>
        </div>
    </form>
</body>
</html>

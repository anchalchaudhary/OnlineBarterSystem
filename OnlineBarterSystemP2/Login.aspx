<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="tbxEmail" input type="email" runat="server"></asp:TextBox>
            <asp:Label ID="lblIncorrectEmail" runat="server" Text="Email not registered" ForeColor="Red"></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="tbxPassword" input type="password" runat="server"></asp:TextBox>
            <asp:Label ID="lblIncorrectPassword" runat="server"  Text="Incorrect Password" ForeColor="Red"></asp:Label>
        </p>
        <p>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </p>
    </div>
    </form>
</body>
</html>

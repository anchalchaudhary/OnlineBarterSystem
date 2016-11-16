<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="User_ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FORGOT PASSWORD</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            </p>
        <p>
            <asp:TextBox ID="tbxEmail" runat="server" ></asp:TextBox>
        </p>
        <asp:Button ID="btnSubmit" runat="server" Text="Change Password" OnClick="SendMail" />
    </div>
    </form>
</body>
</html>
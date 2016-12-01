<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="User_ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CHANGE PASSWORD</title>
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
                <h1>Change PassWord
                </h1>
            </div>
            <div class="row">

                <div class="col-sm-4">
                </div>

                <div class="col-sm-4">
                    <asp:Label ID="lblPassWord" runat="server" Text="PassWord"></asp:Label>
                    <asp:TextBox ID="tbxPassword" class="form-control" type="password" runat="server" placeholder="Enter Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" Display="Dynamic" ControlToValidate="tbxPassword" ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server" Display="Dynamic" ErrorMessage="Password length must be between 8 to 15. Characters allowed: a-z A-Z 0-9 . #" ControlToValidate="tbxPassword" ValidationExpression="^[a-zA-Z0-9.#\s]{7,15}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:Label ID="Label1" runat="server" Text="Confirm PassWord"></asp:Label>
                    <asp:TextBox ID="tbxConfirmPassword" class="form-control" input type="password" runat="server" placeholder="Re-enter Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" Display="Dynamic" ControlToValidate="tbxConfirmPassword" ErrorMessage="Re-enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ErrorMessage="Passwords do not match" runat="server" Display="Dynamic" ControlToCompare="tbxPassword" ControlToValidate="tbxConfirmPassword" ForeColor="Red"></asp:CompareValidator>
                    <asp:Button ID="btnChange" class="btn btn-primary"  runat="server" Text="Change Password" OnClick="Change" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>

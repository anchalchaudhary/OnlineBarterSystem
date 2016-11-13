<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/f299e4c7c4.js"></script>
    <link href="css/nav_footer.css" rel="stylesheet" type="text/css" />
    <link href="css/sign_up.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-6 col-xs-6">
                                <div class="modal-part-1">
                                    <div class="modal-logo">
                                        <img src="image/modal_logo.png" class="img-responsive" style="width: 30vmin" alt="Responsive image" />
                                    </div>
                                    <div class="modal-text">
                                        <div>
                                            <h3>BARTER SYSTEM</h3>
                                        </div>
                                        <div><span>Share your knowledge</span></div>
                                        <div><span>Connect with people</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xs-6">
                                <div class="modal-part-2">
                                    <div class="modal-part-2-text">
                                        <h2>LOGIN</h2>
                                    </div>
                                    <div class="container">
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <div class="col-sm-3">
                                                    <%--<asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>--%>
                                                    <asp:TextBox ID="tbxEmail" class="form-control" input type="email" placeholder="Enter Email" runat="server"></asp:TextBox>
                                                    <asp:Label ID="lblIncorrectEmail" runat="server" Text="Email not registered" ForeColor="Red"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-3">
                                                    <%--<asp:Label ID="lblPassword" runat="server"  Text="Password"></asp:Label>--%>
                                                    <asp:TextBox ID="tbxPassword" class="form-control" input type="password" placeholder="Enter Password" runat="server"></asp:TextBox>
                                                    <asp:Label ID="lblIncorrectPassword" runat="server" Text="Incorrect Password" ForeColor="Red"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="forget-password-link" style="float: left;">
                                                <a href="#">Forgot Password?</a>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-3">
                                                    <div class="modal-btn">
                                                        <asp:Button ID="btnLogin" runat="server" class="btn btn-primary btn-block" Style="width: 85%; background-color: #1fbad6;" Text="Login" OnClick="btnLogin_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="not-register-yet-link">
                                                NOT YET REGISTERED? <a href="http://www.w3schools.com/html/">SIGN UP</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</body>
</html>

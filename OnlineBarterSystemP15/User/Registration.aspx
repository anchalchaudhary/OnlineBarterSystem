<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SIGN UP</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/f299e4c7c4.js"></script>
    <link href="../css/nav_footer.css" rel="stylesheet" type="text/css" />
    <link href="../css/sign_up.css" rel="stylesheet" type="text/css" />
</head>
<body <%--onload="resetForm()"--%>>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12 col-lg-12 col-xs-12">
                    <div class="signup-form">
                        <h2>SIGN UP</h2>
                            <div class="form-group">
                                <asp:Label ID="lblName" runat="server" Text="Name:" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="tbxName" class="form-control" type="text" runat="server" placeholder="Enter Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" Display="Dynamic" ControlToValidate="tbxName" ErrorMessage="Name is required" ForeColor="red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblEmail" runat="server" Text="Email:" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="tbxEmail" class="form-control" type="email" runat="server" placeholder="Enter Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" Display="Dynamic" ControlToValidate="tbxEmail" ErrorMessage="Email is required" ForeColor="red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblPassword" runat="server" Text="Password:" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="tbxPassword" class="form-control" type="password" runat="server" placeholder="Enter Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" Display="Dynamic" ControlToValidate="tbxPassword" ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server" Display="Dynamic" ErrorMessage="Password length must be between 8 to 15. Characters allowed: a-z A-Z 0-9 . #" ControlToValidate="tbxPassword" ValidationExpression="^[a-zA-Z0-9.#\s]{7,15}$" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="tbxConfirmPassword" class="form-control" type="password" runat="server" placeholder="Re-enter Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" Display="Dynamic" ControlToValidate="tbxConfirmPassword" ErrorMessage="Re-enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ErrorMessage="Passwords do not match" runat="server" Display="Dynamic" ControlToCompare="tbxPassword" ControlToValidate="tbxConfirmPassword" ForeColor="Red"></asp:CompareValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblGender" runat="server" Text="Gender:" Font-Bold="True" autocomplete="off"></asp:Label>
                                <asp:RadioButton ID="RadioButtonMale" GroupName="Radio" runat="server" Text=" Male" />
                                <asp:RadioButton ID="RadioButtonFemale" GroupName="Radio" runat="server" Text=" Female" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblCity" runat="server" Text="City" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="tbxCity" class="form-control" type="text" runat="server" placeholder="Enter City"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" Display="Dynamic" ControlToValidate="tbxCity" ErrorMessage="Enter City" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblPhone" runat="server" Text="Phone" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="tbxPhone" class="form-control" type="text" runat="server" placeholder="Enter Phone"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" Display="Dynamic" ControlToValidate="tbxPhone" ErrorMessage="Phone is required" ForeColor="red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server" Display="Dynamic" ControlToValidate="tbxPhone" ValidationExpression="[7-9][0-9]{9}" ErrorMessage="Enter a valid phone number" ForeColor="red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblDob" runat="server" Text="Date Of Birth" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="tbxDob" class="form-control" type="date" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDob" runat="server" Display="Dynamic" ControlToValidate="tbxDob" ErrorMessage="Date of birth is required" ForeColor="red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblProfilePicture" runat="server" Text="Upload your Profile Photo" Font-Bold="True"></asp:Label>
                                <asp:FileUpload ID="FileProfilePicture" runat="server" />
                                <asp:Label ID="lblMessage" runat="server" Text="Add only jpg/jpeg and .png images" ForeColor="Red"></asp:Label>
                                <%-- <asp:Image ID="imgProfilePicture" runat="server" />--%>
                            </div>

                            <div class="signup_btn">
                                <asp:Button ID="btnSignUp" class="btn btn-primary btn-block" runat="server" Text="SIGN UP" Style="background-color: #1fbad6" OnClick="btnSignUp_Click" />
                            </div>
                            <div class="signup_text">
                                Have an account?
                                <asp:LinkButton ID="lnkLogin" class="login" style="display: inline; padding-left: 5px;" runat="server" Text="LOGIN" href="Login.aspx"></asp:LinkButton>
<%--                                <ajaxToolkit:ModalPopupExtender ID="MpeLogin" runat="server" PopupControlID="PnlLogin" TargetControlID="lnkLogin" CancelControlID="lnkDummy">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
                                <asp:Panel ID="PnlLogin" runat="server" align="center" Style="display: none">
                                    <iframe src="Login.aspx" runat="server"></iframe>
                                </asp:Panel>--%>
                                </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <%--<script>
            function resetForm()
            {
                document.getElementById("tbxName").value = "";
                document.getElementById("tbxEmail").value = "";
                document.getElementById("tbxPassword").value = "";
                document.getElementById("tbxConfirmPassword").value = "";
                document.getElementById("tbxPhone").value = "";
                document.getElementById("tbxDob").value = "";
                document.getElementById("tbxCity").value = "";
            }
    </script>--%>
</body>
</html>

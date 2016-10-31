<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SIGN UP</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
            <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="tbxName" input type="text" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" Display="Dynamic"  ControlToValidate="tbxName" ErrorMessage="Name is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="tbxEmail" input type="email" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" Display="Dynamic"  ControlToValidate="tbxEmail" ErrorMessage="Email is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="tbxPassword" input type="password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" Display="Dynamic" ControlToValidate="tbxPassword" ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
            <asp:TextBox ID="tbxConfirmPassword" input type="password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" Display="Dynamic" ControlToValidate="tbxConfirmPassword" ErrorMessage="Re-enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ErrorMessage="Passwords do not match" runat="server" Display="Dynamic" ControlToCompare="tbxPassword" ControlToValidate="tbxConfirmPassword" ForeColor="Red"></asp:CompareValidator>
        </p>
        <p>
            <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
            <asp:RadioButton ID="RadioButtonMale" GroupName="Gender" runat="server" Text="Male" />
            <asp:RadioButton ID="RadioButtonFemale" GroupName="Gender" runat="server" Text="Female" />
        </p>
        <p>
            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
            <asp:TextBox ID="tbxCity" input type="text" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" Display="Dynamic" ControlToValidate="tbxCity" ErrorMessage="Enter City" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
            <asp:TextBox ID="tbxPhone" input type="text" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" controltovalidate="tbxPhone" ErrorMessage="Phone is required" ForeColor="red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server" Display="Dynamic" ControlToValidate="tbxPhone"  ValidationExpression="[0-9]{10}" ErrorMessage="Enter a valid phone number" ForeColor="red"></asp:RegularExpressionValidator>
        </p>
        <p>
            <asp:Label ID="lblDob" runat="server" Text="Date Of Birth"></asp:Label>
            <asp:TextBox ID="tbxDob" input type="date" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDob" runat="server" Display="Dynamic" ControlToValidate="tbxDob" ErrorMessage="Date of birth is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="lblProfilePicture" runat="server" Text="Upload your Profile Photo"></asp:Label>
            <asp:FileUpload ID="FileProfilePicture" runat="server" />
           <%-- <asp:Image ID="imgProfilePicture" runat="server" />--%>
        </p>
        <p>
            <asp:Button ID="btnSignUp" runat="server" Text="SIGN UP" OnClick="btnSignUp_Click" />
        </p>
    </div>
    </form>
</body>
</html>

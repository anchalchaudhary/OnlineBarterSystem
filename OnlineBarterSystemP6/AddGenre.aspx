<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddGenre.aspx.cs" Inherits="AddGenre" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Genre</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
            <asp:Label ID="lblEnterGenre" runat="server" Text="Enter Name of the Genre"></asp:Label>
            <asp:TextBox ID="tbxGenreName" runat="server" input type="Text"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btnAddGenre" runat="server" Text="Add Genre" OnClick="btnAddGenre_click" />
        </p>
    </div>
    </form>
</body>
</html>

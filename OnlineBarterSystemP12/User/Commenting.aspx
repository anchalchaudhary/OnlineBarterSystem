<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Commenting.aspx.cs" Inherits="Commenting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Repeater</title>
    <meta http-equiv="refresh" content="30;url=Commenting.aspx" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="margin-left:10px;">
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="tbxComment" TextMode="multiline" Columns="50" Rows="5" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnComment" runat="server" OnClick="Comment_Click" Text="Comment" ValidateRequestMode="Disabled" />
            <br />
            <br />
            <br />
            <asp:Repeater ID="RepeaterComment" runat="server" OnItemCommand="RepeaterReply">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblCommentId" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblSender" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="ldlSemiColon" runat="server" Text=" : "></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblComment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="btnReply" runat="server" class="glyphicon glyphicon-comment" CommandName="reply" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' />
                                <asp:LinkButton ID="btnPost" runat="server" class="glyphicon glyphicon-pushpin"  CommandName="post" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>' Visible="false"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ImageButton ID="btnLike" class="glyphicon glyphicon-thumbs-up" runat="server" CommandName="like" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>'></asp:ImageButton>
                                <asp:ImageButton ID="btnUnLike" class="glyphicon glyphicon-thumbs-down" runat="server" Visible="false"  CommandName="Unlike" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id")%>'></asp:ImageButton>
                            </td>
                        </tr>
                        <asp:Repeater ID="RepeaterReply" runat="server">
                            <ItemTemplate>
                                <table style="margin-left:30px">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblReply" runat="server" Text='<%#Eval("Reply") %>' ></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr>
                                <asp:TextBox ID="tbxReply" runat="server" Visible="false"></asp:TextBox>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </form>
    <script>
        //function Reply()
        //{
        //    tbxReply.Visible = true;
        //}
    </script>
</body>
</html>


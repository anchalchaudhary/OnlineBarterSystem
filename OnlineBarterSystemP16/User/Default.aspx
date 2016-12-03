<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="tbxName" runat="server" placeholder="Name"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="tbxEmail" runat="server" placeholder="Enter Email"></asp:TextBox>
    </p>
        <asp:Label ID="lblQuery" runat="server" Text="Write your Query"></asp:Label>
        <asp:TextBox ID="tbxQuery" runat="server" TextMode="MultiLine"></asp:TextBox>
    
    
        <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" OnClick="btnSubmit_click" />
    
</asp:Content>


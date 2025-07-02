<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Returns.aspx.cs" Inherits="CarRentMS.Views.Admin.Returns" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>CRMS</title>
    <style>
        .center-text {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="center-text">Return Page</h1>
    <p>&nbsp;</p>
    <div class="text-center">
        <asp:GridView ID="ReturnCar" runat="server"  CellPadding="4" ForeColor="#333333" GridLines="None" Width="962px" HorizontalAlign="Center" OnSelectedIndexChanged="ReturnCar_SelectedIndexChanged" >
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#fdcd3b" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#fdcd3b" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />

        </asp:GridView>
    </div>
</asp:Content>

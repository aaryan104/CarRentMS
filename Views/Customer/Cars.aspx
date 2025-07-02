<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Customer/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="CarRentMS.Views.Customer.WebForm1"  EnableEventValidation="false" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>CRMS</title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        .auto-style2 {
            font-size: xx-large;
        }
        .auto-style3 {
            font-size: large;
            width: 335px;
            height: 170px;
        }
        .auto-style4 {
            flex: 1 0 0%;
            text-align: center;
        }
        .auto-style5 {
            width: 400px;
        }
        .auto-style7 {
            font-size: medium;
        }
        .auto-style8 {
            font-size: x-large;
        }
        .auto-style9 {
            font-size: 1pt;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">       
    <h1>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <span class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp; Car List &nbsp;</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <span class="auto-style7"> Hello,</span>
        <span class="auto-style1"> </span>
            <asp:Label ID="txtName" runat="server" CssClass="auto-style8" Text="CustName" ForeColor="#FDCD3B"></asp:Label>
            <asp:Label ID="id" runat="server" CssClass="auto-style9" Text="I" ForeColor="White"></asp:Label>
     </h1>
    
    <div class="col-md-12">
        <div class="row">
            <div class="auto-style4">
                <img src="../../Assets/img/cu1.png" class="auto-style3" />
            </div>
        </div>
    </div>

    <form>
        <div class="text-center">
            <asp:GridView ID="CarList" runat="server" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="962px" HorizontalAlign="Center" OnSelectedIndexChanged="CarList_SelectedIndexChanged">
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
    
        <br />   

        <div class="column">
            <div class="row justify-content-center">
                <div class="col-md-3">
                    <div>
                        <input ID="ReturnDate" runat="server" type="Date" class="auto-style5" >
                        <br /><br />    
                        <asp:Button ID="btnSubmit" runat="server" Text="Book" class="btn btn-warning btn-block" Height="42px" Width="400px" OnClick="btnSubmit_Click"/>
                    </div>
                    <Label ID="msg" runat="server"></Label>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

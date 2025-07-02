<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="CarRentMS.Views.Admin.Customer" EnableEventValidation="false" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>CRMS</title>
    <style type="text/css">
        .auto-style1 {
            width: 200px;
            height: 185px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="row">
                    <div class="col"></div>
                    <div class="col">
                        <h2 class="text-danger pl-4">&nbsp;&nbsp; Customers</h2>
                        <img src="../../Assets/img/Customer.jpg" class="auto-style1"/>
                    </div>
                    <div class="col"></div>
                </div>
                <div class="row">
                    <div class="col">
                        <form>
                            <div class="form-group">
                                <label for="CustNameTb">Customer Name&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTb" ErrorMessage="*" ForeColor="#FDCD3B"></asp:RequiredFieldValidator>
                                </label>
                                &nbsp;<input type="text" class="form-control" id="NameTb" placeholder="Enter Customer Name" runat="server">
                            </div>
                            <div class="form-group">
                                <label for="AddTb">Customer Address&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="AddTb" ErrorMessage="Invalid Email" ForeColor="#FDCD3B" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </label>
                                &nbsp;<input type="text" class="form-control" id="AddTb" placeholder="Enter Customer Address" runat="server">
                            </div>
                            <div class="form-group">
                                <label for="PhoneTb">Customer Phone&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="PhoneTb" ErrorMessage="Invalid Phone Number" ForeColor="#FDCD3B" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                                </label>
                                &nbsp;<input type="text" class="form-control" id="PhoneTb" placeholder="Enter Phone" runat="server">
                            </div>
                            <div class="form-group">
                                <label for="PasswordTb">Customer Password&nbsp;&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="PasswordTb" ErrorMessage="Invalid Password" ForeColor="#FDCD3B" ValidationExpression="^[A-Za-z]\w{6,14}$"></asp:RegularExpressionValidator>
                                </label>
                                &nbsp;<input type="text" class="form-control" id="PasswordTb" placeholder="Enter Password" runat="server">
                            </div>
                            <br />
                            
                            <label id="msg" runat="server"></label>
                            <asp:Button ID="edit" runat="server" class="btn btn-warning" Text="Edit" Width="110px" OnClick="edit_Click"/>
                            <asp:Button ID="add" runat="server" class="btn btn-danger" BackColor="Green" BorderColor="Green" Text="Add" Width="110px" OnClick="add_Click"/>
                            <asp:Button ID="delete" runat="server" class="btn btn-danger" Text="Delete" Width="110px" OnClick="delete_Click"/>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                 
                <h1> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Car List </h1>
               <asp:GridView ID="CustomerList" runat="server" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="962px" OnSelectedIndexChanged="CustomerList_SelectedIndexChanged">
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
        </div>
    </div>
</asp:Content>

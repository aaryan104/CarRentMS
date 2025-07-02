<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="CarRentMS.Views.Admin.Cars" EnableEventValidation="false" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>CRMS</title>
    <style type="text/css">
    .auto-style1 {
        width: 256px;
        height: 120px;
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
                        <h2 class="text-danger pl-4">&nbsp;&nbsp;&nbsp;&nbsp; Manage Cars</h2>
                        <img src="../../Assets/img/CarManag.png" class="auto-style1" />
                    </div>
                    <div class="col"></div>
                </div>
                <div class="row">
                    <div class="col">
                        <form>
                            <div class="form-group">
                                <label for="LNumberTb">Licence Number&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LNumberTb" ErrorMessage="*" ForeColor="#FDCD3B"></asp:RequiredFieldValidator>
                                </label>
                                &nbsp;<input type="text" class="form-control" id="LNumberTb" placeholder="Enter Plate Number" runat="server">
                            </div>
                            <div class="form-group">
                                <label for="BrandTb">Brand&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="BrandTb" ErrorMessage="*" ForeColor="#FDCD3B"></asp:RequiredFieldValidator>
                                </label>
                                &nbsp;<input type="text" class="form-control" id="BrandTb" placeholder="Enter The Car's Brand" runat="server">
                            </div>
                            <div class="form-group">
                                <label for="ModelTb">Model&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ModelTb" ErrorMessage="*" ForeColor="#FDCD3B"></asp:RequiredFieldValidator>
                                </label>
                                &nbsp;<input type="text" class="form-control" id="ModelTb" placeholder="Enter Car's Model" runat="server">
                            </div>
                            <div class="form-group">
                                <label for="PriceTb">Price&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PriceTb" ErrorMessage="*" ForeColor="#FDCD3B"></asp:RequiredFieldValidator>
                                </label>
                                &nbsp;<input type="text" class="form-control" id="PriceTb" placeholder="Enter Car's Price" runat="server">
                            </div>
                            <div class="form-group">
                                <label for="ColorTb">Color&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ColorTb" ErrorMessage="*" ForeColor="#FDCD3B"></asp:RequiredFieldValidator>
                                </label>
                                &nbsp;<input type="text" class="form-control" id="ColorTb" placeholder="Enter Car's Color" runat="server">
                            </div>
                            <div class="form-group">
                                &nbsp;<label for="AvailableCb">Available</label>
                                    <asp:DropDownList ID="AvailableCb" runat="server" class="form-control">
                                        <asp:ListItem>Available</asp:ListItem>
                                        <asp:ListItem>Booked</asp:ListItem>
                                    </asp:DropDownList>
                            </div>
                            <br />

                            <Label ID="msg" runat="server"></Label>
                            <asp:Button ID="edit" runat="server" class="btn btn-warning" Text="Edit" Width="110px" OnClick="edit_Click" AutoPostBack="true"/>
                            <asp:Button ID="add" runat="server" class="btn btn-danger" BackColor="Green" BorderColor="Green" Text="Add" Width="110px" OnClick="add_Click" AutoPostBack="true"/>
                            <asp:Button ID="delete" runat="server" class="btn btn-danger" Text="Delete" Width="110px" OnClick="delete_Click"/>
                            <br />
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                
                <h1> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Car List </h1>
               <asp:GridView ID="CarList" runat="server" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="CarList_SelectedIndexChanged" Width="962px">
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

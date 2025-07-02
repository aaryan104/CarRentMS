<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CarRentMS.Views.Admin.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>CRMS</title>
    <style type="text/css">
        .auto-style5 {
            width: 280px;
            height: 135px;
            margin-left: 7px;
        }
        .auto-style6 {
            width: 280px;
            height: 115px;
            margin-left: 0px;
        }
        .auto-style7 {
            width: 280px;
            height: 135px;
            margin-left: 1px;
        }
        .auto-style8 {
            width: 280px;
            height: 135px;
            margin-left: 6px;
        }
        .auto-style9 {
            width: 280px;
            height: 135px;
            margin-left: 4px;
        }
        .auto-style10 {
            width: 280px;
            height: 135px;
        }
        span {
            color: red;
            font: bold;
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container mt-5 ml-5">
        <div class="row">
            <div class="jumbotron bg-warning">
                <div class="container">
                    <h2 class="display-4">Car Rental Management System <span>Admin Panal</span></h2>
                    <p class="lead">● The Admin Can Manage Cars, Customers, Rentals and Returns</p>
                </div>
            </div>
        </div>
            <br/><br/>
        <div class="row">
            <div class="col-lg-3 col-md-6"><div><img src="../../Assets/img/c1.png" alt="Not FoundImage!" class="auto-style10"><h6>Bugatti Veyron</h6></div></div>
            <div class="col-lg-3 col-md-6"><div><img src="../../Assets/img/c2.jpg" alt="Not FoundImage!" class="auto-style5"><h6>Rolls-Royce</h6></div></div>
            <div class="col-lg-3 col-md-6"><div><img src="../../Assets/img/c3.png" alt="Not FoundImage!" class="auto-style10"><h6>Aston Martin</h6></div></div>
            <div class="col-lg-3 col-md-6"><div><img src="../../Assets/img/c4.png" alt="Not FoundImage!" class="auto-style7"><h6>chevrolet Camaro</h6></div></div>
        </div><br /><br /> 
        <div class="row">
            <div class="col-lg-3 col-md-6"><div><img src="../../Assets/img/c5.png" alt="Not FoundImage!" class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <h6>BMW</h6></div></div>
            <div class="col-lg-3 col-md-6"><div><img src="../../Assets/img/c6.jpg" alt="Not FoundImage!" class="auto-style8"><h6>Lamborghini Aventador</h6></div></div>
            <div class="col-lg-3 col-md-6"><div><img src="../../Assets/img/c7.png" alt="Not FoundImage!" class="auto-style9"><h6>Audi</h6></div></div>
            <div class="col-lg-3 col-md-6"><div><img src="../../Assets/img/c8.jpg" alt="Not FoundImage!" class="auto-style10"><h6>Lamborghini Aventador</h6></div></div>
        </div>
    </div>
</asp:Content>

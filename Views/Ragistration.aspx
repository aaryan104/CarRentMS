<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ragistration.aspx.cs" Inherits="CarRentMS.Views.Ragistration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css'>
	<link rel='stylesheet' href='https://fonts.googleapis.com/css2?family=Poppins&amp;display=swap'>
	<title>CRMS</title>
	<style>
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
			font-family: "Open Sans", sans-serif;
		}
		body {
			display: flex;
			align-items: center;
			justify-content: center;
			padding: 0 10px;
			min-height: 100vh;
			background: linear-gradient(110deg, #fdcd3b 70%, #ffed4b 70%);
		}
		form {
			padding: 25px;
			background: #ecf0f1;
			max-width: 500px;
			width: 100%;
			border-radius: 7px;
			box-shadow: 0 10px 15px rgba(0, 0, 0, 0.05);
			color: #2c3e50;
		}
		form h2 {
			color: #FFC107;
			font-size: 27px;
			text-align: center;
			margin: 0px 0 30px;
		}
		form .form-group {
			margin-bottom: 15px;
			position: relative;
		}
		form label {
			display: block;
			font-size: 15px;
			margin-bottom: 7px;
		}
		form input,
		form select {
			height: 45px;
			padding: 10px;
			width: 100%;
			font-size: 15px;
			outline: none;
			background: #fff;
			border-radius: 3px;
			border: 1px solid #bfbfbf;
		}
		form input:focus,
		form select:focus {
			border-color: #9a9a9a;
		}
		form input.error,
		form select.error {
			border-color: #f91919;
			background: #f9f0f1;
		}
		form small {
			font-size: 14px;
			margin-top: 5px;
			display: block;
			color: #f91919;
		}
		form select:hover,
		form input:hover,
		#tbDate:hover {
			cursor: pointer;
			border: 2px solid black;
		}
    	.btnSubmit {
			margin-top: 30px;
			text-align: center;
		}
		.btnSubmit input {
			color: #ffffff;
			border: none;
			height: 50px;
			width: 100%;
			font-size: 18px;
			padding: 0;
			border-radius: 8px;
			cursor: pointer;
			font-weight: 600;
			text-transform: uppercase;
			background: linear-gradient(110deg, #fdcd3b 70%, #ffed4b 70%);
			transition: background 0.3s ease, transform 0.3s ease;
			overflow: hidden;
		}
		.btnSubmit input:hover {
			background: linear-gradient(110deg, #ffed4b 70%, #fdcd3b 70%);
		}
		.btnSubmit input:active {
			transform: scale(0.95);
		}
	</style>
</head>
<body>
	<form id="myForm"  runat="server">
        <h2>Ragistration Form</h2>
		<div class="form-group tbName">
			<asp:Label for="tbName" runat="server" Text="Name"></asp:Label>
				&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbEmail" ErrorMessage="*" ForeColor="#FDCD3B"></asp:RequiredFieldValidator>
				<asp:TextBox ID="tbName" runat="server" placeholder="Enter Your Name"></asp:TextBox>
		</div>
		<div class="form-group tbEmail">
			<asp:Label for="tbEmail" runat="server" Text="Email"></asp:Label>
				&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail" ErrorMessage="Invalid Email" ForeColor="#FDCD3B" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
				<asp:TextBox ID="tbEmail" runat="server" TextMode="Email" placeholder="Enter Your Email"></asp:TextBox>
		</div>
		<div class="form-group tbPhone">
			<asp:Label for="tbPhone" runat="server" Text="Phone"></asp:Label>
				&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbPhone" ErrorMessage="Invalid Phone Number" ForeColor="#FDCD3B" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
				<asp:TextBox ID="tbPhone" runat="server" TextMode="Number" placeholder="Enter Phone Number"></asp:TextBox>
		</div>
		<div class="form-group tbPass">	
			<asp:Label for="tbPass" runat="server" Text="Password"></asp:Label>
				&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tbPass" ErrorMessage="Invalid Password" ForeColor="#FDCD3B" ValidationExpression="^[A-Za-z]\w{6,14}$"></asp:RegularExpressionValidator>
				<asp:TextBox ID="tbPass" runat="server" TextMode="Password" placeholder="Enter Your Password"></asp:TextBox>
		</div>
		<div class="form-group tbDate">
			<asp:Label for="tbDate" runat="server" Text="Birth Date"></asp:Label>
				&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbDate" ErrorMessage="*" ForeColor="#FDCD3B"></asp:RequiredFieldValidator>
				<asp:TextBox ID="tbDate" runat="server" TextMode="Date"></asp:TextBox>
		</div>
		<div class="form-group tbYn">
			<asp:Label for="tbYn" runat="server" Text="Do You Have Driving Licence?"></asp:Label>
				&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbYn" ErrorMessage="*" ForeColor="#FDCD3B"></asp:RequiredFieldValidator>
				<asp:DropDownList ID="tbYn" runat="server">
					<asp:ListItem selected disabled>--Select--</asp:ListItem>
					<asp:ListItem>Yes</asp:ListItem>
					<asp:ListItem>No</asp:ListItem>
				</asp:DropDownList>
		</div>
		<label id="msg" runat="server"></label>
		<div class="form-group btnSubmit">
			<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
		</div>
		<div class="form-group lblMessage">
    <asp:Label ID="lblMessage" runat="server" ForeColor="#fdcd3b" Text=""></asp:Label>
</div>
	</form>
</body>
</html>
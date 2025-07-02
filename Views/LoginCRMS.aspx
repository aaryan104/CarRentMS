<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginCRMS.aspx.cs" Inherits="CarRentMS.LoginCRMS" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CRMS</title>
    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'>
    <link rel='stylesheet' href='https://fonts.googleapis.com/css2?family=Poppins&amp;display=swap'>
    <style>
         {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }
        :root {
            --primary-color: #c6c3c3;
            --second-color: #ffffff;
            --black-color: #000000;
        }
        body {
            background-image: url("Car_Back.png");
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .wrapper {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: rgba(0, 0, 0, 0.2);
        }
        .box {
            position: relative;
            width: 400px;
            backdrop-filter: blur(20px);
            border: 2px solid var(--primary-color);
            border-radius: 15px;
            padding: 7.5em 2.5em 4em 2.5em;
            color: var(--second-color);
            box-shadow: 0px 0px 10px 2px rgba(0, 0, 0, 0.2);
        }
        .header {
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: var(--primary-color);
            width: 140px;
            height: 70px;
            border-radius: 0 0 20px 20px;
        }
        .header span {
            font-size: 30px;
            color: var(--black-color);
        }
        .header::before {
            content: "";
            position: absolute;
            top: 0;
            left: -30px;
            width: 30px;
            height: 30px;
            border-top-right-radius: 50%;
            background: transparent;
            box-shadow: 15px 0 0 0 var(--primary-color);
        }
        .header::after {
            content: "";
            position: absolute;
            top: 0;
            right: -30px;
            width: 30px;
            height: 30px;
            border-top-left-radius: 50%;
            background: transparent;
            box-shadow: -15px 0 0 0 var(--primary-color);
        }
        .input-field {
            margin-top: 5px;
            width: 80%;
            height: 50px;
            font-size: 16px;
            background: transparent;
            color: var(--second-color);
            padding-inline: 20px 50px;
            border: 2px solid var(--primary-color);
            border-radius: 30px;
            outline: none;
        }
        .input-field:hover {
            cursor: initial;
        }
        .input-submit {
            width: 100%;
            height: 50px;
            background: #ececec;
            font-size: 16px;
            font-weight: 500;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: 0.3s;
        }
        .input-submit:hover {
            background: var(--second-color);
        }
        .auto-style1 {
            text-align: center;
        }
        .custo {
            accent-color: red;
        }
        .admin {
            accent-color: Green;
        }
        a:link {
            text-decoration: none;
            color: white;
        }
        a:visited {
            text-decoration: none;
            color: white;
        }
        a:hover {
            text-decoration: none;
            color: white;
            font-size:110%;
            transition: 1s;
        }
        a:active {
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="box">
                <div class="header">
                    <span>CRMS</span>
                </div>
                <div>
                    <label for="email">
                        Email
                <asp:TextBox type="text" ID="txtEmail" class="input-field" runat="server"></asp:TextBox>
                    </label>
                    <strong>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ForeColor="#FDCD3B" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </strong>
                </div>
                <br />
                <div>
                    <label for="pass">
                        Password
                <asp:TextBox type="password" ID="txtPassword" class="input-field" runat="server"></asp:TextBox>
                    </label>
                    <strong>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Invalid Password" ForeColor="#FDCD3B" ValidationExpression="^[A-Za-z]\w{6,14}$"></asp:RegularExpressionValidator>
                    </strong>
                </div>
                <br />
                <div class="auto-style1">
                    <asp:RadioButtonList ID="txtRole" runat="server" Height="25px" RepeatDirection="Horizontal" Width="365px">
                        <asp:ListItem class="custo" id="customer" Selected Value="Customer"> Customer </asp:ListItem>
                        <asp:ListItem class="admin" id="admin" Value="Admin"> Admin </asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="auto-style1">
                <br />
                <a href="Ragistration.aspx" class="ragis">Ragister?</a>
                <br />
                </div>
                <div class="auto-style1">
                    <asp:Button class="input-submit" runat="server" Text="Login" ID="Btn_login" Width="235px" OnClick="Btn_login_Click" />
                </div>
                <div class="auto-style1">
                    <asp:Label ID="lblMessage" runat="server" ForeColor="white" Text=""></asp:Label>
                </div>

            </div>
        </div>
    </form>
</body>
</html>





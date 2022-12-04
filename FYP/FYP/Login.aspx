<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FYP.Login"  MasterPageFile="~/Site1.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style4 {
            width: 100%;
            height: 336px;
        }
        .auto-style15 {
            height: 23px;
            text-align: center;
            font-size: xx-large;
        }
        .auto-style5 {
            height: 23px;
            width: 147px;
            text-align: center;
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style13 {
            text-align: center;
            height: 25px;
        width: 147px;
    }
        .auto-style12 {
            text-align: left;
            height: 25px;
            width: 1232px;
        }
        .auto-style8 {
            text-align: center;
            height: 30px;
        }
        .auto-style11 {
            text-align: center;
        }
        .auto-style30 {
            height: 23px;
            width: 818px;
            text-align: center;
        }
        .auto-style31 {
            text-align: center;
            height: 25px;
            width: 818px;
        }
        .auto-style32 {
            height: 41px;
            width: 1232px;
            margin-left: 1px;
        }
        .auto-style33 {
            height: 41px;
            width: 818px;
            text-align: center;
        }
        .auto-style34 {
            height: 41px;
            width: 147px;
            text-align: center;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <table class="auto-style4" >
                <tr>
                    <td class="auto-style15" colspan="3"><strong>Login Page</strong></td>
                </tr>
                <tr>
                    <td class="auto-style33"></td>
                    <td class="auto-style34">User Name:</td>
                    <td class="auto-style32">
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Please Enter User Name !" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30">&nbsp;</td>
                    <td class="auto-style5">Password:</td>
                    <td class="auto-style32">
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" Height="24px" ImageUrl="~/Image/showPass.png" OnClick="ImageButton1_Click" Width="38px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="Please Enter Password !" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style31"></td>
                    <td class="auto-style13"></td>
                    <td class="auto-style12">
                            <script type="text/javascript" __designer:mapid="7a">

                                function showpass(chkShow) {
                                    var spass = document.getElementById("password");
                                    if (chkShow.checked)
                                        txtPass.setAttribute("type", "text");
                                    else
                                        txtPass.setAttribute("type", "password");
                                }
                            </script>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="3">
                        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" BackColor="Black" Font-Bold="True" ForeColor="White" Height="28px" Width="73px" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="3">Dont Have Account? <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Register.aspx">Sign Up</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11" colspan="3">&nbsp;</td>
                </tr>
            </table>
        </div>

    
</asp:Content>

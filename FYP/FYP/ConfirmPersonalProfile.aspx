<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmPersonalProfile.aspx.cs" Inherits="FYP.ConfirmPersonalProfile" MasterPageFile="~/Site1.Master" %>

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
            width: 210px;
            text-align: center;
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style13 {
            text-align: center;
            height: 25px;
            width: 210px;
        }
        .auto-style12 {
            text-align: left;
            height: 25px;
            width: 1000px;
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
            width: 447px;
            text-align: center;
        }
        .auto-style31 {
            text-align: center;
            height: 25px;
            width: 447px;
        }
        .auto-style32 {
            height: 41px;
            width: 1000px;
            margin-left: 1px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <table class="auto-style4" >
                <tr>
                    <td class="auto-style15" colspan="3">Enter Password</td>
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
                    <td class="auto-style13">&nbsp;</td>
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
                    <td class="auto-style31">&nbsp;</td>
                    <td class="auto-style13">
                        <asp:Button ID="btnBack" runat="server" CausesValidation="False" OnClick="btnBack_Click" Text="Back" BackColor="#FFFF66" Font-Size="Medium" />
                    </td>
                    <td class="auto-style12">
                        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Change" BackColor="Aqua" Font-Size="Medium" />
                        </td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="3">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="3"></td>
                </tr>
                <tr>
                    <td class="auto-style11" colspan="3">&nbsp;</td>
                </tr>
            </table>
        </div>

    
</asp:Content>

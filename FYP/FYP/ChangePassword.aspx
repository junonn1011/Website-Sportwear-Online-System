<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="FYP.ChangePassword"  MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">

        .auto-style5 {
            width: 100%;
            height: 553px;
        }
        .auto-style11 {
            height: 23px;
            text-align: center;
        }
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style8 {
             height: 23px;
             width: 571px;
             text-align: center;
         }
        .auto-style4 {
            height: 23px;
        }
        .auto-style7 {
            width: 571px;
            text-align: center;
            height: 32px;
        }
        .auto-style10 {
            height: 32px;
        }
        .auto-style9 {
            height: 51px;
            text-align: left;
        }
         .auto-style30 {
             height: 56px;
             width: 571px;
             text-align: center;
         }
         .auto-style31 {
             height: 56px;
         }
         .auto-style32 {
             height: 51px;
             width: 571px;
             text-align: center;
         }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <table class="auto-style5" >
                <tr>
                    <td class="auto-style11" colspan="2"><strong><span class="auto-style1">Change Password </span></strong></td>
                </tr>
                <tr>
                    <td class="auto-style7">Password:</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" Height="24px" ImageUrl="~/Image/showPass.png" OnClick="ImageButton1_Click" Width="38px" />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required " ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">Confirm Password:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" Height="24px" ImageUrl="~/Image/showPass.png" OnClick="ImageButton2_Click" Width="38px" />
                        </td>
                </tr>
                <tr>
                    <td class="auto-style30"></td>
                    <td class="auto-style31">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm Password is required " ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Password was not match !" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style32">
                        <asp:Button ID="btnBack" runat="server" CausesValidation="False" OnClick="btnBack_Click" Text="Back" BackColor="#FFFF66" Height="30px" Width="80px" />
                    </td>
                    <td class="auto-style9">
                        <asp:Button ID="btnChange" runat="server" OnClick="btnChange_Click" Text="Change" BackColor="Aqua" Height="30px" Width="80px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
            </table>
        </div>
</asp:Content>


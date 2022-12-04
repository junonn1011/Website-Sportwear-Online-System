<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FYP.WebForm2"  MasterPageFile="~/Site1.Master"%>
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
            width: 832px;
            text-align: center;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style7 {
            width: 832px;
            text-align: center;
            height: 32px;
        }
        .auto-style10 {
            height: 32px;
        }
        .auto-style9 {
            height: 23px;
            text-align: left;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <table class="auto-style5" >
                <tr>
                    <td class="auto-style11" colspan="2"><strong><span class="auto-style1">Sign up </span></strong></td>
                </tr>
                <tr>
                    <td class="auto-style8">Username: </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtUsername" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required " ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblUsername" runat="server"></asp:Label>
                        <br />
                    </td>
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
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm Password is required " ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Password was not match !" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp; First Name:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtFirstName" ErrorMessage="User Name is required " ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">Last Name:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtLastName" runat="server" Width="166px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">Date of Birth:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtDOB" runat="server" type="date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtDOB" ErrorMessage="Date of Birth is required " ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtDOB" Display="Dynamic" ErrorMessage="Age not in range" ForeColor="Red" SetFocusOnError="True" Type="Date"></asp:RangeValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">Position:</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="ddlPosition" runat="server">
                            <asp:ListItem Value="0">None</asp:ListItem>
                            <asp:ListItem Value="1">Admin</asp:ListItem>
                            <asp:ListItem Value="2">Customer</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlPosition" ErrorMessage="Select An Item" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">E-mail</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtEmail" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required " ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">Phone Number:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtNumber" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtNumber" ErrorMessage="Phone Number is required " ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtNumber" ErrorMessage="Digit Number should be 10 number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:Button ID="btnBack" runat="server" CausesValidation="False" OnClick="btnBack_Click" Text="Back" />
                    </td>
                    <td class="auto-style9">
                        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
            </table>
        </div>
</asp:Content>





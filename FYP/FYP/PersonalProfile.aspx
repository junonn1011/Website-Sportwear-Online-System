<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonalProfile.aspx.cs" Inherits="FYP.PersonalProfile" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style15 {
            height: 186px;
        }
        .auto-style15 {
            height: 186px;
        }
        .auto-style15 {
            height: 40px;
        }
        .auto-style15 {
            height: 186px;
        }
        
        .auto-style5 {
            width: 100%;
            height: 553px;
        }
        .auto-style8 {
        height: 23px;
        width: 423px;
        text-align: center;
    }
        .auto-style4 {
            height: 23px;
        }
        .auto-style9 {
            height: 23px;
            text-align: left;
        }
        .auto-style30 {
            height: 23px;
            text-align: center;
        }
        .auto-style31 {
            height: 23px;
            text-align: center;
            width: 314px;
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <table class="auto-style5" >
                <tr>
                    <td class="auto-style30" colspan="3">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Personal Information"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style31">&nbsp;</td>
                    <td class="auto-style8">Username: </td>
                    <td class="auto-style4">
                        <asp:Label ID="lblUsername" runat="server"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style31">&nbsp;</td>
                    <td class="auto-style8">&nbsp; First Name:</td>
                    <td class="auto-style4">
                        &nbsp;<asp:Label ID="lblFirstName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style31">&nbsp;</td>
                    <td class="auto-style8">Last Name:</td>
                    <td class="auto-style4">
                        <asp:Label ID="lblLastName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style31">&nbsp;</td>
                    <td class="auto-style8">Date of Birth:</td>
                    <td class="auto-style4">
                        <asp:Label ID="lblDOB" runat="server"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style31">&nbsp;</td>
                    <td class="auto-style8">E-mail</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtEmail" runat="server"  Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required " ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style31">&nbsp;</td>
                    <td class="auto-style8">Phone Number:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtNumber" runat="server"  Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtNumber" ErrorMessage="Phone Number is required " ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtNumber" ErrorMessage="Digit Number should be 10 number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                
                <tr>
                    <td class="auto-style31">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Change Password</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style31">
                        &nbsp;</td>
                    <td class="auto-style8">
                        <asp:Button ID="btnDelete" runat="server" CausesValidation="False" OnClick="btnDelete_Click" onClientClick="return confirm('Are You Sure To Delete')" Text="Delete" BackColor="#FFFF66" Font-Size="Medium" Height="30px" Width="80px" />
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="False" OnClick="btnCancel_Click" Text="Cancel" Visible="False" BackColor="Aqua" Font-Size="Medium" Height="30px" Width="87px" />
                    </td>
                    <td class="auto-style9">
                        <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" BackColor="#66FFFF" Font-Size="Medium" Height="30px" Width="80px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style31">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
            </table>
            </div>
        </div>
</asp:Content>
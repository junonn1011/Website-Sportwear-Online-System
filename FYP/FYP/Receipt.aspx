<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="FYP.Receipt" MasterPageFile="~/Site1.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            text-align: center;
            height: 38px;
        }

        .auto-style11 {
            height: 37px;
            width: 330px;
        }

        .auto-style14 {
            height: 42px;
            width: 330px;
        }

        .auto-style15 {
            height: 45px;
        }

        .auto-style17 {
            width: 330px;
            height: 45px;
        }

        .auto-style18 {
            height: 38px;
        }

        .auto-style20 {
            height: 46px;
            width: 330px;
        }

        .auto-style23 {
            width: 330px;
            height: 36px;
        }

        .auto-style26 {
            height: 43px;
            width: 330px;
        }

        .auto-style27 {
            text-align: center;
            height: 53px;
        }

        .auto-style42 {
            text-align: center;
            width: 835px;
            height: 38px;
        }

        .auto-style44 {
            height: 37px;
            width: 835px;
        }

        .auto-style45 {
            width: 835px;
            height: 42px;
        }

        .auto-style46 {
            width: 835px;
            height: 45px;
        }

        .auto-style47 {
            width: 835px;
            height: 36px;
        }

        .auto-style48 {
            height: 46px;
            width: 835px;
        }

        .auto-style49 {
            width: 835px;
            height: 43px;
        }

        .auto-style50 {
            height: 37px;
            width: 896px;
        }

        .auto-style51 {
            height: 42px;
            width: 896px;
        }

        .auto-style52 {
            width: 896px;
            height: 45px;
        }

        .auto-style53 {
            width: 896px;
            height: 36px;
        }

        .auto-style54 {
            height: 46px;
            width: 896px;
        }

        .auto-style55 {
            height: 43px;
            width: 896px;
        }

        .auto-style56 {
            width: 100%;
            height: 539px;
        }
        .auto-style57 {
            height: 43px;
        }
        .auto-style58 {
            height: 37px;
            width: 893px;
        }
        .auto-style59 {
            width: 893px;
            height: 42px;
        }
        .auto-style60 {
            width: 893px;
            height: 45px;
        }
        .auto-style61 {
            width: 893px;
            height: 36px;
        }
        .auto-style62 {
            height: 46px;
            width: 893px;
        }
        .auto-style63 {
            width: 893px;
            height: 43px;
        }
        .auto-style64 {
            text-align: center;
            width: 835px;
            height: 39px;
        }
        .auto-style65 {
            text-align: center;
            height: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style= "background-image: url('Image/purplewhite.png');" class="auto-style56">
            <tr>
                <td class="auto-style42"></td>
                <td class="auto-style4" colspan="2">
                    <asp:Label ID="Label27" runat="server" Font-Size="50px" Text="Receipt" ForeColor="Blue"></asp:Label>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style64">&nbsp;</td>
                <td class="auto-style65" colspan="2">
                    <asp:Label ID="Label4" runat="server" Font-Size="X-Large" Text="You had puchased Successful" ForeColor="#6600CC"></asp:Label>
                </td>
                <td class="auto-style65">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style64"></td>
                <td class="auto-style65" colspan="2">
                </td>
                <td class="auto-style65"></td>
            </tr>
            <tr>
                <td class="auto-style44"></td>
                <td class="auto-style58">
                    <asp:Label ID="Label5" runat="server" Text="Date of Time :" Font-Size="X-Large"></asp:Label>
                </td>
                <td class="auto-style50" style="background-image: none">
                    <asp:Label ID="lbldate" runat="server" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style11" style="background-image: none"></td>
            </tr>
            <tr>
                <td class="auto-style45">&nbsp;</td>
                <td class="auto-style59">
                    <asp:Label ID="Label9" runat="server" Text="UserName : " Font-Size="X-Large"></asp:Label>
                    <br />
                </td>
                <td class="auto-style51" style="background-image: none">
                    <asp:Label ID="lblName" runat="server" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style14" style="background-image: none">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style46">&nbsp;</td>
                <td class="auto-style60">
                    <asp:Label ID="Label14" runat="server" Text="Payment No :" Font-Size="X-Large"></asp:Label>
                </td>
                <td class="auto-style52" style="background-image: none">
                    <asp:Label ID="lblpaymentNo" runat="server" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style17" style="background-image: none">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style47">&nbsp;</td>
                <td class="auto-style61">
                    <asp:Label ID="Label17" runat="server" Text="Payment Method :" Font-Size="X-Large"></asp:Label>
                </td>
                <td class="auto-style53" style="background-image: none">
                    <asp:Label ID="lblPayMethod" runat="server" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style23" style="background-image: none">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style48">&nbsp;</td>
                <td class="auto-style62">
                    <asp:Label ID="Label19" runat="server" Text="Pay By :" Font-Size="X-Large"></asp:Label>
                </td>
                <td class="auto-style54" style="background-image: none">
                    <asp:Label ID="lblPayType" runat="server" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style20" style="background-image: none">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style49">&nbsp;</td>
                <td class="auto-style63">
                    <asp:Label ID="Label21" runat="server" Text="Account / Cart Number :" Font-Size="X-Large"></asp:Label>
                </td>
                <td class="auto-style55" style="background-image: none">
                    <asp:Label ID="lblNum" runat="server" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style26" style="background-image: none">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style44">&nbsp;</td>
                <td class="auto-style58">
                    <asp:Label ID="Label23" runat="server" Text="Total Item :" Font-Size="X-Large"></asp:Label>
                </td>
                <td class="auto-style50" style="background-image: none">
                    <asp:Label ID="lblItem" runat="server" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style11" style="background-image: none">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style49">&nbsp;</td>
                <td class="auto-style63">
                    <asp:Label ID="Label25" runat="server" Text="Totak Amount (RM) :" Font-Size="X-Large"></asp:Label>
                </td>
                <td class="auto-style55" style="background-image: none">
                    <asp:Label ID="lblTotalAmount" runat="server" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style26" style="background-image: none">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style49">&nbsp;</td>
                <td class="auto-style63">
                    &nbsp;</td>
                <td class="auto-style55" style="background-image: none">
                    &nbsp;</td>
                <td class="auto-style26" style="background-image: none">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style49">&nbsp;</td>
                <td class="auto-style57" colspan="2">
                    <asp:Label ID="Label26" runat="server" ForeColor="Red">We had send the receipt to your email</asp:Label>
                </td>
                <td class="auto-style26" style="background-image: none">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style49">&nbsp;</td>
                <td class="auto-style63">&nbsp;</td>
                <td class="auto-style55" style="background-image: none">
                    <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back To Home Page" BackColor="Black" ForeColor="White" Font-Size="Medium" Height="42px" Width="234px" Font-Bold="True" />
                </td>
                <td class="auto-style26" style="background-image: none">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style49">&nbsp;</td>
                <td class="auto-style63">&nbsp;</td>
                <td class="auto-style55" style="background-image: none">&nbsp;</td>
                <td class="auto-style26" style="background-image: none">&nbsp;</td>
            </tr>
        </table>

    </div>
</asp:Content>


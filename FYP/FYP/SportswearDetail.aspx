<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SportswearDetail.aspx.cs" Inherits="FYP.SportswearDetail" MasterPageFile="~/Site1.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .auto-style31 {
            height: 43px;
            width: 451px;
        }
        .auto-style32 {
            width: 451px;
        }
        .auto-style33 {
            height: 43px;
            width: 370px;
        }
        .auto-style34 {
            width: 370px;
        }
        .auto-style35 {
            width: 100%;
            height: 397px;
        }
        .auto-style36 {
            height: 43px;
        }
        
        .auto-style39 {
            height: 43px;
            text-align: left;
        }
        .auto-style40 {
            height: 28px;
            width: 451px;
        }
        .auto-style41 {
            height: 28px;
        }
        .auto-style42 {
            width: 451px;
            height: 36px;
        }
        .auto-style43 {
            height: 36px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            
        <table class="auto-style35" >
            <tr>
                <td class="auto-style31">&nbsp;</td>
                <td class="auto-style39" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" ForeColor="Red" Text="Sportswear Detail"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style31">&nbsp;</td>
                <td class="auto-style36" colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style31"></td>
                <td class="auto-style33">&nbsp;</td>
                <td class="auto-style36">
                    <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="Sportswear Id :"></asp:Label>
&nbsp;<asp:Label ID="lblSportswearId" runat="server" Font-Size="X-Large" ForeColor="Fuchsia"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style34" rowspan="6">
                    <asp:Image ID="ImgSportswear" runat="server" Width="238px" />
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Font-Size="X-Large" Text="Name :"></asp:Label>
                    &nbsp;
                    <asp:Label ID="lblName" runat="server" Font-Size="X-Large" ForeColor="Fuchsia"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style40"></td>
                <td class="auto-style41">
                    <asp:Label ID="Label4" runat="server" Font-Size="X-Large" Text="Price :"></asp:Label>
&nbsp;<asp:Label ID="lblPrice" runat="server" Font-Size="X-Large" ForeColor="Fuchsia"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td>
                    <asp:Label ID="Label5" runat="server" Font-Size="X-Large" Text="Description :"></asp:Label>
&nbsp;<asp:Label ID="lblDesc" runat="server" Font-Size="X-Large" ForeColor="Fuchsia" Height="33px" Width="496px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td>
                    <asp:Label ID="Label6" runat="server" Font-Size="X-Large" Text="Category :"></asp:Label>
&nbsp;<asp:Label ID="lblCategory" runat="server" Font-Size="X-Large" ForeColor="Fuchsia"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td>
                    <asp:Label ID="Label7" runat="server" Font-Size="X-Large" Text="Size :"></asp:Label>
&nbsp;<asp:Label ID="lblSize" runat="server" Font-Size="X-Large" ForeColor="Fuchsia"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style42"></td>
                <td class="auto-style43">
                    <asp:Label ID="Label8" runat="server" Font-Size="X-Large" Text="Stock :"></asp:Label>
&nbsp;<asp:Label ID="lblStock" runat="server" Font-Size="X-Large" ForeColor="Fuchsia"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style31"></td>
                <td class="auto-style33"></td>
                <td class="auto-style36">
                </td>
            </tr>
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style34">&nbsp;</td>
                <td>
                    <asp:ImageButton ID="imgBtnWish" runat="server" Height="42px" ImageUrl="~/Image/loveIcon.png" OnClick="imgBtnWish_Click" Width="51px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="imgBtnCart" runat="server" Height="41px" ImageUrl="~/Image/cart.png" Width="55px" OnClick="imgBtnCart_Click" />
                </td>
            </tr>
        </table>
            
        </div>


</asp:Content>


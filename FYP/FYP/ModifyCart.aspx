<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyCart.aspx.cs" Inherits="FYP.ModifyCart" MasterPageFile="~/Site1.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style30 {
            width: 862px;
            height: 49px;
        }
        .auto-style31 {
            width: 634px;
            height: 49px;
        }
        .auto-style32 {
            width: 383px;
            height: 49px;
        }
        .auto-style33 {
            width: 336px;
            height: 49px;
        }
        .auto-style34 {
            text-align: center;
        }
        .auto-style39 {
            width: 634px;
            height: 53px;
        }
        .auto-style40 {
            width: 383px;
            height: 53px;
        }
        .auto-style41 {
            width: 336px;
            height: 53px;
        }
        .auto-style42 {
            width: 862px;
            height: 53px;
        }
        .auto-style43 {
            width: 634px;
            height: 51px;
        }
        .auto-style44 {
            width: 383px;
            height: 51px;
        }
        .auto-style45 {
            width: 336px;
            height: 51px;
        }
        .auto-style46 {
            width: 862px;
            height: 51px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div>
    
        <table class="auto-style52" style="  background-image: url('Image/pur.png');" >
            <tr>
                <td class="auto-style34" colspan="4">
                    <asp:Label ID="lbl2" runat="server" ForeColor="Black" Font-Size="55px">Modify Cart</asp:Label>
                </td>
            </tr>
           
            <tr>
                <td class="auto-style43"></td>
                <td class="auto-style44">&nbsp;<asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="Card Id :"></asp:Label>
                </td>
                <td class="auto-style45">
                    <asp:Label ID="lblCartId" runat="server" ForeColor="Red" Font-Size="X-Large"></asp:Label>
                </td>
                <td class="auto-style46">
                    </td>
            </tr>
            <tr>
                <td class="auto-style39"></td>
                <td class="auto-style40">
                    <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="Sportswear Name :"></asp:Label>
                </td>
                <td class="auto-style41">
                    <asp:Label ID="lblCartName" runat="server" ForeColor="Red" Font-Size="X-Large"></asp:Label>
                </td>
                <td class="auto-style42">
                    </td>
            </tr>
            <tr>
                <td class="auto-style43"></td>
                <td class="auto-style44">
                    <asp:Label ID="Label3" runat="server" Font-Size="X-Large" Text="Price:"></asp:Label>
                </td>
                <td class="auto-style45">
                    <asp:Label ID="lblPrice" runat="server" ForeColor="Red" Font-Size="X-Large"></asp:Label>
                </td>
                <td class="auto-style46">
                    </td>
            </tr>
            <tr>
                <td class="auto-style43"></td>
                <td class="auto-style44">
                    <asp:Label ID="Label4" runat="server" Font-Size="X-Large" Text="Description:"></asp:Label>
                </td>
                <td class="auto-style45">
                    <asp:Label ID="lblDesc" runat="server" ForeColor="Red" Font-Size="X-Large" Width="297px"></asp:Label>
                </td>
                <td class="auto-style46">
                    </td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style44">
                    <asp:Label ID="Label8" runat="server" Font-Size="X-Large" Text="Category:"></asp:Label>
                </td>
                <td class="auto-style45">
                    <asp:Label ID="lblCategory" runat="server" ForeColor="Red" Font-Size="X-Large"></asp:Label>
                </td>
                <td class="auto-style46">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43"></td>
                <td class="auto-style44">
                    <asp:Label ID="Label5" runat="server" Font-Size="X-Large" Text="Stock :"></asp:Label>
                </td>
                <td class="auto-style45">
                    <asp:Label ID="lblStock" runat="server" ForeColor="Red" Font-Size="X-Large"></asp:Label>
                </td>
                <td class="auto-style46">
                    </td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style44">
                    <asp:Label ID="Label9" runat="server" Font-Size="X-Large" Text="Size :"></asp:Label>
                </td>
                <td class="auto-style45">
                    <asp:Label ID="lblSize" runat="server" ForeColor="Red" Font-Size="X-Large"></asp:Label>
                </td>
                <td class="auto-style46">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43"></td>
                <td class="auto-style44">
                    <asp:Label ID="Label6" runat="server" Font-Size="X-Large" Text="Quantity :"></asp:Label>
                </td>
                <td class="auto-style45">
                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" BackColor="#FF99FF" ForeColor="Black">
                        <asp:ListItem>0</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList>
                &nbsp;&nbsp;
                </td>
                <td class="auto-style46">
                    </td>
            </tr>
            <tr>
                <td class="auto-style43"></td>
                <td class="auto-style44">
                    <asp:Label ID="Label7" runat="server" Font-Size="X-Large" Text="Total Price :"></asp:Label>
                </td>
                <td class="auto-style45">
                    <asp:Label ID="lblToTal" runat="server" ForeColor="#CC00FF" Font-Size="X-Large"></asp:Label>
                </td>
                <td class="auto-style46">
                    </td>
            </tr>
            <tr>
                <td class="auto-style31">
                    </td>
                <td class="auto-style32">
                    &nbsp;</td>
                <td class="auto-style33">
                    &nbsp;&nbsp;
                    <asp:Button ID="btnSave" runat="server" Text="Save" Width="102px" OnClick="btnSave_Click" BackColor="#FFFFCC" ForeColor="#660066" Height="31px" />
                </td>
                <td class="auto-style30">
                    </td>
            </tr>
        </table>
        </div>
       
</asp:Content>

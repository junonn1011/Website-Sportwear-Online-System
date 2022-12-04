<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FYP.Cart" MasterPageFile="~/Site1.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style26 {
            text-align: center;
        }

        .auto-style38 {
            margin-left: 280px;
            margin-top: 30px;
          
        }
        .auto-style39 {
            width: 680px;
        }
        .auto-style30 {
            text-align: center;
            color: white;
           
            height: 117px;
        }
        .auto-style31 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <table style="width:100%; background-image: url('Image/purplewhite.png');">
                <tr>
                    <td class="auto-style30" colspan="2">
                        <asp:Label ID="Label1" runat="server" Font-Size="40pt" ForeColor="Red" Height="57px" Text="Cart" Width="771px"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="lblName" runat="server" ForeColor="Red" Font-Size="30px" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        
                        <br />
                        <br />
                        <div class="auto-style31">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="None"  DataKeyNames="cartId" Height="297px"  Width="900px" CssClass="auto-style38" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:BoundField DataField="cartId" HeaderText="Card Id" />
                                <asp:ImageField DataImageUrlField="cartImg" HeaderText="Sportswear" ReadOnly="True">
                                    <ControlStyle Height="90px" Width="110px" />
                                </asp:ImageField>
                                <asp:BoundField DataField="cartName" HeaderText="Product Name" />
                                <asp:BoundField DataField="cartCategory" HeaderText="Category" />
                                <asp:BoundField DataField="size" HeaderText="Size" />
                                <asp:BoundField DataField="cartPrice" HeaderText=" Price" ReadOnly="True" DataFormatString="{0:f}" />
                                <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                                <asp:BoundField DataField="totalPrice" HeaderText="Total Price" DataFormatString="{0:f}" />
                                <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/Image/btnDelete.png">
                                <ControlStyle BackColor="#FFFFCC" ForeColor="#FF3300" Height="30px" Width="30px" />
                                <ItemStyle BorderStyle="None" />
                                </asp:CommandField>
                                
                                <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectText="Edit" SelectImageUrl="~/Image/btnEdit.png" >
                                
                                <ControlStyle BackColor="#FF66FF" Height="30px" Width="30px" />
                                </asp:CommandField>
                                
                            </Columns>
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                            <SortedDescendingHeaderStyle BackColor="#3E3277" />
                        </asp:GridView>
                        &nbsp;</div>
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                    </td>
                </tr>
                
                <tr>
                    <td class="auto-style39">
                        
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        <br />
                        <br />
                        
                        </td>
                    <td>
                        
                        &nbsp;<asp:Label ID="Label5" runat="server" Text="Total Item :" Font-Size="25px"></asp:Label>
&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblItem" runat="server" Font-Size="25px" ForeColor="#6600CC"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="Total Price : RM " Font-Size="25px"></asp:Label>
&nbsp;<asp:Label ID="lblTotalPrice" runat="server" Font-Size="25px" ForeColor="#6600CC"></asp:Label>
                        &nbsp;&nbsp;
                        <br />
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCheckOut" runat="server" OnClick="btnCheckOut_Click" Text="Order" Width="112px" BackColor="Yellow" Font-Bold="False" Font-Size="Large" />
                        
                        </td>
                </tr>
                
            </table>
        </div>
</asp:Content>


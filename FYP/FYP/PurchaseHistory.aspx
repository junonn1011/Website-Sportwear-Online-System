<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="FYP.PruchaseHistory" MasterPageFile="~/Site1.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .auto-style30 {
            width: 501px;
        }
        .auto-style31 {
            width: 792px;
        }
        .auto-style32 {
            width: 792px;
            text-align: center;
        }
        .auto-style33 {
            width: 501px;
            text-align: center;
        }
         .auto-style34 {
             width: 501px;
             text-align: center;
             height: 37px;
         }
         .auto-style35 {
             width: 792px;
             text-align: center;
             height: 37px;
         }
         .auto-style36 {
             height: 37px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <table style="width:100%;background-image: url('Image/pur.png'); min-height: 500px;">
                <tr>
                    <td class="auto-style33">&nbsp;</td>
                    <td class="auto-style32">
                    <asp:Label ID="Label9" runat="server" Font-Size="XX-Large" ForeColor="#CC33FF" Text="Purchase History"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style34"></td>
                    <td class="auto-style35">
                    </td>
                    <td class="auto-style36"></td>
                </tr>
                <tr>
                    <td class="auto-style33">&nbsp;</td>
                    <td class="auto-style32">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Height="643px" Width="749px">
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:BoundField DataField="orderNo" HeaderText="Order Number" />
                                <asp:ImageField DataImageUrlField="image" HeaderText="Sportswear">
                                    <ControlStyle Height="80px" Width="80px" />
                                </asp:ImageField>
                                <asp:BoundField DataField="productName" HeaderText="Name" />
                                <asp:TemplateField HeaderText="Order Detail">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="Price :"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RM
                                        <asp:Label ID="Label5" runat="server" ForeColor="Blue" Text='<%# Eval("price","{0:F}") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text="Qty :"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x
                                        <asp:Label ID="Label6" runat="server" ForeColor="Blue" Text='<%# Eval("quantity") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text="Total Price :"></asp:Label>
                                        &nbsp;&nbsp;&nbsp; RM
                                        <asp:Label ID="Label7" runat="server" ForeColor="Blue" Text='<%# Eval("totalPrice","{0:F}") %>'></asp:Label>
                                        <br />
                                        &nbsp;
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="dateTime" HeaderText="Date" />
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
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style30">&nbsp;</td>
                    <td class="auto-style31">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>

</asp:Content>

       
    

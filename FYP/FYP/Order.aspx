<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="FYP.Order"  MasterPageFile="~/Site1.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style type="text/css">
        .auto-style30 {
            width: 615px;
        }
        .auto-style31 {
            width: 615px;
            text-align: center;
        }
    </style>
    <style type="text/css">
        .auto-style31 {
            width: 373px;
        }
        .auto-style32 {
            width: 391px;
        }
        .auto-style33 {
            width: 391px;
            height: 36px;
        }
        .auto-style35 {
            height: 36px;
        }
        .auto-style37 {
            width: 391px;
            height: 48px;
        }
        .auto-style38 {
            height: 48px;
        }
    </style>
    <style type="text/css">
        .auto-style30 {
            width: 711px;
        }
        .auto-style31 {
            width: 543px;
        }
        .auto-style32 {
            width: 711px;
            text-align: center;
        }
        .auto-style33 {
            width: 711px;
            text-align: right;
        }
        .auto-style39 {
            width: 711px;
            text-align: right;
        }
        .auto-style40 {
            width: 711px;
            height: 48px;
            text-align: right;
        }
        .auto-style41 {
            width: 543px;
            text-align: center;
            height: 48px;
        }
        .auto-style42 {
            width: 711px;
            text-align: center;
        }
        .auto-style43 {
            width: 711px;
            height: 36px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;background-image: url('Image/purplewhite.png');">
        <tr>
            <td class="auto-style32">&nbsp;</td>
            <td class="auto-style42">
                <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" ForeColor="Blue" Text="Order Summary"></asp:Label>
                <br />
            </td>
            <td class="auto-style31">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style33"></td>
            <td class="auto-style30">
                <asp:Label ID="Label4" runat="server" Font-Size="X-Large" ForeColor="#9900CC" Text="Order No : "></asp:Label>
                <asp:Label ID="lblOrderNo" runat="server" Font-Size="X-Large" ForeColor="#FF6600"></asp:Label>
            </td>
            <td class="auto-style31">
                <asp:Label ID="Label5" runat="server" Font-Size="X-Large" ForeColor="Blue" Text="Discount Voucher Provided"></asp:Label>
                <br />
                <br />
                If you purchase&nbsp;
                <br />
                &gt;= RM500 will get 20% discount vouvher<br />
                &gt;= RM700 will get 30% discount voucher<br />
                &gt;= RM1000 will get 40% discount voucher</td>
            <td class="auto-style35">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style32">&nbsp;</td>
            <td class="auto-style30">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="692px" CellPadding="3" GridLines="Horizontal" Height="284px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" DataKeyNames="orderId" OnRowDeleting="GridView1_RowDeleting">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:ImageField DataImageUrlField="image">
                                <ControlStyle Height="90px" Width="110px" />
                            </asp:ImageField>
                            <asp:BoundField DataField="productName" HeaderText="Sportswear" />
                            <asp:BoundField DataField="price" HeaderText="Price" DataFormatString="{0:F}" />
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    &nbsp;&nbsp; &nbsp;x
                                    <asp:Label ID="lblQty" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Price">
                                <ItemTemplate>
                                    &nbsp; RM
                                    <asp:Label ID="lblTotalPrice" runat="server" Text='<%# Eval("totalPrice","{0:F}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/btnDelete.png" ShowDeleteButton="True">
                            <ControlStyle Height="30px" Width="30px" />
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

                </td>
            <td class="auto-style31">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style32">&nbsp;</td>
            <td class="auto-style30">
                    <br />
                    <asp:Label ID="lblmessage" runat="server" Text="You Have Discount Voucher (%)"></asp:Label>
                    <br />
                    <asp:RadioButtonList ID="radDiscount" runat="server" DataValueField="discountVoucher" Height="26px">
                    </asp:RadioButtonList>
                    <asp:Button ID="btnUse" runat="server" OnClick="btnUse_Click" Text="Use" BackColor="#FFFFCC" Height="32px" Width="57px" />
                    <br />

                </td>
            <td class="auto-style31">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style37"></td>
            <td class="auto-style43">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="Total Item   :       "></asp:Label>
&nbsp;<asp:Label ID="lblItem" runat="server" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                    <br />
&nbsp;<asp:Label ID="lbltxtDA" runat="server" Font-Size="X-Large" Text="Discount Amount  (RM):       "></asp:Label>
&nbsp;<asp:Label ID="lblDiscAmt" runat="server" Font-Size="X-Large" ForeColor="Red"></asp:Label>

                    <br />
                    <asp:Label ID="Label3" runat="server" Font-Size="X-Large" Text="Total Price (RM):"></asp:Label>
&nbsp;<asp:Label ID="lblTotalPrice" runat="server" Font-Size="X-Large" ForeColor="Red"></asp:Label>

                </td>
            <td class="auto-style31"></td>
            <td class="auto-style38">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style37"></td>
            <td class="auto-style40">
                    </td>
            <td class="auto-style41"></td>
            <td class="auto-style38"></td>
        </tr>
        <tr>
            <td class="auto-style32">&nbsp;</td>
            <td class="auto-style39">
                <br />
                <asp:Button ID="btnCancel" runat="server" BackColor="Lime" Height="44px" OnClick="btnCancel_Click" Text="Cancel" Width="131px" Font-Bold="False" Font-Size="22px" />
                &nbsp;&nbsp;
                <asp:Button ID="btnOrder" runat="server" BackColor="#FFFF66" Height="45px" Text="Confirm Order" Width="162px" OnClick="btnOrder_Click" Font-Bold="False" Font-Size="22px" />
                <br />
            </td>
            <td class="auto-style31">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    
</asp:Content>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="FYP.WishList" MasterPageFile="~/Site1.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    </style><style type="text/css">
        .auto-style30 {
            width: 446px;
        }
        .auto-style31 {
            width: 571px;
        }
        .auto-style32 {
            width: 469px;
        }
        .auto-style33 {
            width: 100%;
            height: 714px;
        }
        .auto-style34 {
            width: 446px;
            height: 50px;
        }
        .auto-style35 {
            width: 571px;
            height: 50px;
        }
        .auto-style36 {
            width: 469px;
            height: 50px;
        }
        .auto-style37 {
            width: 571px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <table style="background-image: url('Image/purplewhite.png');" class="auto-style33">
                <tr>
                    <td class="auto-style30">&nbsp;</td>
                    <td class="auto-style37">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Red" Text="Wish List"></asp:Label>
                    </td>
                    <td class="auto-style32">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style30">&nbsp;</td>
                    <td class="auto-style31">
                        <asp:GridView ID="GridView1" runat="server" Width="813px" AutoGenerateColumns="False" CellPadding="3" GridLines="Horizontal" Height="317px" style="text-align: center" DataKeyNames="WishId" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:BoundField DataField="wishId" HeaderText="Wish Id" />
                                <asp:BoundField DataField="wishName" HeaderText="Product Name" />
                                <asp:BoundField DataField="wishCategory" HeaderText="Category" />
                                <asp:BoundField DataField="size" HeaderText="Size" />
                                <asp:BoundField DataField="wishPrice" HeaderText="Price" DataFormatString="{0:f}" />
                                <asp:ImageField DataImageUrlField="wishImg" HeaderText="Sportwear">
                                    <ControlStyle Height="90px" Width="110px" />
                                </asp:ImageField>
                                <asp:CommandField ButtonType="Image" SelectImageUrl="~/Image/cart4.png" ShowSelectButton="True" />
                                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/btnDelete.png" ShowDeleteButton="True">
                                <ControlStyle Height="25px" Width="25px" />
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
                    <td class="auto-style32">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style34"></td>
                    <td class="auto-style35"></td>
                    <td class="auto-style36"></td>
                </tr>
            </table>
        </div>

</asp:Content>

    
        
    

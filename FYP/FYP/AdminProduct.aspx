<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProduct.aspx.cs" Inherits="FYP.AdminProduct"  MasterPageFile="~/Site1.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style30 {
            width: 172px;
        }
        .auto-style31 {
            width: 1233px;
        }
        .auto-style32 {
            width: 172px;
            height: 507px;
        }
        .auto-style33 {
            width: 1233px;
            height: 507px;
        }
        .auto-style34 {
            height: 507px;
        }
        .auto-style35 {
            width: 1233px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>



        <table style="width:100%;">
            <tr>
                <td class="auto-style30">&nbsp;</td>
                <td class="auto-style35">
                    <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" ForeColor="#CC33FF" Text="Product List"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style32"></td>
                <td class="auto-style33">&nbsp;<asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Search :"></asp:Label>
                    <asp:DropDownList ID="productCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="productCategory_SelectedIndexChanged" Height="35px" Width="138px">
                    </asp:DropDownList>
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_SelectedIndexChanged" RepeatColumns="5" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <asp:Label ID="productNameLabel" runat="server" ForeColor="Fuchsia" Text='<%# Eval("productName") %>' Font-Size="X-Large" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%#Eval("productId")%>' CommandName="goToEditProduct" Height="145px" ImageUrl='<%# Eval("productImg") %>' Width="223px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Font-Size="X-Large" Text="RM"></asp:Label>
                                    &nbsp;
                                    <asp:Label ID="productPriceLabel" runat="server" Text='<%# Eval("productPrice","{0:F}") %>' Font-Size="X-Large" />
                                    <br />
                                </td>
                            </tr>
                        </table>
                        <br />
                        &nbsp;<br />
                        <br />
                        <br />
                    </ItemTemplate>
                    </asp:DataList>
&nbsp;<div class="auto-style29">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
                    </div>
                </td>
                <td class="auto-style34"></td>
            </tr>
            <tr>
                <td class="auto-style30">&nbsp;</td>
                <td class="auto-style31">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>



        </div>

</asp:Content>

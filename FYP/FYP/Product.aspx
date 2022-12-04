<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="FYP.Product" MasterPageFile="~/Site1.Master"%>
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
            height: 31px;
        }
        .auto-style36 {
            width: 172px;
            height: 31px;
        }
        .auto-style37 {
            height: 31px;
        }
        .auto-style39 {
            width: 1233px;
            text-align: center;
            height: 94px;
        }
        .auto-style40 {
            width: 172px;
            height: 94px;
        }
        .auto-style41 {
            height: 94px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>



        <table style="width:100%;">
            <tr>
                <td class="auto-style36"></td>
                <td class="auto-style35">
                    </td>
                <td class="auto-style37"></td>
            </tr>
            <tr>
                <td class="auto-style40"></td>
                <td class="auto-style39">
                    <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" ForeColor="#CC33FF" Text="Product List"></asp:Label>
                        </td>
                <td class="auto-style41"></td>
            </tr>
            <tr>
                <td class="auto-style32"></td>
                <td class="auto-style33">&nbsp;<asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Search :"></asp:Label>
                    <asp:DropDownList ID="productCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="productCategory_SelectedIndexChanged" Height="35px" Width="138px">
                    </asp:DropDownList>
                    &nbsp;<div class="auto-style29">
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="productId" DataSourceID="SqlDataSource1" RepeatColumns="5" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" Height="443px">
                            <ItemTemplate>
                                <br />
                                &nbsp;<asp:Label ID="productNameLabel" runat="server" ForeColor="Fuchsia" Text='<%# Eval("productName") %>' Font-Size="X-Large" />
                                <br />
                                <br />
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="goToSportswearDetail" Height="145px" ImageUrl='<%# Eval("productImg") %>' Width="223px" CommandArgument='<%#Eval("productId")%>' />
                                <br />
                                <br />
                                <asp:Label ID="Label3" runat="server" Font-Size="X-Large" Text="RM"></asp:Label>
                                &nbsp;<asp:Label ID="productPriceLabel" runat="server" Text='<%# Eval("productPrice","{0:F}") %>' Font-Size="X-Large" />
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </td>
                <td class="auto-style34"></td>
            </tr>
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style33">
                        <asp:DataList ID="DataList2" runat="server"  RepeatColumns="5"  RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" Height="443px">
                            <HeaderStyle BackColor="Black" Font-Bold="true" Font-Size="Large" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderTemplate>Popular</HeaderTemplate>
                             <ItemTemplate>
                                <br />
                                &nbsp;<asp:Label ID="productNameLabel" runat="server" ForeColor="Fuchsia" Text='<%# Eval("popularName") %>' Font-Size="X-Large" />
                                <br />
                                <br />
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="goToSportswearDetail" Height="145px" ImageUrl='<%# Eval("popularImg") %>' Width="223px" CommandArgument='<%#Eval("productId")%>' />
                                <br />
                                <br />
                                 <asp:Label ID="Label3" runat="server" Font-Size="X-Large" Text="RM"></asp:Label>
                                 &nbsp;
                            <asp:Label ID="productPriceLabel" runat="server" Text='<%# Eval("popularPrice","{0:F}") %>' Font-Size="X-Large" />
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                </td>
                <td class="auto-style34">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style30">&nbsp;</td>
                <td class="auto-style31">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
                    </td>
                <td>&nbsp;</td>
            </tr>
        </table>



        </div>

</asp:Content>


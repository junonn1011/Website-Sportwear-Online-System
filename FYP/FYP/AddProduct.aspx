<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="FYP.AddProduct" MasterPageFile="~/Site1.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style30 {
            font-size: xx-large;
            text-align: center;
        }
        .auto-style30 {
            font-size: xx-large;
            text-align: center;
        }
        .auto-style31 {
            width: 100%;
            height: 813px;
        }
        .auto-style31 {
            width: 100%;
            height: 813px;
        }
        .auto-style59 {
            height: 71px;
            width: 56px;
        }
        .auto-style59 {
            height: 71px;
            width: 120px;
        }
        .auto-style53 {
            height: 71px;
            width: 391px;
        }
        .auto-style53 {
            height: 71px;
            width: 391px;
        }
        .auto-style47 {
            height: 71px;
            width: 281px;
        }
        .auto-style47 {
            height: 71px;
            width: 281px;
        }
        .auto-style7 {
            height: 71px;
            width: 611px;
        }
        .auto-style7 {
            height: 71px;
        }
        .auto-style61 {
            height: 72px;
            width: 56px;
        }
        .auto-style61 {
            height: 72px;
            width: 120px;
        }
        .auto-style55 {
            height: 72px;
            width: 391px;
        }
        .auto-style55 {
            height: 72px;
            width: 391px;
        }
        .auto-style49 {
            height: 72px;
            width: 281px;
        }
        .auto-style49 {
            height: 72px;
            width: 281px;
        }
        .auto-style11 {
            height: 72px;
            width: 611px;
        }
        .auto-style11 {
            height: 72px;
        }
        .auto-style50 {
            height: 62px;
            width: 281px;
        }
        .auto-style50 {
            height: 62px;
            width: 281px;
        }
        .auto-style63 {
            height: 115px;
            width: 120px;
        }
        .auto-style63 {
            height: 186px;
            width: 120px;
        }
        .auto-style57 {
            height: 115px;
            width: 391px;
        }
        .auto-style57 {
            height: 186px;
            width: 391px;
        }
        .auto-style51 {
            height: 115px;
            width: 281px;
        }
        .auto-style51 {
            height: 186px;
            width: 281px;
        }
        .auto-style15 {
            height: 186px;
        }
        .auto-style15 {
            height: 186px;
        }
        .auto-style15 {
            height: 40px;
        }
        .auto-style64 {
            width: 56px;
            height: 42px;
        }
        .auto-style64 {
            width: 120px;
            height: 42px;
        }
        .auto-style45 {
            width: 391px;
            height: 42px;
        }
        .auto-style45 {
            width: 391px;
            height: 42px;
        }
        .auto-style43 {
            width: 281px;
        }
        .auto-style43 {
            width: 281px;
        }

        .auto-style7 {
            height: 71px;
        }
        .auto-style11 {
            height: 72px;
        }
        .auto-style15 {
            height: 186px;
        }
        .auto-style30 {
            font-size: xx-large;
            text-align: center;
        }
        .auto-style31 {
            width: 100%;
            height: 813px;
        }
        .auto-style43 {
            width: 281px;
        }
        .auto-style45 {
            width: 391px;
            height: 42px;
        }
        .auto-style47 {
            height: 71px;
            width: 281px;
        }
        .auto-style49 {
            height: 72px;
            width: 281px;
        }
        .auto-style50 {
            height: 62px;
            width: 281px;
        }
        .auto-style51 {
            height: 186px;
            width: 281px;
        }
        .auto-style53 {
            height: 71px;
            width: 391px;
        }
        .auto-style55 {
            height: 72px;
            width: 391px;
        }
        .auto-style57 {
            height: 186px;
            width: 391px;
        }
        .auto-style59 {
            height: 71px;
            width: 120px;
        }
        .auto-style61 {
            height: 72px;
            width: 120px;
        }
        .auto-style63 {
            height: 186px;
            width: 120px;
        }
        .auto-style64 {
            width: 120px;
            height: 42px;
        }
                .auto-style69 {
            height: 62px;
            width: 56px;
        }
                .auto-style70 {
                    height: 62px;
                    width: 391px;
                }
                .auto-style71 {
                    height: 62px;
                    width: 281px;
                }
                .auto-style72 {
            height: 62px;
            width: 611px;
        }
        .auto-style73 {
            height: 55px;
            width: 56px;
        }
        .auto-style74 {
            height: 55px;
        }
        .auto-style75 {
            height: 115px;
            width: 611px;
        }
        .auto-style76 {
            width: 611px;
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
                <h3 class="auto-style30">Add a product</h3>
            </div>
            <center>
                <table class="auto-style31">
                    <tr>
                        <td class="auto-style73"></td>
                        <td class="auto-style74" colspan="3">
                            <asp:Label ID="lblSuccesfully" runat="server" ForeColor="#006600"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style59">&nbsp;</td>
                        <td class="auto-style53">Product Name:</td>
                        <td class="auto-style47">
                            <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtProductName" ErrorMessage="Enter Product Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style61">&nbsp;</td>
                        <td class="auto-style55">Price:&nbsp;&nbsp;&nbsp;</td>
                        <td class="auto-style49">
                            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style11">
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="Cannot be Negative" ForeColor="Red" MaximumValue="10000" MinimumValue="0" Type="Double"></asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="Enter Price" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="Enter 2 Decimal place eg: 10.00" ForeColor="Red" ValidationExpression="^(-)?(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style69"></td>
                        <td class="auto-style70">Stock:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td class="auto-style71">
                            <asp:TextBox ID="txtStock" runat="server" TextMode="Number" min="0"></asp:TextBox>
                        </td>
                        <td class="auto-style72">
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtStock" ErrorMessage="Cannot be Negative" ForeColor="Red" MaximumValue="10000" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="rfvStock" runat="server" ControlToValidate="txtStock" ErrorMessage="Enter Stock" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtStock" ErrorMessage="Write Integer" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style69">&nbsp;</td>
                        <td class="auto-style70">Image:</td>
                        <td class="auto-style50">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </td>
                        <td class="auto-style72">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Upload Art Please" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style63"></td>
                        <td class="auto-style57">Description:</td>
                        <td class="auto-style51">
                            <asp:TextBox ID="txtDescription" runat="server" Height="104px" TextMode="MultiLine" Width="287px"></asp:TextBox>
                        </td>
                        <td class="auto-style75">
                            <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription" ErrorMessage="Enter Description" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style69"></td>
                        <td class="auto-style70">Category</td>
                        <td class="auto-style71">
                            <asp:DropDownList ID="ddlCategory" runat="server">
                                <asp:ListItem>Shoe</asp:ListItem>
                                <asp:ListItem>Clothes</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style72"></td>
                    </tr>
                    <tr>
                        <td class="auto-style69"></td>
                        <td class="auto-style70">Size</td>
                        <td class="auto-style71">
                            <asp:DropDownList ID="ddlSize" runat="server">
                                <asp:ListItem>S</asp:ListItem>
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>L</asp:ListItem>
                                <asp:ListItem>XL</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style72"></td>
                    </tr>
                    <tr>
                        <td class="auto-style64">&nbsp;</td>
                        <td class="auto-style45">
                            <asp:Button ID="btnBack" runat="server" CausesValidation="False" OnClick="btnBack_Click" Text="Back" BackColor="#FFFF66" Font-Size="Medium" Height="30px" Width="80px" />
                        </td>
                        <td class="auto-style43">
                            <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload " BackColor="Aqua" Font-Size="Medium" Height="30px" Width="80px" />
                        </td>
                        <td class="auto-style76">&nbsp;</td>
                    </tr>
                </table>
            </center>
        </div>
</asp:Content>


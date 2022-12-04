<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="FYP.EditProduct" MasterPageFile="~/Site1.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
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
            width: 510px;
        }
        
        .auto-style38 {
            width: 370px;
            height: 28px;
        }
        .auto-style39 {
            height: 28px;
            width: 510px;
        }
        .auto-style40 {
            width: 237px;
            height: 49px;
        }
        .auto-style41 {
            height: 49px;
            width: 510px;
        }
        .auto-style42 {
            width: 237px;
            height: 45px;
        }
        .auto-style43 {
            height: 45px;
            width: 510px;
        }
        
        .auto-style44 {
            margin-left: 0px;
        }
        
        .auto-style45 {
            width: 510px;
        }
        .auto-style46 {
            height: 43px;
            width: 423px;
        }
        .auto-style47 {
            width: 423px;
        }
        .auto-style48 {
            height: 45px;
            width: 423px;
        }
        .auto-style49 {
            height: 49px;
            width: 423px;
        }
        .auto-style50 {
            height: 28px;
            width: 423px;
        }
        
        .auto-style51 {
            height: 43px;
            width: 237px;
        }
        .auto-style52 {
            width: 237px;
        }
        .auto-style53 {
            width: 237px;
            height: 28px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            
        <table class="auto-style35" style="background-image: url('Image/purplewhite.png');">
            <tr>
                <td class="auto-style51"></td>
                <td class="auto-style33"></td>
                <td class="auto-style46">Sportswear Id :<asp:Label ID="lblSportswearId" runat="server"></asp:Label>
                </td>
                <td class="auto-style36">
                </td>
            </tr>
            <tr>
                <td class="auto-style52">&nbsp;</td>
                <td class="auto-style34" rowspan="6">
                    <asp:Image ID="ImgSportswear" runat="server" Width="238px" />
                </td>
                <td class="auto-style47">Name :&nbsp;
                    <asp:TextBox ID="txtName" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style45">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style52">&nbsp;</td>
                <td class="auto-style47">Price :
                    <asp:TextBox ID="txtPrice" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style45">
                            <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="Enter Price" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="Enter 2 Decimal place eg: 10.00" ForeColor="Red" ValidationExpression="^(-)?(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$"></asp:RegularExpressionValidator>
                            <br />
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="Cannot be Negative" ForeColor="Red" MaximumValue="10000" MinimumValue="0" Type="Double"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style52">&nbsp;</td>
                <td class="auto-style47">Description :
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style45">
                            <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription" ErrorMessage="Enter Description" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
            </tr>
            <tr>
                <td class="auto-style42"></td>
                <td class="auto-style48">Category :
                            <asp:DropDownList ID="ddlCategory" runat="server" Enabled="False">
                                <asp:ListItem>Shoe</asp:ListItem>
                                <asp:ListItem>Clothes</asp:ListItem>
                            </asp:DropDownList>
                </td>
                <td class="auto-style43">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style52">&nbsp;</td>
                <td class="auto-style47">Size :
                            <asp:DropDownList ID="ddlSize" runat="server" Enabled="False">
                                <asp:ListItem>S</asp:ListItem>
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>L</asp:ListItem>
                                <asp:ListItem>XL</asp:ListItem>
                            </asp:DropDownList>
                </td>
                <td class="auto-style45">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style40"></td>
                <td class="auto-style49">Stock Quantity :
                    <asp:Label ID="lblStock" runat="server"></asp:Label>
                </td>
                <td class="auto-style41">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style53"></td>
                <td class="auto-style38">
                            <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" Font-Size="Small" />
                    &nbsp;<br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Upload Art Please" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                        </td>
                <td class="auto-style50">
                    Add Stock Quantity :
                    <asp:TextBox ID="txtStock" runat="server" Width="94px" Enabled="False"></asp:TextBox>
                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click"  Text="Add" Visible="False" BackColor="Aqua" Font-Size="Medium" Height="25px" Width="64px" />
                    </td>
                <td class="auto-style39">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtStock" ErrorMessage="Write Integer" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                            <br />
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtStock" ErrorMessage="Cannot be Negative" ForeColor="Red" MaximumValue="10000" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style52">&nbsp;</td>
                <td class="auto-style34">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnImage" runat="server" OnClick="btnImage_Click" Text="Change" CausesValidation="False" BackColor="#FFFF66" Font-Size="Medium" />
                </td>
                <td class="auto-style47">
                    <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" onClientClick="return confirm('Are You Sure To Delete')" Text="Delete" BackColor="#FFFF66" Font-Size="Medium" Height="30px" Width="80px" />
                    &nbsp;<asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" Visible="False" CausesValidation="False" BackColor="Aqua" Font-Size="Medium" Height="30px" Width="80px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnEdit" runat="server" CssClass="auto-style44" OnClick="btnEdit_Click" Text="Edit" Width="80px" BackColor="Aqua" Font-Size="Medium" Height="30px" />
                    </td>
                <td class="auto-style45">
                    <asp:Button ID="btnPopular" runat="server" CausesValidation="False" OnClick="btnPopular_Click" Text="Add to Popular" BackColor="Aqua" Font-Size="Medium" />
                </td>
            </tr>
        </table>
            
        </div>


</asp:Content>

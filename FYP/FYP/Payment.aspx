<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="FYP.Payment" MasterPageFile="~/Site1.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style30 {
            width: 513px;
        }

        

        .auto-style33 {
            width: 232px;
            height: 36px;
        }

        .auto-style38 {
            height: 38px;
        }

        .auto-style39 {
            height: 40px;
        }

        .auto-style41 {
            width: 513px;
            height: 26px;
        }

        .auto-style44 {
            height: 26px;
            width: 250px;
        }

        .auto-style45 {
            width: 157px;
        }

        .auto-style46 {
            width: 157px;
            height: 42px;
        }

        .auto-style47 {
            width: 157px;
            height: 38px;
        }

        .auto-style48 {
            width: 157px;
            height: 40px;
        }
        .auto-style49 {
            height: 34px;
        }
        .auto-style53 {
            height: 42px;
        }
        .auto-style57 {
            width: 20px;
        }
       
        .auto-style61 {
            height: 26px;
            width: 232px;
        }
        .auto-style62 {
            width: 232px;
        }
        .auto-style63 {
            width: 99px;
        }
        .auto-style64 {
            height: 26px;
            width: 99px;
        }
        .auto-style65 {
            height: 26px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>



        <table style="width: 100%;   aria-required="False" aria-selected="undefined">
            <tr>
                <td class="auto-style41">
                    <asp:Label ID="Label17" runat="server" Font-Size="45px" ForeColor="#33CC33" Text="Order Information"></asp:Label>
                </td>
                <td class="auto-style44" colspan="3">
                    <asp:Label ID="Label14" runat="server" Font-Size="45px" ForeColor="Blue" Text="Payment Information"></asp:Label>
                </td>
                <td class="auto-style61"></td>
            </tr>
            <tr>
                <td class="auto-style30">
                    <asp:Label ID="Label16" runat="server" Text="Total Amount (RM):" Font-Size="Large"></asp:Label>
                &nbsp;<asp:Label ID="lblTotalAmount" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style63">&nbsp;</td>
                <td class="auto-style57">&nbsp;</td>
                <td class="auto-style45">&nbsp;</td>
                <td class="auto-style62">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style30" rowspan="20">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="413px" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:ImageField DataImageUrlField="image" HeaderText="Sportswear">
                                <ControlStyle Height="65px" Width="65px" />
                            </asp:ImageField>
                            <asp:TemplateField HeaderText="Order Details">
                                <ItemTemplate>
                                    <asp:Label ID="lblArtwork" runat="server" Text='<%# Eval("productName") %>' ForeColor="Red"></asp:Label>
                                    <br />
                                    RM
                                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price","{0:F}") %>'></asp:Label>
                                    <br />
                                    Qty: x<asp:Label ID="lblQty" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total (RM:)
                                        <asp:Label ID="lblTotalPrice" runat="server" Text='<%# Eval("totalPrice","{0:F}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>

                </td>
                <td colspan="2">
                    <asp:Label ID="Label2" runat="server" Text="User Name :" Font-Size="Large"></asp:Label>
                </td>
                <td class="auto-style45">
                    <asp:Label ID="lblUserName" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style62">
                    <asp:Label ID="label13" runat="server" Font-Size="Large">Date Time ：</asp:Label>
                    &nbsp;<asp:Label ID="lblDate" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style53" colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="Total Item :" Font-Size="Large"></asp:Label>
                </td>
                <td class="auto-style46">
                    <asp:Label ID="lblItem" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style53" colspan="2">
                    <asp:Label ID="lbltxtdis" runat="server" Text="Discount (" Font-Size="Large"></asp:Label>
                    <asp:Label ID="lblDiscountVoucher" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblTxtPercent" runat="server" Font-Size="Large" ForeColor="Black">%):</asp:Label>
                &nbsp;</td>
                <td class="auto-style46">
                    <asp:Label ID="lbltxtRM1" runat="server" Font-Size="Large" ForeColor="Red">RM</asp:Label>
                    <asp:Label ID="lblDiscountAmount" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style38" colspan="2">
                    <asp:Label ID="lbltxtFinalTotalAmount" runat="server" Text="Total Amount (RM):" Font-Size="Large"></asp:Label>
                </td>
                <td class="auto-style47">
                    <asp:Label ID="lbltxtRM2" runat="server" Font-Size="Large" ForeColor="Red">RM</asp:Label>
                    <asp:Label ID="lblFinalTotalAmount" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style39" colspan="2">
                    <asp:Label ID="Label7" runat="server" Text="Order No :" Font-Size="Large"></asp:Label>
                </td>
                <td class="auto-style48">
                    <asp:Label ID="lblOrderNo" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label9" runat="server" Text="Payment Method :" Font-Size="Large"></asp:Label>
                    &nbsp;</td>
                <td class="auto-style45">
                    <asp:RadioButtonList ID="radPaymentMtd" runat="server" AutoPostBack="True" OnSelectedIndexChanged="radPaymentMtd_SelectedIndexChanged" Font-Size="Large" ForeColor="Red" Width="175px">
                        <asp:ListItem>Credit Card</asp:ListItem>
                        <asp:ListItem>Online Banking</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style65" colspan="4">
                    <asp:Label ID="lblCardPayment" runat="server" Text="Credit Card Payment" Visible="False" Font-Size="XX-Large" ForeColor="Green" Width="349px" Height="62px"></asp:Label>
                    &nbsp;&nbsp;<asp:Label ID="lblBankPayment" runat="server" Text="Online banking Payment" Visible="False" Font-Size="XX-Large" ForeColor="Green" Width="428px" Height="55px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style65" colspan="4">
                    <asp:Image ID="imgCard" runat="server" Height="98px" ImageUrl="~/Image/creditcard.png" Visible="False" Width="391px" />
                    <asp:Image ID="imgOnlineBank" runat="server" Height="84px" ImageUrl="~/Image/onlineBank.png" Visible="False" Width="387px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style65" colspan="4">
                    <asp:RadioButtonList ID="radCardType" runat="server" AutoPostBack="True" Visible="False" Font-Size="Large" OnSelectedIndexChanged="radCardType_SelectedIndexChanged">
                        <asp:ListItem>Visa</asp:ListItem>
                        <asp:ListItem>Master</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:DropDownList ID="ddlBank" runat="server" AutoPostBack="True" Visible="False" Font-Size="Large">
                        <asp:ListItem>Select bank</asp:ListItem>
                        <asp:ListItem>Maybank</asp:ListItem>
                        <asp:ListItem>Public bank</asp:ListItem>
                        <asp:ListItem>Ambank</asp:ListItem>
                        <asp:ListItem>CIMB Bank</asp:ListItem>
                        <asp:ListItem>Hong Leong Bank Berhad</asp:ListItem>
                        <asp:ListItem>RHB Bank</asp:ListItem>
                        <asp:ListItem>Citibank Berhad</asp:ListItem>
                        <asp:ListItem>MBSB Bank</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style65" colspan="4">
                    <asp:Label ID="lblCardNum" runat="server" Text="Credit Card Number" Visible="False" Font-Size="Large" Width="205px"></asp:Label>
                    <asp:Label ID="lblAccNum" runat="server" Text="Account Number" Visible="False" Font-Size="Large"></asp:Label>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style65" colspan="4">
                    <asp:TextBox ID="txtCardNum" runat="server" Visible="False"></asp:TextBox>
                    <asp:TextBox ID="txtAccNum" runat="server" Visible="False" ForeColor="Black" Width="168px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCardNum" ErrorMessage="Format Card Number must xxxx-xxxx-xxxx-xxxx .(First number of Visa : 4 ; Master : 5)" ForeColor="Red">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCardNum" ErrorMessage="Credit Card Number Is Required !" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer"
                        ControlToValidate="txtAccNum" ErrorMessage="Account Number Only Accept Number !" ForeColor="Red">*</asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAccNum" ErrorMessage="Account Number Is Required !" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style65" colspan="4">
                    <asp:Label ID="lblCardUserName" runat="server" Text="Card Holder Name" Visible="False" Font-Size="Large"></asp:Label>
                    <asp:Label ID="lblBankUserName" runat="server" Text="User Name " Visible="False" Font-Size="Large"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="auto-style65" colspan="4">
                    <asp:TextBox ID="txtCardUserName" runat="server" hint="Card Name" Visible="False"></asp:TextBox>
                    <asp:TextBox ID="txtBankUserName" runat="server" Visible="False"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCardUserName" ErrorMessage="Card Holder Name Only Accept Letter !" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z][a-zA-Z ]*$">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCardUserName" ErrorMessage="User Name Is Required !" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBankUserName" ErrorMessage="User Name Is Required !" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtBankUserName" ErrorMessage="User Name Only Accept Letter !" ForeColor="Red" ValidationExpression="^[a-zA-Z][a-zA-Z ]*$">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style65" colspan="4">
                    <asp:Label ID="lblBankPassword" runat="server" Text="Password" Visible="False" Font-Size="Large"></asp:Label>
                    <asp:Label ID="lbltxtExDate" runat="server" Text="Expiry Date " Font-Size="Large" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblSecureCode" runat="server" Text="Secure Code " Visible="False" Font-Size="Large"></asp:Label>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style49" colspan="4">
                    
                    <asp:TextBox ID="txtBankPassword" runat="server" Visible="False" TextMode="Password"></asp:TextBox>
                    <asp:TextBox ID="txtExDate" runat="server" Visible="False"></asp:TextBox>
                    <asp:TextBox ID="txtSecureCode" runat="server" Visible="False"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtBankPassword" ErrorMessage="Bank Password Is Required !" ForeColor="Red">*</asp:RequiredFieldValidator>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtExDate" ErrorMessage="Expiry Date Are Required !" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSecureCode" ErrorMessage="Secure Code Is Required !" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ErrorMessage="Expiry Date Should Be MM/YY !" ControlToValidate="txtExDate" Font-Size="Medium" ForeColor="Red" ValidationExpression="^(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})$" Display="Dynamic">*</asp:RegularExpressionValidator>
                    <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer"
                        ControlToValidate="txtSecureCode" ErrorMessage="Secure Code Only Accept Number !" ForeColor="Red" ID="CompareValidator1">*</asp:CompareValidator>
                    
                    </td>
            </tr>
            <tr>
                <td class="auto-style65" colspan="4">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td class="auto-style64">
                    </td>
                <td colspan="3" class="auto-style44"></td>
            </tr>
            <tr>
                <td class="auto-style64">
                    &nbsp;</td>
                <td class="auto-style57">
                    &nbsp;</td>
                <td class="auto-style45">
                    &nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style64">
                    <asp:Button ID="btnCheckOut" runat="server" BackColor="#FF99FF" OnClick="btnCheckOut_Click" Text="Pay" Font-Bold="True" Font-Size="22px" Height="40px" Width="86px" />
                </td>
                <td class="auto-style57">
                    &nbsp;</td>
                <td class="auto-style45">
                    &nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
            </tr>

        </table>



    </div>
</asp:Content>



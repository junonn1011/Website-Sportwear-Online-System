<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="FYP.Report" MasterPageFile="~/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .auto-style31 {
            width: 300px;
        }
        .auto-style32 {
            width: 300px;
        }
        
        .auto-style33 {
            width: 300px;
            text-align: center;
        }
        .auto-style34 {
            width: 300px;
            height: 110px;
        }
        .auto-style35 {
            width: 300px;
            height: 92px;
        }
        .auto-style36 {
            width: 300px;
            height: 53px;
        }
        .auto-style37 {
            width: 300px;
            text-align: right;
        }
        
    </style><style type="text/css">
        
        .auto-style31 {
            width: 300px;
        }
        .auto-style32 {
            width: 300px;
        }
        
        .auto-style33 {
            width: 300px;
            text-align: center;
        }
        .auto-style34 {
            width: 300px;
            height: 110px;
        }
        .auto-style35 {
            width: 300px;
            height: 92px;
        }
        .auto-style36 {
            width: 300px;
            height: 53px;
        }
        .auto-style37 {
            width: 300px;
            text-align: right;
        }
        
        .auto-style38 {
            text-align: right;
        }
        .auto-style39 {
            width: 300px;
            height: 39px;
        }
        .auto-style40 {
            width: 300px;
            text-align: center;
            height: 39px;
        }
        
                .auto-style41 {
                    width: 300px;
                    height: 26px;
                }
        
                .auto-style42 {
                    text-align: center;
                }
        
    </style></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table class="auto-style4">
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style33" colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Blue" Text="Report View"></asp:Label>
                    </td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style31">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style33" colspan="2">
                    &nbsp;</td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style31">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style29" colspan="2">&nbsp;<asp:Button ID="btnDailyReport" runat="server" OnClick="btnDailyReport_Click" Text="Check Daily Sales Report" BackColor="#99FF66" Font-Size="Medium" ForeColor="Black" Height="42px" Width="340px" BorderColor="#99FF66" />
                </td>
                <td colspan="2" class="auto-style29">
                    <asp:Button ID="btnMonthlyReport" runat="server" OnClick="btnMonthlyReport_Click" Text="Check Monthly Sales Report" BackColor="#FF99FF" Font-Size="Medium" ForeColor="Black" Height="42px" Width="340px" BorderColor="#CC33FF" />
                </td>
                <td class="auto-style31">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style38" colspan="2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td class="auto-style31">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style39"></td>
                <td class="auto-style39"></td>
                <td class="auto-style40" colspan="2">
                    <asp:Label ID="lbltxtReport" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style39"></td>
                <td class="auto-style39"></td>
            </tr>
            <tr>
                <td class="auto-style32"></td>
                <td class="auto-style37">
                    <asp:Label ID="lbltxtMonth" runat="server" Text="Month :" Font-Size="Large"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlMonth" runat="server" Visible="False" Height="30px" Width="166px" Font-Size="Large">
                        <asp:ListItem>Select Month</asp:ListItem>
                        <asp:ListItem Value="1">January</asp:ListItem>
                        <asp:ListItem Value="2">February</asp:ListItem>
                        <asp:ListItem Value="3">March</asp:ListItem>
                        <asp:ListItem Value="4">April</asp:ListItem>
                        <asp:ListItem Value="5">Mei</asp:ListItem>
                        <asp:ListItem Value="6">June</asp:ListItem>
                        <asp:ListItem Value="7">July</asp:ListItem>
                        <asp:ListItem Value="8">Ogos</asp:ListItem>
                        <asp:ListItem Value="9">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="11">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style31" colspan="2">
                    <asp:TextBox ID="txtDateTime" runat="server" Height="28px" Width="181px" Enabled="False"></asp:TextBox>

                    <asp:ImageButton ID="imgbtnCld" runat="server" Height="34px" ImageUrl="~/Image/calender.png" ImageAlign="AbsBottom" Width="40px" OnClick="imgbtnCld_Click" />

                    <asp:Button ID="btnSearchDay" runat="server" BackColor="#FFFF66" ForeColor="Black" OnClick="btnSearchDay_Click" Text="Search" Font-Size="Large" />
                </td>
                <td class="auto-style32">
                    <asp:Label ID="lbltxtYear" runat="server" Text="Year :" Font-Size="Large"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlYear" runat="server" Visible="False" Height="30px" Width="166px" Font-Size="Large">
                        <asp:ListItem>Select Year</asp:ListItem>
                        <asp:ListItem>2012</asp:ListItem>
                        <asp:ListItem>2013</asp:ListItem>
                        <asp:ListItem>2014</asp:ListItem>
                        <asp:ListItem>2015</asp:ListItem>
                        <asp:ListItem>2016</asp:ListItem>
                        <asp:ListItem>2017</asp:ListItem>
                        <asp:ListItem>2018</asp:ListItem>
                        <asp:ListItem>2019</asp:ListItem>
                        <asp:ListItem>2020</asp:ListItem>
                        <asp:ListItem>2021</asp:ListItem>
                        <asp:ListItem>2022</asp:ListItem>
                    </asp:DropDownList>
                &nbsp;<asp:Button ID="btnSearchMonth" runat="server" BackColor="#FFFF66" ForeColor="Black" OnClick="btnSearchMonth_Click" Text="Search" Font-Size="Large" />
                </td>
                <td class="auto-style31"></td>
            </tr>
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style31" colspan="2">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" ShowGridLines="True" Width="315px">
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                    </asp:Calendar>
                </td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style31">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style34"></td>
                <td class="auto-style34"></td>
                <td class="auto-style34" colspan="2">
                </td>
                <td class="auto-style34"></td>
                <td class="auto-style34"></td>
            </tr>
            <tr>
                <td class="auto-style35"></td>
                <td class="auto-style35">
                    <asp:Label ID="lbltxtReport1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style35" colspan="2">
                    </td>
                <td class="auto-style35"></td>
                <td class="auto-style35"></td>
            </tr>
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td colspan="4" rowspan="2" class="auto-style42">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Height="109px" Width="815px">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:ImageField DataImageUrlField="image" HeaderText="Product">
                                <ControlStyle Height="90px" Width="110px" />
                                <HeaderStyle Font-Size="Large" />
                            </asp:ImageField>
                            <asp:BoundField DataField="productName" HeaderText="Name" >
                            <ControlStyle Font-Size="Large" />
                            <HeaderStyle Font-Size="Large" />
                            <ItemStyle Font-Size="Large" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    RM
                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price","{0:F}") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="Large" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    x
                                    <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="Large" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Price">
                                <ItemTemplate>
                                    &nbsp;RM
                                    <asp:Label ID="lblTotalPrice" runat="server" Text='<%# Eval("Total","{0:F}") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Font-Size="Medium" />
                                <HeaderStyle Font-Size="Large" />
                            </asp:TemplateField>
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
            </tr>
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style31">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style41"></td>
                <td class="auto-style41"></td>
                <td class="auto-style41" colspan="2">
                    </td>
                <td class="auto-style41">
                    </td>
                <td class="auto-style41"></td>
            </tr>
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style37" colspan="2">
                    <asp:Label ID="lbltxtTotalAmount" runat="server" Font-Size="X-Large" Text="Total Amount of Sportswear:"></asp:Label>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="lbltem" runat="server" Font-Size="X-Large" ForeColor="Blue"></asp:Label>
                    <asp:Label ID="lbltxtItem" runat="server" Font-Size="X-Large" Text="Items " ForeColor="Blue"></asp:Label>
                </td>
                <td class="auto-style31">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style37" colspan="2">
                    <asp:Label ID="lbltxtTotalSales" runat="server" Font-Size="X-Large" Text="Total Price of Sales:"></asp:Label>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="lblRM" runat="server" Font-Size="X-Large" Text="RM " ForeColor="Blue"></asp:Label>
                    <asp:Label ID="lblSalesAmount" runat="server" Font-Size="X-Large" ForeColor="Blue"></asp:Label>
                </td>
                <td class="auto-style31">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style36"></td>
                <td class="auto-style36"></td>
                <td class="auto-style36" colspan="2">
                    </td>
                <td class="auto-style36">
                </td>
                <td class="auto-style36"></td>
            </tr>
        </table>
    </div>
    
</asp:Content>


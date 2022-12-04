using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace FYP
{
    public partial class Report : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string dateTime, month, year;
        double price, totalPay;
        int quantity, totalItem;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //day
                Calendar1.Visible = false;
                txtDateTime.Visible = false;
                imgbtnCld.Visible = false;
                btnSearchDay.Visible = false;
                lbltxtReport1.Visible = false;

                //Month
                lbltxtMonth.Visible = false;
                ddlMonth.Visible = false;
                lbltxtYear.Visible = false;
                ddlYear.Visible = false;
                btnSearchMonth.Visible = false;

                //Calculate
                lbltxtTotalSales.Visible = false;
                lblRM.Visible = false;
                lblSalesAmount.Visible = false;
                lbltxtTotalAmount.Visible = false;
                lbltxtItem.Visible = false;
                lbltem.Visible = false;
            }


        }

        protected void imgbtnCld_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            else
            {
                Calendar1.Visible = true;
            }
            Calendar1.Attributes.Add("style", "position:absolute");
        }

        protected void btnDailyReport_Click(object sender, EventArgs e)
        {
            lbltxtReport.Text = "Daily Sales Report";
            txtDateTime.Visible = true;
            imgbtnCld.Visible = true;
            btnSearchDay.Visible = true;
            lbltxtReport1.Text = "Daily Sales Report";

            lbltxtMonth.Visible = false;
            ddlMonth.Visible = false;
            lbltxtYear.Visible = false;
            ddlYear.Visible = false;
            btnSearchMonth.Visible = false;

        }



        protected void btnMonthlyReport_Click(object sender, EventArgs e)
        {
            lbltxtReport.Text = "Monthly Sales Report";
            txtDateTime.Visible = false;
            imgbtnCld.Visible = false;
            btnSearchDay.Visible = false;
            Calendar1.Visible = false;
            lbltxtReport1.Text = "Monthly Sales Report";

            lbltxtMonth.Visible = true;
            ddlMonth.Visible = true;
            lbltxtYear.Visible = true;
            ddlYear.Visible = true;
            btnSearchMonth.Visible = true;
        }

        //Search Monthly Report
        protected void btnSearchMonth_Click(object sender, EventArgs e)
        {

            if (ddlMonth.SelectedIndex != 0 && ddlYear.SelectedIndex != 0)
            {
                month = ddlMonth.SelectedValue;
                year = ddlYear.SelectedValue;


                conn.Open();


                SqlCommand cmdSelect = new SqlCommand("select PH.image, PH.productName, PH.price, sum(PH.quantity) as Quantity, sum(PH.price * PH.quantity) as Total from PurchaseHistory PH, Payment P where PH.orderNo = P.orderNo and month(P.dateTime) = '" + month + "' and year(P.dateTime) = '" + year + "' Group by PH.productName, PH.price, PH.image", conn);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmdSelect;
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

                SqlDataReader dtr = cmdSelect.ExecuteReader();

                if (dtr.HasRows)
                {
                    while (dtr.Read())
                    {

                        price = Convert.ToDouble(dtr["Total"].ToString());
                        quantity = Convert.ToInt32(dtr["Quantity"].ToString());
                        totalPay += price;
                        totalItem += quantity;

                    }
                    lblSalesAmount.Visible = true;
                    lblSalesAmount.Text = totalPay.ToString("0.00");
                    lbltxtTotalSales.Visible = true;
                    lbltxtTotalSales.Text = "Total Price of Sales:";
                    lblRM.Visible = true;
                    lbltem.Visible = true;
                    lbltem.Text = totalItem.ToString();
                    lbltxtTotalAmount.Visible = true;
                    lbltxtItem.Visible = true;
                    lbltxtReport1.Visible = true;
                    lbltxtReport1.Text = "Monthly Sales Report";

                }
                else
                {
                    lbltxtTotalSales.Visible = true;
                    lbltxtTotalSales.Text = "No Record in that Month.";
                    lblSalesAmount.Visible = false;
                    lblRM.Visible = false;
                    lbltxtTotalAmount.Visible = false;
                    lbltxtItem.Visible = false;
                    lbltem.Visible = false;
                    lbltxtReport1.Visible = false;
                }
            }
            else
            {
                Response.Write("<script>alert (' Please Select the Month and Year');</script> ");
            }
        }


        //Search Daily Report
        protected void btnSearchDay_Click(object sender, EventArgs e)
        {

            dateTime = txtDateTime.Text;



            conn.Open();


            SqlCommand cmdSelect = new SqlCommand("select PH.image, PH.productName, PH.price, sum(PH.quantity) as Quantity, sum(PH.price * PH.quantity) as Total from PurchaseHistory PH, Payment P where PH.orderNo = P.orderNo and FORMAT(P.dateTime,'dd/MM/yyyy') = '" + dateTime + "' Group by PH.productName, PH.price, PH.image ", conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdSelect;
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            SqlDataReader dtr = cmdSelect.ExecuteReader();

            if (dtr.HasRows)
            {
                while (dtr.Read())
                {

                    price = Convert.ToDouble(dtr["Total"].ToString());
                    quantity = Convert.ToInt32(dtr["Quantity"].ToString());
                    totalPay += price;
                    totalItem += quantity;

                }
                lblSalesAmount.Visible = true;
                lblSalesAmount.Text = totalPay.ToString("0.00");
                lbltxtTotalSales.Visible = true;
                lbltxtTotalSales.Text = "Total Price of Sales:";
                lblRM.Visible = true;
                lbltem.Visible = true;
                lbltem.Text = totalItem.ToString();
                lbltxtTotalAmount.Visible = true;
                lbltxtItem.Visible = true;
                lbltxtReport1.Visible = true;
                lbltxtReport1.Text = "Daily Sales Report";

            }
            else
            {
                lbltxtTotalSales.Visible = true;
                lbltxtTotalSales.Text = "No Record on that day.";
                lblSalesAmount.Visible = false;
                lblRM.Visible = false;
                lbltxtTotalAmount.Visible = false;
                lbltxtItem.Visible = false;
                lbltem.Visible = false;
                lbltxtReport1.Visible = false;

            }


        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDateTime.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
            Calendar1.Visible = false;
        }
    }
}
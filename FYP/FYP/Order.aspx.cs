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
    public partial class Order : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


        double discountAmount, totalPrice, finalTotalPrice, discountVoucher;

        protected void btnUse_Click(object sender, EventArgs e)
        {



            if (radDiscount.SelectedIndex != -1)
            {
                lbltxtDA.Visible = true;
                discountVoucher = Convert.ToDouble(radDiscount.SelectedItem.Text.ToString());
                totalPrice = Convert.ToDouble(lblTotalPrice.Text.ToString());
                discountAmount = discountVoucher / 100 * totalPrice;
                finalTotalPrice = totalPrice - discountAmount;


                lblTotalPrice.Text = finalTotalPrice.ToString("0.00");
                lblDiscAmt.Text = discountAmount.ToString("0.00");
                Session["finalTotalPrice"] = finalTotalPrice;
                Session["discountVoucher"] = discountVoucher;
                Session["discountAmount"] = discountAmount;
            }
            else
            {
                Session["finalTotalPrice"] = lblTotalPrice.Text.ToString();
                Session["discountVoucher"] = discountVoucher;
                lblDiscAmt.Text = "not selected";
            }


        }







        protected void Page_Load(object sender, EventArgs e)
        {
            GVbind();
            if (!this.IsPostBack)
            {
                conn.Open();

                SqlCommand cmdSelect = new SqlCommand("select discountVoucher from DiscountVoucher where userId = '" + Session["userId"] + "'", conn);

                cmdSelect.CommandType = CommandType.Text;

                radDiscount.DataSource = cmdSelect.ExecuteReader();
                radDiscount.DataTextField = "discountVoucher";
                radDiscount.DataValueField = "discountVoucher";
                radDiscount.DataBind();
                conn.Close();

            }

            if (checkDiscountVoucher() == false)
            {
                lblmessage.Visible = false;
                btnUse.Visible = false;
                lbltxtDA.Visible = false;
                lblDiscAmt.Visible = false;

            }
            else if (checkDiscountVoucher() == true)
            {
                lbltxtDA.Visible = false;

            }
        }





        protected void GVbind()
        {
            string orderNo;
            double Price;
            double totalPrice = 0;
            int count = 0;

            conn.Open();


            SqlCommand cmdSelect = new SqlCommand("select * from OrderTable where userId = '" + Session["userId"] + "'", conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdSelect;
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            SqlDataReader dtrOrder = cmdSelect.ExecuteReader();

            if (dtrOrder.HasRows)
            {
                while (dtrOrder.Read())
                {

                    Price = Convert.ToDouble(dtrOrder["totalPrice"].ToString());
                    totalPrice += Price;
                    ++count;
                    orderNo = dtrOrder["orderNo"].ToString();
                    lblOrderNo.Text = orderNo.ToString();
                }
            }

            lblTotalPrice.Text = totalPrice.ToString("0.00");
            lblItem.Text = count.ToString();


            conn.Close();

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            deleteCart();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            conn.Open();
            SqlCommand com = new SqlCommand("delete from OrderTable where orderId = '" + id + "' ", conn);
            int t = com.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert (' One order was delete successfully');</script> ");
                conn.Close();
                GVbind();
            }
            else
            {
                Response.Write("<script>alert (' Fill to Delete. ');</script> ");
            }
        }

        public void deleteCart()
        {

            conn.Open();
            SqlCommand com = new SqlCommand("delete  from OrderTable where userId = '" + Session["userId"] + "'", conn);
            com.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("cart.aspx");
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {

            Response.Redirect("payment.aspx");
        }

        public Boolean checkDiscountVoucher()
        {

            conn.Open();
            SqlCommand cmdSelect = new SqlCommand("select * from DiscountVoucher where userId = '" + Session["userId"] + "'", conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdSelect;
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {

                return true;
            }
            else
            {
                return false;

            }



        }
    }
}
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
    public partial class Receipt : System.Web.UI.Page
    {
        string userId;
        double totalAmount;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            getReceipt();
        }



        protected void getReceipt()
        {

            if (Session["userId"] != null)
            {



                conn.Open();


                SqlCommand cmdSelect = new SqlCommand("select * from payment p, Register R where P.userId = R.userId and P.userId = '" + Session["userId"] + "'", conn);
                SqlDataReader dtrPyt = cmdSelect.ExecuteReader();

                if (dtrPyt.HasRows)
                {
                    while (dtrPyt.Read())
                    {

                        lbldate.Text = dtrPyt["dateTime"].ToString();
                        lblName.Text = dtrPyt["userName"].ToString();
                        lblpaymentNo.Text = dtrPyt["orderNo"].ToString();
                        lblPayMethod.Text = dtrPyt["paymentMethod"].ToString();
                        lblPayType.Text = dtrPyt["paymentType"].ToString();
                        lblNum.Text = dtrPyt["payNumber"].ToString();
                        lblItem.Text = dtrPyt["totalItem"].ToString();
                        totalAmount = Convert.ToDouble(dtrPyt["totalAmount"].ToString());
                    }
                }
                lblTotalAmount.Text = totalAmount.ToString("0.00");
                conn.Close();
            }



        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx");
        }
    }

       
}
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
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        string sportswearId, sportswearName, price, category, desc, size, stock, image, customerName, totalPrice, userId, orderNo;

        string cartId, sportwearName;
        int quantity;

        int stockStatus;
        protected void Page_Load(object sender, EventArgs e)
        {

            GVbind();
        }

        protected void GVbind()
        {


            if (Session["userId"] != null)
            {


                double Price;
                double totalPrice = 0;
                int count = 0;

                conn.Open();


                SqlCommand cmdSelect = new SqlCommand("select * from Cart where userId = '" + Session["userId"] + "'", conn);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmdSelect;
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

                SqlDataReader dtrCart = cmdSelect.ExecuteReader();

                if (dtrCart.HasRows)
                {
                    while (dtrCart.Read())
                    {


                        Price = Convert.ToDouble(dtrCart["totalPrice"].ToString());

                        totalPrice += Price;
                        ++count;
                    }

                }

                lblTotalPrice.Text = totalPrice.ToString();
                lblItem.Text = count.ToString();

                conn.Close();

            }
        }



        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            conn.Open();
            SqlCommand com = new SqlCommand("delete from Cart where cartId = '" + id + "' ", conn);
            int t = com.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert (' Cart was delete successfully');</script> ");
                conn.Close();
                GVbind();
            }
            else
            {
                Response.Write("<script>alert (' fill delete ');</script> ");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("ModifyCart.aspx?cartId=" + GridView1.SelectedRow.Cells[0].Text);
        }


        private void GenerateOrderId()
        {
            char order = 'O';
            string currentYear = DateTime.Now.Year.ToString();
            conn.Open();
            SqlCommand cmd = new SqlCommand("Select Count(paymentID) from payment", conn);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            count++;
            orderNo = order + currentYear + count.ToString("D5");

        }
        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            GenerateOrderId();


            conn.Open();
            SqlCommand cmdSelect = new SqlCommand("select * from Cart where userId = '" + Session["userId"] + "'", conn);
            SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

            if (dtrInfo.HasRows)
            {
                while (dtrInfo.Read())
                {
                    cartId = dtrInfo["cartId"].ToString();
                    sportwearName = dtrInfo["cartName"].ToString();
                    price = dtrInfo["cartPrice"].ToString();
                    image = dtrInfo["cartImg"].ToString();
                    totalPrice = dtrInfo["totalPrice"].ToString();
                    quantity = Convert.ToInt32(dtrInfo["quantity"].ToString());
                    userId = Session["userId"].ToString();

                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    con.Open();
                    String strInsert = "insert into OrderTable(orderNo,cartId,productName,price,quantity,totalPrice,image,userId) Values (@OrderNo,@CardId,@ProductName,@Price,@Quantity,@TotalPrice,@Image,@UserId) ";
                    SqlCommand cmdInsert = new SqlCommand(strInsert, con);


                    cmdInsert.Parameters.AddWithValue("@OrderNo", orderNo);
                    cmdInsert.Parameters.AddWithValue("@CardId", cartId);
                    cmdInsert.Parameters.AddWithValue("@ProductName", sportwearName);
                    cmdInsert.Parameters.AddWithValue("@Price", price);
                    cmdInsert.Parameters.AddWithValue("@Quantity", quantity);
                    cmdInsert.Parameters.AddWithValue("@TotalPrice", totalPrice);
                    cmdInsert.Parameters.AddWithValue("@Image", image);
                    cmdInsert.Parameters.AddWithValue("@UserId", userId);

                    cmdInsert.ExecuteNonQuery();
                    con.Close();


                }
            }
            conn.Close();

            Response.Redirect("Order.aspx");
        }
    }
}
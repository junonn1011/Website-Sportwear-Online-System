using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.Net;
using System.Net.Mail;

namespace FYP
{
    public partial class WishList : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string sportswearId, sportswearName, price, category, desc, size, stock, image, customerName, totalPrice, userId;
        int stockStatus;

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            conn.Open();
            SqlCommand com = new SqlCommand("delete from WishList where WishId = '" + id + "' ", conn);
            int t = com.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert (' Product was delete in Wish List successfully');</script> ");
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
            int wishId = Convert.ToInt32(GridView1.DataKeys[GridView1.SelectedIndex].Value);

            conn.Open();
            int quantity = 1;

            String strSelect = "Select * from WishList where WishId= '" + wishId + "'";
            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
            SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

            if (dtrInfo.HasRows)
            {
                while (dtrInfo.Read())
                {
                    sportswearName = dtrInfo["wishName"].ToString();
                    price = dtrInfo["wishPrice"].ToString();
                    desc = dtrInfo["wishDesc"].ToString();
                    category = dtrInfo["wishCategory"].ToString();
                    stock = dtrInfo["wishStock"].ToString();
                    image = dtrInfo["wishImg"].ToString();
                    size = dtrInfo["size"].ToString();
                    sportswearId = dtrInfo["productId"].ToString();
                    userId = dtrInfo["userId"].ToString();
                    totalPrice = dtrInfo["wishPrice"].ToString();
                    stockStatus = Convert.ToInt32(dtrInfo["stockStatus"].ToString());

                }

            }
            conn.Close();

            conn.Open();
            SqlCommand select = new SqlCommand("select * from Cart where productId = '" + sportswearId + "' and userId = '" + Session["userId"] + "'", conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = select;
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {

                Response.Write("<script>alert ('This Sportswear Already In Your Cart!!');</script> ");
            }
            else
            {

                if (stockStatus >= 1)
                {
                    conn.Open();
                    String strInsert = "insert into Cart(cartName, cartPrice, cartDesc, cartCategory, cartStock, cartImg, size, productId, userId, quantity,totalPrice) Values (@SportswearName,@SportswearPrice,@SportswearDesc,@SportswearCategory,@SportswearStock,@SportswearImg,@SportswearSize,@SportswearID,@UserId,@Quantity,@TotalPrice)";
                    SqlCommand cmdInsertCart = new SqlCommand(strInsert, conn);


                    cmdInsertCart.Parameters.AddWithValue("@SportswearName", sportswearName);
                    cmdInsertCart.Parameters.AddWithValue("@SportswearPrice", price);
                    cmdInsertCart.Parameters.AddWithValue("@SportswearDesc", desc);
                    cmdInsertCart.Parameters.AddWithValue("@SportswearCategory", category);
                    cmdInsertCart.Parameters.AddWithValue("@SportswearStock", stock);
                    cmdInsertCart.Parameters.AddWithValue("@SportswearImg", image);
                    cmdInsertCart.Parameters.AddWithValue("@SportswearSize", size);
                    cmdInsertCart.Parameters.AddWithValue("@SportswearId", sportswearId);
                    cmdInsertCart.Parameters.AddWithValue("@UserId", userId);
                    cmdInsertCart.Parameters.AddWithValue("@Quantity", quantity);
                    cmdInsertCart.Parameters.AddWithValue("@TotalPrice", totalPrice);



                    int insertCartStatus = cmdInsertCart.ExecuteNonQuery();
                    if (insertCartStatus > 0)
                    {

                        Response.Write("<script>alert ('Sportswear added in cart successfully');</script> ");

                    }
                    else
                    {
                        Response.Write("<script>alert ('Fill Insert');</script> ");
                    }

                    conn.Close();

                }
                else if (stockStatus <= 0)
                {
                    Response.Write("<script>alert ('This product are no stock currently. Can not add to your cart.');</script>");
                }

            }

        }



        protected void Page_Load(object sender, EventArgs e)
        {
            GVbind();
        }

        protected void GVbind()
        {
            if (Session["userId"] != null)
            {
                conn.Open();


                SqlCommand cmdSelect = new SqlCommand("select * from WishList where userId = '" + Session["userId"] + "'", conn);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmdSelect;
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

                conn.Close();




            }
        }
    }
}
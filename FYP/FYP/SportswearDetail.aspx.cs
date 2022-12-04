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
    public partial class SportswearDetail : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string sportswearId, sportswearName, price, category, desc, size, image, customerName, totalPrice, userId;
        double prices;


        int stockStatus, stock;



        protected void Page_Load(object sender, EventArgs e)
        {
            showProductDetail();
            wishImageChanged();
            cartImageChanged();
        }

        //showSportswearDetail
        public void showProductDetail()
        {
            if (Request.QueryString["goToSportswearDetail"] != null)
            {
                conn.Open();
                lblSportswearId.Text = Request.QueryString["goToSportswearDetail"].ToString();

                String strSelect = "Select * from Product where productId = '" + lblSportswearId.Text + "'";
                SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
                SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

                if (dtrInfo.HasRows)
                {
                    while (dtrInfo.Read())
                    {

                        lblName.Text = dtrInfo["productName"].ToString();
                        prices = Convert.ToDouble(dtrInfo["productPrice"].ToString());
                        lblCategory.Text = dtrInfo["productCategory"].ToString();
                        lblDesc.Text = dtrInfo["productDescription"].ToString();
                        lblSize.Text = dtrInfo["productSize"].ToString();
                        lblStock.Text = dtrInfo["productStock"].ToString();
                        ImgSportswear.ImageUrl = dtrInfo["productImg"].ToString();

                    }
                    

                    lblPrice.Text = prices.ToString("0.00");
                    conn.Close();
                }

            }
        }

        protected void imgBtnWish_Click(object sender, ImageClickEventArgs e)
        {
            if (checkWishList() == true)
            {





                if (Session["userId"] != null)
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    con.Open();

                    stock = Convert.ToInt32(lblStock.Text.ToString());
                    if (stock >= 1)
                    {
                        stockStatus = 1;

                    }
                    else if (stock <= 0)
                    {
                        stockStatus = 0;
                    }


                    sportswearId = lblSportswearId.Text.ToString();
                    sportswearName = lblName.Text.ToString();
                    price = lblPrice.Text.ToString();
                    desc = lblDesc.Text.ToString();
                    category = lblCategory.Text.ToString();
                    size = lblSize.Text.ToString();

                    image = ImgSportswear.ImageUrl;
                    userId = Session["userId"].ToString();


                    conn.Open();
                    String strInsert = "insert into WishList (wishName, wishPrice, wishDesc, wishCategory, wishStock, wishImg, size, productId, userId, stockStatus) Values (@SportswearName,@SportswearPrice,@SportswearDesc,@SportswearCategory,@SportswearStock,@SportswearImg,@SportswearSize,@SportswearID,@UserId,@StockStatus)";
                    SqlCommand cmdInsertWish = new SqlCommand(strInsert, conn);


                    cmdInsertWish.Parameters.AddWithValue("@SportswearName", sportswearName);
                    cmdInsertWish.Parameters.AddWithValue("@SportswearPrice", price);
                    cmdInsertWish.Parameters.AddWithValue("@SportswearDesc", desc);
                    cmdInsertWish.Parameters.AddWithValue("@SportswearCategory", category);
                    cmdInsertWish.Parameters.AddWithValue("@SportswearStock", stock);
                    cmdInsertWish.Parameters.AddWithValue("@SportswearImg", image);
                    cmdInsertWish.Parameters.AddWithValue("@SportswearSize", size);
                    cmdInsertWish.Parameters.AddWithValue("@SportswearID", sportswearId);
                    cmdInsertWish.Parameters.AddWithValue("@UserId", userId);
                    cmdInsertWish.Parameters.AddWithValue("@StockStatus", stockStatus);

                    int insertWishStatus = cmdInsertWish.ExecuteNonQuery();
                    if (insertWishStatus > 0)
                    {

                        Response.Write("<script>alert ('Sportswear added in Wish List successfully');</script> ");
                        imgBtnWish.ImageUrl = "Image/love.png";
                    }
                    else
                    {
                        Response.Write("<script>alert ('fill insert');</script> ");
                    }

                    conn.Close();
                }
                else
                {
                    Response.Write("<script>alert ('Must be login to do an action!!');</script> ");
                }
            }
            else
            {
                Response.Write("<script>alert ('This Sportswear already in Wish List!!');</script> ");
            }
        }


        protected void imgBtnCart_Click(object sender, ImageClickEventArgs e)

        {
            if (checkCart() == true)
            {

                int quantity = 1;

                if (Session["userId"] != null)
                {

                    stock = Convert.ToInt32(lblStock.Text.ToString());
                    if (stock >= 1)
                    {
                        sportswearId = lblSportswearId.Text.ToString();
                        sportswearName = lblName.Text.ToString();
                        price = lblPrice.Text.ToString();
                        desc = lblDesc.Text.ToString();
                        category = lblCategory.Text.ToString();
                        size = lblSize.Text.ToString();

                        image = ImgSportswear.ImageUrl;
                        totalPrice = lblPrice.Text.ToString();
                        userId = Session["userId"].ToString();


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
                            imgBtnCart.ImageUrl = "Image/cartIcon.png";
                        }
                        else
                        {
                            Response.Write("<script>alert ('Fill Insert');</script> ");
                        }

                        conn.Close();

                    }
                    else if (stock <= 0)
                    {
                        Response.Write("<script>alert ('This product are no stock currently. Can not add to your cart.');</script>");
                    }

                }
                else
                {
                    Response.Write("<script>alert ('Must be login to do an action!!');</script> ");
                }
            }
            else
            {
                Response.Write("<script>alert ('This Sportswear Already In Your Cart!!');</script> ");
            }
        }

        public Boolean checkWishList()
        {

            conn.Open();
            SqlCommand cmdSelect = new SqlCommand("select * from WishList where productId = '" + Request.QueryString["goToSportswearDetail"].ToString() + "' and userId = '" + Session["userId"] + "'", conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdSelect;
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                imgBtnWish.ImageUrl = "Image/love.png";
                return false;
            }
            else
            {
                return true;

            }



        }

        public Boolean checkCart()
        {

            conn.Open();
            SqlCommand cmdSelect = new SqlCommand("select * from Cart where productId = '" + Request.QueryString["goToSportswearDetail"].ToString() + "' and userId = '" + Session["userId"] + "'", conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdSelect;
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                imgBtnCart.ImageUrl = "Image/cartIcon.png";
                return false;
            }
            else
            {
                return true;

            }

        }

        public void wishImageChanged()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from WishList where productId = '" + Request.QueryString["goToSportswearDetail"].ToString() + "' and userId = '" + Session["userId"] + "'", conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                imgBtnWish.ImageUrl = "Image/love.png";

            }
        }

        public void cartImageChanged()
        {
            conn.Open();
            SqlCommand cmdSelect = new SqlCommand("select * from Cart where productId = '" + Request.QueryString["goToSportswearDetail"].ToString() + "' and userId = '" + Session["userId"] + "'", conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdSelect;
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                imgBtnCart.ImageUrl = "Image/cartIcon.png";

            }
        }
    }
}
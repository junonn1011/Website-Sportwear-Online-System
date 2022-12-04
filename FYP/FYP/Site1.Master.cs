using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;

namespace FYP
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string strPosition = "";
        
        

        protected void Page_Load(object sender, EventArgs e)
        {
           
            con.Open();
            SqlCommand cmdSelect = new SqlCommand("select * from Register where userId = '" + Session["userId"] + "' ", con);


            SqlDataReader dtr = cmdSelect.ExecuteReader();

            if (dtr.HasRows)
            {
               while (dtr.Read())
               {
                    strPosition = dtr["role"].ToString();
               }

            }
            if (strPosition == "Customer")
            {
                
                btnAdminProduct.Visible = false;
                btnUpload.Visible = false;
                btnReport.Visible = false;
                btnHomePage.Visible = true;
                btnPurchase.Visible = true;
                btnSignUp.Visible = true;
                btnLogin.Visible = false;
                btnLogOut.Visible = true;
                imgBtnWishList.Visible = true;
                imgBtnCart.Visible = true;
                btnProfile.Visible = true;
            }
            else if (strPosition == "Admin")
            {
                
                btnAdminProduct.Visible = true;
                btnUpload.Visible = true;
                btnReport.Visible = true;
                btnHomePage.Visible = false;
                btnPurchase.Visible = false;
                btnSignUp.Visible = true;
                btnLogin.Visible = false;
                btnLogOut.Visible = true;
                imgBtnWishList.Visible = false;
                imgBtnCart.Visible = false;

                btnProfile.Visible = true;
            }
            else if (strPosition == "")
            {
                
                btnAdminProduct.Visible = false;
                btnUpload.Visible = false;
                btnReport.Visible = false;
                btnHomePage.Visible = true;
                btnPurchase.Visible = false;
                btnSignUp.Visible = true;
                btnLogin.Visible = true;
                btnLogOut.Visible = false;
                imgBtnWishList.Visible = false;
                imgBtnCart.Visible = false;

                btnProfile.Visible = false;
            }
                
           con.Close();
            
        }

        protected void btnSignUp_Click1(object sender, EventArgs e)
        {
            
            Response.Redirect("Register.aspx");
        }

        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnWishList_Click(object sender, EventArgs e)
        {
            Response.Redirect("WishList.aspx");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void ImgBtnWishList_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("WishList.aspx");
        }

        protected void imgBtnCart_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void btnPurchase_Click(object sender, EventArgs e)
        {
            Response.Redirect("PurchaseHistory.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx");
        }

        protected void btnAdminProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminProduct.aspx");
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Product.aspx");
            
        }

        protected void btnReport_Click(object sender, EventArgs e)
        {

            Response.Redirect("Report.aspx");
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("PersonalProfile.aspx");
        }

        [WebMethod]
        public static string GetSessionValue()
        {
            return HttpContext.Current.Session["Getvalue"].ToString();
        }

        protected void btnChat_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ChatBot/index.html");
        }
    }
}
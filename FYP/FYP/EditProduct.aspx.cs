using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Text;
using System.Net;
using System.Net.Mail;

namespace FYP
{
    public partial class EditProduct : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string email, userId, firstName, lastName,productName;

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            conn.Open();
            
            SqlCommand cmd = new SqlCommand("delete from Product where productId = '" + lblSportswearId.Text + "' ", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("AdminProduct.aspx");




            conn.Open();
            SqlCommand cmdCountPopular = new SqlCommand("select * from PopularProduct where productId = '" + lblSportswearId.Text + "' ", conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdCountPopular;
            DataSet ds = new DataSet();
            da.Fill(ds);


            if (ds.Tables[0].Rows.Count > 0)
            {
                 SqlCommand cmdDeletePopular = new SqlCommand("delete from PopularProduct where productId = '" + lblSportswearId.Text + "' ", conn);

                cmdDeletePopular.ExecuteNonQuery();

            }
            conn.Close();

          

            

        }

        protected void btnImage_Click(object sender, EventArgs e)
        {
            if(btnImage.Text == "Change")
            {
                FileUpload1.Visible = true;
                btnImage.Text = "Save";
                btnDelete.Visible = false;
                btnCancel.Visible = true;
                btnImage.CausesValidation = true;
                RequiredFieldValidator6.Enabled = true;
            }
            else if (btnImage.Text == "Save")
            {

                FileUpload1.SaveAs(Server.MapPath("~/productImage/") + Path.GetFileName(FileUpload1.FileName));
                String imageLink = "productImage/" + Path.GetFileName(FileUpload1.FileName);
                SqlCommand cmd = new SqlCommand("update Product set  productImg = '" + imageLink + "' where productId ='" + lblSportswearId.Text + "' ", conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                FileUpload1.Visible = false;
                showProductDetail();
                btnImage.Text = "Change";
                btnImage.CausesValidation = false;
                RequiredFieldValidator6.Enabled = false;

                conn.Open();
                SqlCommand cmdCountPopular = new SqlCommand("select * from PopularProduct where productId = '" + lblSportswearId.Text + "' ", conn);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmdCountPopular;
                DataSet ds = new DataSet();
                da.Fill(ds);


                if (ds.Tables[0].Rows.Count > 0)
                {
                    SqlCommand cmdUpdatePopular = new SqlCommand("update PopularProduct set popularImg = '" + imageLink + "'  where productId ='" + lblSportswearId.Text + "'", conn);
                    cmdUpdatePopular.ExecuteNonQuery();

                }
                conn.Close();

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(txtStock.Text != "")
            {
                int stock = Convert.ToInt32(txtStock.Text);

                int currentStock = Convert.ToInt32(lblStock.Text);

                int updatedStock = stock + currentStock;



                SqlCommand cmd = new SqlCommand("update Product set productStock='" + updatedStock + "' where productId ='" + lblSportswearId.Text + "' ", conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                showProductDetail();
                txtStock.Text = "";
            }
            

        }

        protected void btnPopular_Click(object sender, EventArgs e)
        {
            if (btnPopular.Text != "Remove from popular")
            {
                string sportswearName = txtName.Text;
                string productId = Request.QueryString["goToEditProduct"].ToString();


                string image = ImgSportswear.ImageUrl;
                double price = Convert.ToDouble(txtPrice.Text);


                conn.Open();
                SqlCommand cmd = new SqlCommand("Insert into PopularProduct values('" + sportswearName + "', '" + price + "', '" + image + "', '" + productId + "') ", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                btnPopular.Text = "Remove from popular";
            }
            else
            {
                conn.Open();
                
                SqlCommand cmd = new SqlCommand("delete from PopularProduct where productId = '" + lblSportswearId.Text + "' ", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                btnPopular.Text = "Add to Popular";
            }
        }


        public void popularChanged()
        {
            conn.Open();
            SqlCommand cmdSelect = new SqlCommand("select * from PopularProduct where productId = '" + Request.QueryString["goToEditProduct"].ToString() + "' ", conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdSelect;
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                btnPopular.Text = "Remove from popular";

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showProductDetail();
                
            }
            popularChanged();

        }


        //showSportswearDetail
        public void showProductDetail()
        {
            if (Request.QueryString["goToEditProduct"] != null)
            {

                
                conn.Open();
                lblSportswearId.Text = Request.QueryString["goToEditProduct"].ToString();
                
                String strSelect = "Select * from Product where productId = '" + lblSportswearId.Text + "'";
                SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
                SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

                if (dtrInfo.HasRows)
                {
                    while (dtrInfo.Read())
                    {

                        txtName.Text = dtrInfo["productName"].ToString();
                        txtPrice.Text = dtrInfo["productPrice"].ToString();
                        ddlCategory.Text = dtrInfo["productCategory"].ToString();
                        txtDescription.Text = dtrInfo["productDescription"].ToString();
                        ddlSize.Text = dtrInfo["productSize"].ToString();
                        lblStock.Text = dtrInfo["productStock"].ToString();
                        ImgSportswear.ImageUrl = dtrInfo["productImg"].ToString();

                        

                    }
                    conn.Close();
                }

            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (btnEdit.Text == "Edit")
            {
                //txtName.Enabled = true;
                txtPrice.Enabled = true;
                txtDescription.Enabled = true;
                ddlCategory.Enabled = true;
                ddlSize.Enabled = true;
                btnAdd.Visible = true;
                txtStock.Enabled = true;

                btnEdit.Text = "confirm";
                btnDelete.Visible = false;
                btnCancel.Visible = true;
            }
            else if (btnEdit.Text == "confirm")
            {
                string name = txtName.Text;
                string price = txtPrice.Text;
                string description = txtDescription.Text;
                string category = ddlCategory.SelectedItem.ToString();
                string size = ddlSize.SelectedItem.ToString();
                int stock = Convert.ToInt32(lblStock.Text);


                
                SqlCommand cmd = new SqlCommand("update Product set productName='" + name + "', productPrice='" + price + "', " +
                    "productDescription ='" + description + "', productStock='" + stock + "'," +
                    " productSize='" + size + "', productCategory='" + category + "'" +
                    " where productId ='" + lblSportswearId.Text + "' ", conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();


                conn.Open();
                SqlCommand cmdCountPopular = new SqlCommand("select * from PopularProduct where productId = '" + lblSportswearId.Text + "' ", conn);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmdCountPopular;
                DataSet ds = new DataSet();
                da.Fill(ds);
                

                if (ds.Tables[0].Rows.Count > 0)
                {
                    SqlCommand cmdUpdatePopular = new SqlCommand("update PopularProduct set popularPrice = '" + price + "'  where productId ='" + lblSportswearId.Text + "'", conn);
                    cmdUpdatePopular.ExecuteNonQuery();

                }
                conn.Close();
                //send the restock notification to the customer that add the product that are no stock before
                if (stock >= 1)
                {
                    conn.Open();


                    SqlCommand cmdSelect = new SqlCommand("select * from WishList W, Product P, Register R  where P.productId = W.productId and W.userId = R.userId and P.productId = '" +
                                                            lblSportswearId.Text + "' and W.stockStatus = '0' ", conn);
                    SqlDataReader dtr = cmdSelect.ExecuteReader();

                    if (dtr.HasRows)
                    {
                        while (dtr.Read())
                        {

                            userId = dtr["userId"].ToString();
                            email = dtr["emailAddress"].ToString();
                            firstName = dtr["firstName"].ToString();
                            lastName = dtr["lastName"].ToString();
                            productName = dtr["productName"].ToString();

                            StringBuilder sb = new StringBuilder();
                            sb.AppendLine("Hello, " + firstName + " " + lastName);
                            sb.AppendLine("The product Name : " + productName + " has been restock. ");
                            sb.AppendLine("");
                            sb.AppendLine("You can order Now !!");

                            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                            client.EnableSsl = true;
                            client.DeliveryMethod = SmtpDeliveryMethod.Network;
                            client.UseDefaultCredentials = false;
                            client.Credentials = new NetworkCredential("lyejo-wm19@student.tarc.edu.my", "ahqclfnrnvcjfwvn");
                            MailMessage msg = new MailMessage();
                            msg.To.Add(email);
                            msg.From = new MailAddress("DLM Sportwear<facilityreserve123@gmail.com>");
                            msg.Subject = "Restock Notification";
                            msg.Body = sb.ToString();
                            client.Send(msg);

                            //modify the stock status and theh stock at the wishlist of custommer since the product haven been restock
                            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                             con.Open();
                             String strModify = "update W set W.stockStatus='1', W.wishStock = '" + stock + "' from WishList W, Product P, Register R  where P.productId = W.productId and W.userId = R.userId and R.userId = '" 
                                                + userId + "' and P.productId = '" + lblSportswearId.Text + "' and W.stockStatus = '0' ";
                             SqlCommand cmdInsert = new SqlCommand(strModify, con);

                             cmdInsert.ExecuteNonQuery();
                             con.Close();


                        }
                    }
                    conn.Close();
                }
                btnEdit.Text = "Edit";
                btnDelete.Visible = true;
                txtName.Enabled = false;
                txtPrice.Enabled = false;
                txtDescription.Enabled = false;
                ddlCategory.Enabled = false;
                ddlSize.Enabled = false;
                btnAdd.Visible = false;
                txtStock.Enabled = false;

                btnCancel.Visible = false;
                showProductDetail();


            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnEdit.Text = "Edit";
            btnDelete.Visible = true;
            txtName.Enabled = false;
            txtPrice.Enabled = false;
            txtDescription.Enabled = false;
            ddlCategory.Enabled = false;
            ddlSize.Enabled = false;
            btnImage.CausesValidation = false;
            RequiredFieldValidator6.Enabled = false;
            btnAdd.Visible = false;
            txtStock.Enabled = false;

            btnCancel.Visible = false;
            FileUpload1.Visible = false;
            btnImage.Text = "Change";
        }
    }
}
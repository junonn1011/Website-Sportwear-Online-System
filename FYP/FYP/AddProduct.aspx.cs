using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.IO;

namespace FYP
{
    public partial class AddProduct : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            Boolean checkProductName = true;

            conn.Open();

            string chkUser = "select count(*) from Product Where productName =  '" + txtProductName.Text + "' ";
            SqlCommand com = new SqlCommand(chkUser, conn);
            com.Parameters.AddWithValue("@productId", txtProductName.Text);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

            conn.Close();


            if (temp == 1)
            {
                conn.Open();
                checkProductName = true;
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Product Name is Used !!');", true);
            }
            else
            {
                checkProductName = false;
            }
            conn.Close();


            if (checkProductName == false)
            {



                lblSuccesfully.Text = "Upload Successfully";
                conn.Open();
                double price = Convert.ToDouble(txtPrice.Text);
                FileUpload1.SaveAs(Server.MapPath("~/productImage/") + Path.GetFileName(FileUpload1.FileName));
                String imageLink = "productImage/" + Path.GetFileName(FileUpload1.FileName);
                SqlCommand cmd = new SqlCommand("Insert into Product values('" + txtProductName.Text + "', '" + price + "', '" + imageLink + "', '" + txtDescription.Text + "', '" + ddlSize.SelectedItem.ToString() + "', '" + txtStock.Text + "', '" + ddlCategory.SelectedItem.ToString() + "') ", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                clearTextBox();

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Product Name is Used !!');", true);

            }
        }

        private void clearTextBox()
        {

            txtProductName.Text = "";
            txtDescription.Text = "";
            txtPrice.Text = "";
            txtStock.Text = "";
            ddlCategory.SelectedIndex = 0;
            ddlSize.SelectedIndex = 0;


        }

        protected void btnBack_Click(object sender, EventArgs e)
        {

            Response.Redirect("AdminProduct.aspx");


        }

        
    }
}
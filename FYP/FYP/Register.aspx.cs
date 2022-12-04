using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace FYP
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            RangeValidator1.MinimumValue = DateTime.Now.AddYears(-60).ToShortDateString();
            RangeValidator1.MaximumValue = DateTime.Now.AddYears(-18).ToShortDateString();
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
           

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            Boolean checkId = true;

            conn.Open();

            string chkUser = "select count(*) from Register Where username =  '" + txtUsername.Text + "' ";
            SqlCommand com = new SqlCommand(chkUser, conn);
            com.Parameters.AddWithValue("@userId", txtUsername.Text);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

            conn.Close();

            if (temp == 1)
            {
                conn.Open();
                checkId = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('User Name is Used !!');", true);
            }
            else
            {
                checkId = false;
            }
            conn.Close();

            if (checkId == false)
            {
                conn.Open();
                txtDOB.Text = System.DateTime.Now.Date.ToString("dd/MM/yyyy");

                string strusername = txtUsername.Text;
                string strPass = txtPassword.Text;
                string strConfirmPassword = txtConfirmPassword.Text;
                string strFirstName = txtFirstName.Text;
                string strLastName = txtLastName.Text;
                string strDate = txtDOB.Text;
                string strPosition = ddlPosition.SelectedItem.ToString();
                string strEmail = txtEmail.Text;
                string strnumber = txtNumber.Text;


                SqlCommand cmd = new SqlCommand("insert into register values('" + strusername + "', '" + strPass + "', '" + strConfirmPassword + "', '" + strFirstName + "',  '" + strLastName + "', '" + strDate + "', '" + strEmail + "', '" + strnumber + "','" + strPosition + "')", conn);
                cmd.ExecuteNonQuery();

                conn.Close();

                Response.Write("<script>alert ('Register Successfully!!');</script> ");

                Response.Redirect("Login.aspx");
            }
            else
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('User Name is Used !!');", true);
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string enterPass = txtPassword.Text;

            txtPassword.TextMode = TextBoxMode.SingleLine;

            txtPassword.Text = enterPass;
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            string enterPass = txtConfirmPassword.Text;

            txtConfirmPassword.TextMode = TextBoxMode.SingleLine;



            txtConfirmPassword.Text = enterPass;
        }
    }
}
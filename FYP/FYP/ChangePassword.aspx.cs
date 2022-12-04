using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
namespace FYP
{
    public partial class ChangePassword : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("PersonalProfile.aspx");
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

        protected void btnChange_Click(object sender, EventArgs e)
        {
            conn.Open();

            SqlCommand cmd = new SqlCommand("update Register set  password = '" + txtPassword.Text + "', confirmPassword ='" + txtConfirmPassword.Text + "' where userId ='" + Session["userId"] + "' ", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("PersonalProfile.aspx");
            Session.Remove("Change");
        }
    }
}
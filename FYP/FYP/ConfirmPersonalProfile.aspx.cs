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
    public partial class ConfirmPersonalProfile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            conn.Open();
            string strName = Session["userId"].ToString();
            string strPass = txtPass.Text.Trim();

            string chkUser = "select count(*) from register Where userId =  '" + Session["userId"] + "' ";
            SqlCommand com = new SqlCommand(chkUser, conn);
            //com.Parameters.AddWithValue("@userId", strName);
            com.Parameters.AddWithValue("@password", strPass);

            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

            conn.Close();

            string change = Session["change"].ToString();

            if (temp == 1)
            {
                
                conn.Open();
                string chkPassword = "select password from register Where userId =  '" + Session["userId"] + "'";
                

               

                SqlCommand comPassword = new SqlCommand(chkPassword, conn);
                string password = comPassword.ExecuteScalar().ToString().Replace(" ", "");
                conn.Close();
                if (password == strPass)
                {
                    if (change != "Change")
                    {
                        conn.Open();

                        SqlCommand cmd = new SqlCommand("update Register set  emailAddress = '" + Session["email"] + "', phoneNumber ='" + Session["PhoneNumber"] + "' where userId ='" + strName + "' ", conn);
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        Response.Redirect("PersonalProfile.aspx");

                    }
                    else
                    {
                        Session.Remove("Change");
                        Response.Redirect("ChangePassword.aspx");

                    }


                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Password Is Not Correct !!');", true);
                    txtPass.Text = "";
                }

            }
           

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string enterPass = txtPass.Text;

            txtPass.TextMode = TextBoxMode.SingleLine;



            txtPass.Text = enterPass;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("PersonalProfile.aspx");
        }
    }
}

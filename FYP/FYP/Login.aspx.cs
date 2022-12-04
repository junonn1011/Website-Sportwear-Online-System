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
    public partial class Login : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();
            string strName = txtName.Text.Trim();
            string strPass = txtPass.Text.Trim();

            string chkUser = "select count(*) from register Where username =  '" + strName + "' ";
            SqlCommand com = new SqlCommand(chkUser, con);
            com.Parameters.AddWithValue("@userId", strName);
            com.Parameters.AddWithValue("@password", strPass);

            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

            con.Close();

            if (temp == 1)
            {
                con.Open();
                string chkPassword = "select password from register Where username =  '" + strName + "'";
                string chkPosition = "select role from register Where username =  '" + strName + "'";

                SqlCommand comPosition = new SqlCommand(chkPosition, con);
                string position = comPosition.ExecuteScalar().ToString().Replace(" ", "");

                SqlCommand comPassword = new SqlCommand(chkPassword, con);
                string password = comPassword.ExecuteScalar().ToString().Replace(" ", "");
                if (password == strPass)
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn.Open();

                    SqlCommand cmdSelect = new SqlCommand("select * from Register Where username =  '" + strName + "'", conn);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmdSelect;
                    

                    SqlDataReader dtr = cmdSelect.ExecuteReader();

                    if (dtr.HasRows)
                    {
                        while (dtr.Read())
                        {                            
                           Session["userId"] = dtr["userId"].ToString();                  
                        }
                    }
                    
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Login Successfully');", true);

                    if (position == "Customer")
                    {
                        Response.Redirect("Product.aspx");
                    }
                    else if (position == "Admin")
                    {
                        Response.Redirect("AdminProduct.aspx");
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Password Is Not Correct !!');", true);
                    txtPass.Text = "";
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('User Name is not correct !!');", true);
                txtName.Text = "";
                txtPass.Text = "";
            }
        }




        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string enterPass = txtPass.Text;
           
            txtPass.TextMode = TextBoxMode.SingleLine;

           
           
            txtPass.Text = enterPass;

        }
    }
}
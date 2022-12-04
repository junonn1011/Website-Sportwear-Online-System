using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP
{
    public partial class PersonalProfile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                showPersonalProfileDetail();
            }
        }

        public void showPersonalProfileDetail()
        {
            conn.Open();

            SqlCommand com = new SqlCommand("select * from Register where userId = '" + Session["userId"] + "' ", conn);
            SqlDataReader srd = com.ExecuteReader();
            while (srd.Read())
            {
                lblUsername.Text = srd.GetValue(1).ToString();

                lblFirstName.Text = srd.GetValue(4).ToString();
                lblLastName.Text = srd.GetValue(5).ToString();
               
                lblDOB.Text= srd.GetValue(6).ToString();
                txtEmail.Text = srd.GetValue(7).ToString();
                txtNumber.Text = srd.GetValue(8).ToString();

            }

            conn.Close();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            conn.Open();
           
            SqlCommand cmd = new SqlCommand("delete from Register where userId = '" + Session["userId"] + "' ", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Login.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if(btnEdit.Text == "Edit")
            {
                txtEmail.Enabled = true;
                txtNumber.Enabled = true;
                btnEdit.Text = "Save";
                btnDelete.Visible = false;
                btnCancel.Visible = true;
            }else if(btnEdit.Text == "Save")
            {
                
                Session["email"] = txtEmail.Text;
                Session["PhoneNumber"] = txtNumber.Text;
                Session["Change"] = "noChange";
                Response.Redirect("ConfirmPersonalProfile.aspx");



                txtEmail.Enabled = false;
                txtNumber.Enabled = false;
                btnEdit.Text = "Edit";

                btnDelete.Visible = true;
                btnCancel.Visible = false;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["Change"] = "Change";
            Response.Redirect("ConfirmPersonalProfile.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtEmail.Enabled = false;
            txtNumber.Enabled = false;
            btnEdit.Text = "Edit";

            btnDelete.Visible = true;
            btnCancel.Visible = false;
            showPersonalProfileDetail();
        }
    }
}
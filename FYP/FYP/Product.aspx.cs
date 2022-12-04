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
    public partial class Product : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        string customerName;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DLbind();
                Drp_ProductCategory();
            }
            //conn.Open();

            //if (Session["userId"] != null)
            //{
            //    SqlCommand com = new SqlCommand("select * from customer where userId = '" + Session["userId"] + "' ", conn);
            //    SqlDataReader srd = com.ExecuteReader();
            //    while (srd.Read())
            //    {
            //        lblName.Text = srd.GetValue(4).ToString();
            //    }
            //    customerName = lblName.Text;
            //    conn.Close();


            //}
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "goToSportswearDetail")
            {
                Response.Redirect("SportswearDetail.aspx?goToSportswearDetail=" + e.CommandArgument.ToString());
            }
        }

        private void DLbind()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from PopularProduct", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.HasRows == true)
            {
                DataList2.DataSource = dr;
                DataList2.DataBind();
            }
            conn.Close();
        }
        private void Drp_ProductCategory()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from Category", conn);
            productCategory.DataSource = cmd.ExecuteReader();
            productCategory.DataTextField = "CategoryName";
            productCategory.DataValueField = "CategoryId";
            productCategory.DataBind();
            productCategory.Items.Insert(0, "Product Category");
            conn.Close();

        }

        protected void productCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strQuery = "";
            string selectedProduct = productCategory.SelectedItem.Text;
            if (selectedProduct == "Product Category")
            {
                strQuery = "";

            }
            else
            {
                strQuery = "where productCategory ='" + selectedProduct + "'";

            }
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Product " + strQuery + " ", conn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            try
            {
                if (selectedProduct == dt.Rows[0][7].ToString())
                {

                }
            }
            catch (Exception ex)
            {
                Response.Write("<Script>alert('No Product Found')</Script>");

            }
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();

        }
    }
}
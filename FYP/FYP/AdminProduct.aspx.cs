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
    public partial class AdminProduct : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Drp_ProductCategory();
            }
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

        protected void DataList1_SelectedIndexChanged(object sender, DataListCommandEventArgs e)
        {
            if (e.CommandName == "goToEditProduct")
            {
                Response.Redirect("EditProduct.aspx?goToEditProduct=" + e.CommandArgument.ToString());
            }
        }

        protected void productCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strQuery = "";
            string selectedProduct = productCategory.SelectedItem.Text;
            if (selectedProduct == "Product Category")
            {
                strQuery = "";

            }else
            {
                strQuery = "where productCategory ='" + selectedProduct + "'";

            }
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Product " + strQuery + " ", conn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            try
            {
                if(selectedProduct == dt.Rows[0][7].ToString())
                {

                }
            }catch(Exception ex)
            {
                Response.Write("<Script>alert('No Product Found')</Script>");

            }
            DataList2.DataSourceID = null;
            DataList2.DataSource = dt;
            DataList2.DataBind();

        }

       
    }
}
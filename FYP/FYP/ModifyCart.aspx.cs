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
    public partial class ModifyCart : System.Web.UI.Page
    {
        double price;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.QueryString["cartId"] != null)

                    conn.Open();

                String strSelect = "Select * from Cart where cartId= '" + Request.QueryString["cartId"] + "'";
                SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
                SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

                if (dtrInfo.HasRows)
                {
                    while (dtrInfo.Read())
                    {

                        lblCartId.Text = dtrInfo["cartId"].ToString();
                        lblCartName.Text = dtrInfo["cartName"].ToString();
                        lblDesc.Text = dtrInfo["cartDesc"].ToString();
                        lblCategory.Text = dtrInfo["cartCategory"].ToString();
                        lblSize.Text = dtrInfo["size"].ToString();
                        price = Convert.ToDouble(dtrInfo["cartPrice"].ToString());
                        lblStock.Text = dtrInfo["cartStock"].ToString();
                        DropDownList1.SelectedItem.Text = dtrInfo["quantity"].ToString();

                    }

                    lblPrice.Text = price.ToString("0.00"); 
                    conn.Close();
                }
                int qty;
                double cost, totalPrice;
                qty = Convert.ToInt32(DropDownList1.SelectedItem.Text);
                cost = Convert.ToDouble(lblPrice.Text);
                totalPrice = qty * cost;
                lblToTal.Text = totalPrice.ToString();

                
            }


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int qty;
            double cost, totalPrice;
            qty = Convert.ToInt32(DropDownList1.SelectedItem.Text);
            cost = Convert.ToDouble(lblPrice.Text);
            totalPrice = qty * cost;
            lblToTal.Text = totalPrice.ToString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string cartId;
            int quantity;

            cartId = lblCartId.Text;

            quantity = Convert.ToInt32(DropDownList1.SelectedItem.Text);


            if (checkStock() == true)
            {
                conn.Open();

                String strUpdate = "update Cart set quantity='" + quantity + "', totalPrice='" + lblToTal.Text.ToString() + "'where cartId ='" + cartId + "' ";
                SqlCommand cmd = new SqlCommand(strUpdate, conn);

                int updateStatus = cmd.ExecuteNonQuery();

                if (updateStatus > 0)

                {
                    Response.Write("<script>alert ('cart update successfully');</script> ");
                    conn.Close();
                    Response.Redirect("Cart.aspx");
                }

                else
                {
                    conn.Close();
                    Response.Write("<script>alert ('fill update');</script> ");
                }




            }
            else
            {
                Response.Write("<script>alert ('The stocks are not available!!!');</script> ");
            }
        }

        public Boolean checkStock()
        {
            int stock, qty;
            qty = Convert.ToInt32(DropDownList1.SelectedItem.Text);
            conn.Open();
            SqlCommand cmdSelect = new SqlCommand("select * from Cart where cartId = '" + lblCartId.Text.ToString() + "'", conn);

            SqlDataReader dtrInfo = cmdSelect.ExecuteReader();
            if (dtrInfo.HasRows)
            {
                while (dtrInfo.Read())
                {
                    stock = Convert.ToInt32(dtrInfo["cartStock"].ToString());
                    if (qty > stock)
                    {
                        conn.Close();
                        return false;

                    }
                    else if (qty <= stock)
                    {
                        conn.Close();
                        return true;
                    }

                }

            }





            return false;


        }
    }
}
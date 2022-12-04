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
    public partial class PruchaseHistory : System.Web.UI.Page
    {
        string userId;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            GVbind();
        }


        protected void GVbind()
        {

            if (Session["userId"] != null)
            {

                conn.Open();


                SqlCommand cmdSelect = new SqlCommand("select P.dateTime, P.orderNo,PH.productName,PH.price, PH.quantity,PH.purchaseId, PH.totalPrice ,PH.image,PH.userId from PurchaseHistory PH, Payment P where PH.orderNo = P.orderNo and P.userId = '" + Session["userId"] + "' order by PH.purchaseId DESC", conn);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmdSelect;
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

                conn.Close();

            }

        }
    }
}
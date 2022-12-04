using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.Net;
using System.Net.Mail;

namespace FYP
{
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string sportswearId, sportswearName, price, image, totalPrice, cartId, userId, orderNo, dateTime, paymentMethod, paymentType, firstName, lastName, email, userName, randomCode;
        int quantity, item, discountVoucher, generateDisVch, dis, newStock, stock, productId;
        double totalAmount;


        protected void Page_Load(object sender, EventArgs e)
        {
            GVbind();
        }



        protected void GVbind()
        {


            if (Session["userId"] != null)
            {


                double Price;
                double totalPrice = 0;
                int count = 0;

                conn.Open();


                SqlCommand cmdSelect = new SqlCommand("select * from orderTable O, Register R where R.userId = O.userId and O.userId = '" + Session["userId"] + "'", conn);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmdSelect;
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

                SqlDataReader dtrOrder = cmdSelect.ExecuteReader();

                if (dtrOrder.HasRows)
                {
                    while (dtrOrder.Read())
                    {

                        Price = Convert.ToDouble(dtrOrder["totalPrice"].ToString());
                        orderNo = dtrOrder["orderNo"].ToString();
                        userName = dtrOrder["userName"].ToString();
                        totalPrice += Price;
                        ++count;
                    }
                }

                totalAmount = Convert.ToDouble(totalPrice.ToString());
                lblUserName.Text = userName.ToString();
                lblTotalAmount.Text = totalAmount.ToString("0.00");
                lblItem.Text = count.ToString();
                lblDate.Text = DateTime.Now.ToString("dd/MM/yyyy"); ;
                lblOrderNo.Text = orderNo.ToString();
                lblFinalTotalAmount.Text = totalAmount.ToString("0.00");
                lblTxtPercent.Visible = false;
                lbltxtRM1.Visible = false;
                lbltxtdis.Visible = false;

                if (Session["discountVoucher"] != null)
                {
                    lblDiscountVoucher.Text = Session["discountVoucher"].ToString();
                    lblFinalTotalAmount.Text = Session["finalTotalPrice"].ToString();
                    totalAmount = Convert.ToDouble(Session["finalTotalPrice"].ToString());
                    discountVoucher = Convert.ToInt32(Session["discountVoucher"].ToString());
                    lblDiscountAmount.Text = Session["discountAmount"].ToString();
                    lblTxtPercent.Visible = true;
                    lbltxtRM1.Visible = true;
                    lbltxtdis.Visible = true;
                    lbltxtFinalTotalAmount.Text = "New Balance :";
                }


                conn.Close();
            }
        }




        protected void radPaymentMtd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (radPaymentMtd.SelectedValue == "Credit Card")
            {
                lblCardPayment.Visible = true;
                radCardType.Visible = true;
                lblCardNum.Visible = true;
                txtCardNum.Visible = true;
                lblCardUserName.Visible = true;
                lblSecureCode.Visible = true;
                txtCardUserName.Visible = true;
                txtSecureCode.Visible = true;
                lblBankPayment.Visible = false;
                ddlBank.Visible = false;
                lblAccNum.Visible = false;
                txtAccNum.Visible = false;
                lblBankUserName.Visible = false;
                lblBankPassword.Visible = false;
                txtBankUserName.Visible = false;
                txtBankPassword.Visible = false;

                imgCard.Visible = true;
                imgOnlineBank.Visible = false;
                txtExDate.Visible = true;
                lbltxtExDate.Visible = true;

            }
            else if (radPaymentMtd.SelectedValue == "Online Banking")
            {
                lblBankPayment.Visible = true;
                ddlBank.Visible = true;
                lblAccNum.Visible = true;
                txtAccNum.Visible = true;
                lblBankUserName.Visible = true;
                lblBankPassword.Visible = true;
                txtBankUserName.Visible = true;
                txtBankPassword.Visible = true;
                lblCardPayment.Visible = false;
                radCardType.Visible = false;
                lblCardNum.Visible = false;
                txtCardNum.Visible = false;
                lblCardUserName.Visible = false;
                lblSecureCode.Visible = false;
                txtCardUserName.Visible = false;
                txtSecureCode.Visible = false;

                imgCard.Visible = false;
                imgOnlineBank.Visible = true;
                txtExDate.Visible = false;
                lbltxtExDate.Visible = false;
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (radPaymentMtd.SelectedIndex != -1)
            {
                if (radPaymentMtd.SelectedValue == "Online Banking")
                {


                    string paymentMethod = radPaymentMtd.SelectedItem.Text.ToString();
                    string paymentType = ddlBank.SelectedItem.Text.ToString();
                    string paymentNo = lblOrderNo.Text.ToString();
                    string accNum = txtAccNum.Text.ToString();
                    int item = Convert.ToInt32(lblItem.Text);
                    DateTime date = DateTime.Now;
                    userId = Session["userId"].ToString();

                    conn.Open();
                    String strInsert = "insert into payment(orderNo,paymentMethod,paymentType,payNumber,totalAmount,totalItem,dateTime,discountVoucher,userId) Values (@OrderNo,@PaymentMethod,@PaymentType,@PayNumber,@TotalAmount,@TotalItem,@DateTime,@DiscountVoucher,@UserId) ";
                    SqlCommand cmdInsertPayment = new SqlCommand(strInsert, conn);


                    cmdInsertPayment.Parameters.AddWithValue("@OrderNo", paymentNo);
                    cmdInsertPayment.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                    cmdInsertPayment.Parameters.AddWithValue("@PaymentType", paymentType);
                    cmdInsertPayment.Parameters.AddWithValue("@PayNumber", accNum);
                    cmdInsertPayment.Parameters.AddWithValue("@TotalAmount", totalAmount);
                    cmdInsertPayment.Parameters.AddWithValue("@TotalItem", item);
                    cmdInsertPayment.Parameters.AddWithValue("@DateTime", date);
                    cmdInsertPayment.Parameters.AddWithValue("@DiscountVoucher", discountVoucher);
                    cmdInsertPayment.Parameters.AddWithValue("@UserId", userId);
                    cmdInsertPayment.ExecuteNonQuery();

                    conn.Close();


                }
                else if (radPaymentMtd.SelectedValue == "Credit Card")
                {

                    string paymentMethod = radPaymentMtd.SelectedItem.Text.ToString();
                    string paymentType = radCardType.SelectedItem.Text.ToString();
                    string paymentNo = lblOrderNo.Text.ToString();
                    string cardNum = txtCardNum.Text.ToString();
                    int item = Convert.ToInt32(lblItem.Text);
                    DateTime date = DateTime.Now;
                    userId = Session["userId"].ToString();

                    conn.Open();
                    String strInsert = "insert into payment(orderNo,paymentMethod,paymentType,payNumber,totalAmount,totalItem,dateTime,discountVoucher,userId) Values (@OrderNo,@PaymentMethod,@PaymentType,@PayNumber,@TotalAmount,@TotalItem,@DateTime,@DiscountVoucher,@UserId) ";
                    SqlCommand cmdInsertPayment = new SqlCommand(strInsert, conn);


                    cmdInsertPayment.Parameters.AddWithValue("@OrderNo", paymentNo);
                    cmdInsertPayment.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                    cmdInsertPayment.Parameters.AddWithValue("@PaymentType", paymentType);
                    cmdInsertPayment.Parameters.AddWithValue("@PayNumber", cardNum);
                    cmdInsertPayment.Parameters.AddWithValue("@TotalAmount", totalAmount);
                    cmdInsertPayment.Parameters.AddWithValue("@TotalItem", item);
                    cmdInsertPayment.Parameters.AddWithValue("@DateTime", date);
                    cmdInsertPayment.Parameters.AddWithValue("@DiscountVoucher", discountVoucher);
                    cmdInsertPayment.Parameters.AddWithValue("@UserId", userId);
                    cmdInsertPayment.ExecuteNonQuery();

                    conn.Close();
                }

                //add Purchase history table
                addPurchaseHistory();

                //generate discount Voucher based on the total amount that customer pay
                generateVoucher();


                //send order summary to customer's email
                sendEmail();

                //Update stock of the product that customer purchase  
                updateStock();

                //delete Cart
                deleteCart();

                //delete Order table
                deleteOrder();



                if (Session["discountVoucher"] != null)
                {
                    deleteVoucher();
                    Session["discountVoucher"] = null;

                }
                Response.Redirect("Receipt.aspx");
            }
            else
            {
                Response.Write("<script>alert (' Please Select The Payment Method !!');</script> ");
            }


        }

        //add Purchase history table 
        public void addPurchaseHistory()
        {
            string orderNum = lblOrderNo.Text.ToString();

            conn.Open();
            SqlCommand cmdSelect = new SqlCommand("select * from orderTable where userId = '" + userId + "'", conn);
            SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

            if (dtrInfo.HasRows)
            {
                while (dtrInfo.Read())
                {
                    orderNo = dtrInfo["orderNo"].ToString();
                    cartId = dtrInfo["cartId"].ToString();
                    sportswearName = dtrInfo["productName"].ToString();
                    price = dtrInfo["price"].ToString();
                    quantity = Convert.ToInt32(dtrInfo["quantity"].ToString());
                    totalPrice = dtrInfo["totalPrice"].ToString();
                    image = dtrInfo["image"].ToString();
                    userId = dtrInfo["userId"].ToString();

                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    con.Open();
                    String strInsert = "insert into purchaseHistory(orderNo,cartId,productName,price,quantity,totalPrice,image,userId) Values (@OrderNo,@CardId,@ProductName,@Price,@Quantity,@TotalPrice,@Image,@userId) ";
                    SqlCommand cmdPurchase = new SqlCommand(strInsert, con);


                    cmdPurchase.Parameters.AddWithValue("@OrderNo", orderNum);
                    cmdPurchase.Parameters.AddWithValue("@CardId", cartId);
                    cmdPurchase.Parameters.AddWithValue("@ProductName", sportswearName);
                    cmdPurchase.Parameters.AddWithValue("@Price", price);
                    cmdPurchase.Parameters.AddWithValue("@Quantity", quantity);
                    cmdPurchase.Parameters.AddWithValue("@TotalPrice", totalPrice);
                    cmdPurchase.Parameters.AddWithValue("@Image", image);
                    cmdPurchase.Parameters.AddWithValue("@UserId", userId);

                    cmdPurchase.ExecuteNonQuery();
                    con.Close();

                }
            }
            conn.Close();


        }

        public void sendEmail()
        {


            conn.Open();


            SqlCommand cmdSelect = new SqlCommand("select * from Payment P, Register R where P.userId = R.userId and  R.userId = '" + Session["userId"] + "' and P.orderNo = '" + orderNo + "'", conn);

            SqlDataReader dtr = cmdSelect.ExecuteReader();
            if (dtr.HasRows)
            {
                while (dtr.Read())
                {

                    item = Convert.ToInt32(dtr["totalItem"].ToString());
                    totalAmount = Convert.ToDouble(dtr["totalAmount"].ToString());
                    dateTime = dtr["dateTime"].ToString();
                    paymentMethod = dtr["paymentMethod"].ToString();
                    paymentType = dtr["paymentType"].ToString();
                    firstName = dtr["firstName"].ToString();
                    lastName = dtr["lastName"].ToString();
                    email = dtr["emailAddress"].ToString();
                }
            }

            conn.Close();


            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Hello, " + firstName + " " + lastName);
            sb.AppendLine("");
            sb.AppendLine("You had Purchased Successfully.  ");
            sb.AppendLine("");
            sb.AppendLine("Date Time : " + dateTime);
            sb.AppendLine("Payment Method : " + paymentMethod);
            sb.AppendLine("Pay By : " + paymentType);
            sb.AppendLine("Total Item :" + item);
            sb.AppendLine("Total Amount (RM): " + totalAmount);
            sb.AppendLine(" ");
            sb.AppendLine("Thank You. Have a nice day (^_^)");

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("lyejo-wm19@student.tarc.edu.my", "ahqclfnrnvcjfwvn");
            MailMessage msg = new MailMessage();
            msg.To.Add(email);
            msg.From = new MailAddress("DLM Sportwear<facilityreserve123@gmail.com>");
            msg.Subject = "Order Receipt";
            msg.Body = sb.ToString();
            client.Send(msg);

        }


        protected void radCardType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (radCardType.SelectedValue == "Visa")
            {

                RegularExpressionValidator1.ValidationExpression = @"4\d{15}";

            }
            else
            {
                RegularExpressionValidator1.ValidationExpression = @"5\d{15}";

            }
        }

        public void deleteCart()
        {
            conn.Open();
            SqlCommand com = new SqlCommand("delete  from Cart where userId = '" + Session["userId"] + "'", conn);
            com.ExecuteNonQuery();
            conn.Close();

        }

        public void deleteOrder()
        {

            conn.Open();
            SqlCommand com = new SqlCommand("delete  from OrderTable where userId = '" + Session["userId"] + "'", conn);
            com.ExecuteNonQuery();
            conn.Close();

        }

        public void deleteVoucher()
        {
            conn.Open();
            SqlCommand com = new SqlCommand("delete  from DiscountVoucher where userId = '" + Session["userId"] + "' and discountVoucher = '" + Session["discountVoucher"] + "'", conn);
            com.ExecuteNonQuery();

            conn.Close();


        }

        public Boolean checkDiscountVoucher()
        {

            conn.Open();
            SqlCommand cmdSelect = new SqlCommand("select * from DiscountVoucher where userId = '" + Session["userId"] + "' and discountVoucher = '" + generateDisVch + "'", conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdSelect;
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                return false;
            }
            else
            {
                return true;
            }

        }

        public void generateVoucher()
        {

            if (totalAmount >= 500 && totalAmount < 700)
            {
                generateDisVch = 20;

                if (checkDiscountVoucher() == true)
                {
                    conn.Open();
                    String strInsert = "insert into DiscountVoucher(discountVoucher,userId) Values (@DiscountVoucher,@UserId) ";
                    SqlCommand cmdInsertPayment = new SqlCommand(strInsert, conn);



                    cmdInsertPayment.Parameters.AddWithValue("@DiscountVoucher", generateDisVch);
                    cmdInsertPayment.Parameters.AddWithValue("@UserId", Session["userId"]);
                    cmdInsertPayment.ExecuteNonQuery();

                    conn.Close();
                }

            }
            else if (totalAmount >= 700 && totalAmount < 1000)
            {
                generateDisVch = 30;
                if (checkDiscountVoucher() == true)
                {
                    conn.Open();
                    String strInsert = "insert into DiscountVoucher(discountVoucher,userId) Values (@DiscountVoucher,@UserId) ";
                    SqlCommand cmdInsertPayment = new SqlCommand(strInsert, conn);



                    cmdInsertPayment.Parameters.AddWithValue("@DiscountVoucher", generateDisVch);
                    cmdInsertPayment.Parameters.AddWithValue("@UserId", Session["userId"]);
                    cmdInsertPayment.ExecuteNonQuery();

                    conn.Close();
                }

            }
            else if (totalAmount >= 1000)
            {
                generateDisVch = 40;
                if (checkDiscountVoucher() == true)
                {
                    conn.Open();
                    String strInsert = "insert into DiscountVoucher(discountVoucher,userId) Values (@DiscountVoucher,@UserId) ";
                    SqlCommand cmdInsertPayment = new SqlCommand(strInsert, conn);



                    cmdInsertPayment.Parameters.AddWithValue("@DiscountVoucher", generateDisVch);
                    cmdInsertPayment.Parameters.AddWithValue("@UserId", Session["userId"]);
                    cmdInsertPayment.ExecuteNonQuery();

                    conn.Close();
                }


            }






        }


        public void updateStock()
        {
            conn.Open();
            SqlCommand cmdSelect = new SqlCommand("select P.productStock,P.productId, OT.quantity from orderTable OT, Cart C , Product P where OT.cartId = C.cartId and C.productId = P.productId and OT.orderNo ='" + orderNo + "' and  OT.userId = '" + Session["userId"] + "'", conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdSelect;


            SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

            if (dtrInfo.HasRows)
            {
                while (dtrInfo.Read())
                {

                    stock = Convert.ToInt32(dtrInfo["productStock"].ToString());
                    quantity = Convert.ToInt32(dtrInfo["quantity"].ToString());
                    productId = Convert.ToInt32(dtrInfo["productId"].ToString());
                    newStock = stock - quantity;
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    con.Open();
                    String strModify = "update P set P.productStock='" + newStock + "' from orderTable OT, Cart C , Product P where OT.cartId = C.cartId and C.productId = P.productId and  P.productId ='" + productId + "' and OT.orderNo ='" + orderNo + "' and  OT.userId = '" + Session["userId"] + "'";
                    SqlCommand cmdInsert = new SqlCommand(strModify, con);


                    cmdInsert.ExecuteNonQuery();
                    con.Close();


                }
            }

            conn.Close();
        }

    }
}
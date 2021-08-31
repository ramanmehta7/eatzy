using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Eatzy
{
    public partial class myorder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = (string)Session["username"];
            string ConnString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(ConnString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT billId, orderSummary, total FROM orders WHERE username='" + username + "';";
                cmd.Connection = con;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Response.Write("<b>BILL ID: </b>" + reader["billId"].ToString() + "<br />");
                        Response.Write("<b>ORDER SUMMARY: </b>" + reader["orderSummary"].ToString() + "<br />");
                        Response.Write("<b>TOTAL AMOUNT: </b>" + reader["total"].ToString() + "<br /><br /><br />");
                        
                    }
                }
                else
                {
                    Response.Write("<h1>No orders from you yet. Order Now!</h1>");
                }
                con.Close();
            }
        }
    }
}
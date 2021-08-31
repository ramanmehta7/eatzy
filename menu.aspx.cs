using System;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Eatzy
{
    public partial class menu : System.Web.UI.Page
    {
        public int totalAmount;
        public string[] items;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                totalAmount = 0;
            }
        }

        protected void myOrdersBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/myorder.aspx");
        }

        protected void checkoutBtn_Click(object sender, EventArgs e)
        {
            if(Session["itemsCount"] != null && (int)Session["itemsCount"] > 0)
            {
                Response.Redirect("~/bill.aspx");
                
            }
            else
            {
                Response.Write("<script>alert('" + Session["Name"] + ", Your cart is empty');</script>");
            }
        }

        protected void addBtnClick(object sender, EventArgs e)
        {
            Button addBtn = (Button)sender;

            string[] commandArgs = addBtn.CommandArgument.ToString().Split(new char[] { ',' });
            string foodItemName = commandArgs[0];
            int foodItemPrice = Int32.Parse(commandArgs[1]);

            string addBtnText = addBtn.Text;
            if (addBtnText == "+Add")
            {
                if (Session["totalAmount"] != null)
                {
                    totalAmount = (int)Session["totalAmount"] + foodItemPrice;
                }
                else
                {
                    totalAmount = foodItemPrice;
                }

                Session["totalAmount"] = totalAmount;
                addBtn.CssClass = "btn btn-success add-button";
                addBtn.Text = "Added";

                if (Session["items"] != null)
                {
                    Session["items"] = Session["items"] + "," + foodItemName;
                    Session["itemsCount"] = (int)Session["itemsCount"] + 1;
                }
                else
                {
                    Session["items"] = foodItemName;
                    Session["itemsCount"] = 1;
                }
            }


            else if (addBtnText == "Added") 
            {
                if (Session["totalAmount"] != null)
                {
                    totalAmount = (int)Session["totalAmount"] - foodItemPrice;
                }
                else
                {
                    totalAmount = 0;
                }

                Session["totalAmount"] = totalAmount;
                addBtn.CssClass = "btn btn-primary add-button";
                addBtn.Text = "+Add";

                if (Session["items"] != null)
                {
                    string[] items = Session["items"].ToString().Split(new char[] { ',' });
                    for (int i = 0; i < items.Length; i++)
                    {
                        if(items[i] == foodItemName)
                        {
                            for(int j = i + 1; j < (int)Session["itemsCount"]; j++)
                            {
                                items[j - 1] = items[j];
                            }
                            Session["itemsCount"] = (int)Session["itemsCount"] - 1;
                        }
                    }

                    Session["items"] = string.Empty;
                    if((int)Session["itemsCount"] > 0)
                    {
                        Session["items"] = items[0];
                    }
                    for (int i = 1; i < (int)Session["itemsCount"]; i++)
                    {
                        Session["items"] = Session["items"] + "," + items[i];
                    }

                    if ((int)Session["itemsCount"] == 0)
                    {
                        Session["items"] = null;
                        Session["itemsCount"] = null;
                        Session["itemsQty"] = null;
                        Session["totalAmount"] = null;
                    }
                }
            }
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            string searchBoxText = searchTextBox.Text;
            if(searchBoxText == string.Empty)
            {
                Response.Write("<script>alert('Please, Enter the Bill ID');</script>");
            }
            else if(!(searchBoxText.Length >= 16 && searchBoxText.Length <= 18))
            {
                Response.Write("<script>alert('Please, Enter a valid Bill ID');</script>");
            }
            else
            {
                string orderSummary = string.Empty;
                int totalAmountFetched = 0;
                string ConnString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "SELECT orderSummary, total FROM orders WHERE billId='" + searchBoxText + "';";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            orderSummary = reader["orderSummary"].ToString();
                            totalAmountFetched = (int)reader["total"];
                        }
                    }
                    con.Close();
                }

                Session["billId"] = searchBoxText;
                Session["totalAmount"] = totalAmountFetched;
                Session["items"] = null;
                Session["itemsQty"] = null;
                items = orderSummary.Split(new char[] { ',' });
                Session["itemsCount"] = items.Length;

                string[] itemQtyPair;
                foreach(string item in items)
                {
                    itemQtyPair = item.ToString().Split(new char[] { ':' });
                    string itemName = itemQtyPair[0];
                    string itemQty = itemQtyPair[1];

                    if (Session["items"] != null)
                    {
                        Session["items"] = Session["items"] + "," + itemName;
                    }
                    else
                    {
                        Session["items"] = itemName;
                    }

                    if (Session["itemsQty"] != null)
                    {
                        Session["itemsQty"] = Session["itemsQty"] + "," + itemQty;
                    }
                    else
                    {
                        Session["itemsQty"] = itemQty;
                    }
                }

                Response.Redirect("~/bill.aspx");
            }
        }
    }
}
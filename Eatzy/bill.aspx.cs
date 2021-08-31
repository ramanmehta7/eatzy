using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

namespace Eatzy
{
    public partial class bill : System.Web.UI.Page
    {
        public string[] items;
        public string[] itemsQty;
        public int qtyChaap = 0, qtyPaneer = 0, qtyDal = 0, qtyPizza = 0, qtyBurger = 0, qtyCarbonara = 0, qtyRisotto = 0, qtyRavioli = 0, qtyNoodles = 0, totalAmountOrder = 0;
        private readonly Random _random = new Random();

        protected int getPriceOfItem(string itemName)
        {
            switch (itemName)
            {
                case "Chaap":
                    return 250;
                case "KadaiPaneer":
                    return 300;
                case "DalMakhani":
                    return 230;
                case "Pizza":
                    return 450;
                case "Burger":
                    return 150;
                case "Carbonara":
                    return 400;
                case "Risotto":
                    return 350;
                case "Ravioli":
                    return 350;
                case "Noodles":
                    return 250;
                default:
                    return 0;
            }
        }

        protected int getQtyOfItem(string itemName)
        {
            switch (itemName)
            {
                case "Chaap":
                    return qtyChaap;
                case "KadaiPaneer":
                    return qtyPaneer;
                case "DalMakhani":
                    return qtyDal;
                case "Pizza":
                    return qtyPizza;
                case "Burger":
                    return qtyBurger;
                case "Carbonara":
                    return qtyCarbonara;
                case "Risotto":
                    return qtyRisotto;
                case "Ravioli":
                    return qtyRavioli;
                case "Noodles":
                    return qtyNoodles;
                default:
                    return 0;
            }
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            items = Session["items"].ToString().Split(new char[] { ',' });
            string content = string.Empty;
            if (Session["itemsQty"] != null)
            {
                itemsQty = Session["itemsQty"].ToString().Split(new char[] { ',' });
            }
            else
            {
                string qtyStr = string.Empty;
                for(int i = 0; i < (int)Session["itemsCount"]; i++)
                {
                    if(qtyStr == string.Empty)
                    {
                        qtyStr = qtyStr + "1";
                    }
                    else
                    {
                        qtyStr = qtyStr + ",1";
                    }
                }
                itemsQty = qtyStr.Split(new char[] { ',' });
            }

            for (int i = 0; i < (int)Session["itemsCount"]; i++)
            {
                content = content + "<div class='row'>";
                content = content + "<div class='col-lg-4'>";
                content = content + "<label class='label-design item-label' id='Item" + items[i] + "' runat='server'>" + items[i] + "</label>";
                content = content + "</div>";
                content = content + "<div class='col-lg-4'>";
                content = content + "<label class='label-design price-label float-end' id='Price" + items[i] + "' runat='server'>₹" + getPriceOfItem(items[i]) + "/-</label>";
                content = content + "</div>";
                content = content + "<div class='col-lg-4 parent-div'>";
                content = content + "<input type='button' class='btn btn-default inc-dec-btn' runat='server' id='" + items[i] + "dec' value='-' onclick='decBtn(this," + getPriceOfItem(items[i]) + ")' />";
                content = content + "<input type='text' class='qty-textbox' runat='server' id='Qty" + items[i] + "' value='" + itemsQty[i] + "' disabled/>";
                content = content + "<input type='button' class='btn btn-default inc-dec-btn' runat='server' id='" + items[i] + "Inc' value='+' onclick='incBtn(this," + getPriceOfItem(items[i]) + ")' />";
                content = content + "</div>";
                content = content + "</div>";
            }
            billContainer.InnerHtml = content;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                totalAmountHidden.Value = ((int)Session["totalAmount"]).ToString();
            }
        }

        public int RandomNumber(int min, int max)
        {
            return _random.Next(min, max);
        }

        public string RandomString(int size, bool lowerCase = false)
        {
            var builder = new StringBuilder(size);
            char offset = lowerCase ? 'a' : 'A';
            const int lettersOffset = 26;  

            for (var i = 0; i < size; i++)
            {
                var @char = (char)_random.Next(offset, offset + lettersOffset);
                builder.Append(@char);
            }

            return lowerCase ? builder.ToString().ToLower() : builder.ToString();
        }

        protected void orderSaveToDb(string orderSummary)
        {
            string billId = string.Empty;
            billId = billId + "#bill_";

            string randomStr = RandomString(6);
            int randomNum = RandomNumber(5046, 563324);
            billId = billId + randomStr + randomNum.ToString();
            string username = Session["username"].ToString();

            string ConnString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            if (Session["billId"] == null)
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "INSERT INTO orders VALUES ('" + billId + "','" + orderSummary + "','" + username + "','" + totalAmountOrder + "');";
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
                billId = (string)Session["billId"];
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "UPDATE orders SET orderSummary = '" + orderSummary + "', total = '" + totalAmountOrder + "' WHERE billId = '" + billId + "';";
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        protected void orderBtn_Click(object sender, EventArgs e)
        {           
            bool qtyChaapCheck = Int32.TryParse(QtyChaapHidden.Value, out qtyChaap);
            bool qtyPaneerCheck = Int32.TryParse(QtyKadaiPaneerHidden.Value, out qtyPaneer);
            bool qtyDalCheck = Int32.TryParse(QtyDalMakhaniHidden.Value, out qtyDal);
            bool qtyPizzaCheck = Int32.TryParse(QtyPizzaHidden.Value, out qtyPizza);
            bool qtyBurgerCheck = Int32.TryParse(QtyBurgerHidden.Value, out qtyBurger);
            bool qtyCarbonaraCheck = Int32.TryParse(QtyCarbonaraHidden.Value, out qtyCarbonara);
            bool qtyRisottoCheck = Int32.TryParse(QtyRisottoHidden.Value, out qtyRisotto);
            bool qtyRavioliCheck = Int32.TryParse(QtyRavioliHidden.Value, out qtyRavioli);
            bool qtyNoodlesCheck = Int32.TryParse(QtyNoodlesHidden.Value, out qtyNoodles);
            bool totalAmountCheck = Int32.TryParse(totalAmountHidden.Value, out totalAmountOrder);

            string orderSummary = string.Empty;
            foreach(string item in items)
            {
                if(orderSummary == string.Empty)
                {
                    orderSummary = orderSummary + item;
                    orderSummary = orderSummary + ":";
                    orderSummary = orderSummary + getQtyOfItem(item).ToString();
                }
                else
                {
                    orderSummary = orderSummary + "," + item;
                    orderSummary = orderSummary + ":";
                    orderSummary = orderSummary + getQtyOfItem(item).ToString();
                }
            }

            orderSaveToDb(orderSummary);

            Session["billId"] = null;
            Session["totalAmount"] = null;
            Session["items"] = null;
            Session["itemsCount"] = null;
            Session["itemsQty"] = null;

            Response.Redirect("~/menu.aspx");
        }

        //protected void decBtn(object sender, EventArgs e)
        //{
        //    Response.Write("<script>alert('" + Session["Name"] + ", Your cart is empty');</script>");
        //    Button decBtn = (Button)sender;
        //    string decBtnId = decBtn.ID; //PizzaInc
        //    string textBoxId = "Qty" + decBtnId.Substring(0, decBtnId.Length - 3); //QtyPizza

        //    TextBox qtyTextBox = (TextBox)FindControl(textBoxId);
        //    int textBoxValue;
        //    bool parsingSuccessForTextBox = Int32.TryParse(qtyTextBox.Text, out textBoxValue);
        //    if (parsingSuccessForTextBox && textBoxValue > 1)
        //    {
        //        qtyTextBox.Text = (textBoxValue - 1).ToString();
        //    }
        //}

        //protected void incBtn(object sender, EventArgs e)
        //{
        //    Response.Write("<script>alert('" + Session["Name"] + ", Your cart is empty');</script>");
        //    Button incBtn = (Button)sender;
        //    string incBtnId = incBtn.ID; //PizzaInc
        //    string textBoxId = "Qty" + incBtnId.Substring(0, incBtnId.Length - 3); //QtyPizza

        //    TextBox qtyTextBox = (TextBox)FindControl(textBoxId);
        //    int textBoxValue;
        //    bool parsingSuccessForTextBox = Int32.TryParse(qtyTextBox.Text, out textBoxValue);
        //    if (parsingSuccessForTextBox)
        //    {
        //        qtyTextBox.Text = (textBoxValue + 1).ToString();
        //    }
        //if(ViewState[textBoxId] != null)
        //{
        //    ViewState[textBoxId] = (int)ViewState[textBoxId] + 1;
        //}
        //else
        //{
        //    ViewState[textBoxId] = 1;
        //    ViewState[textBoxId] = (int)ViewState[textBoxId] + 1;
        //}
        //qtyTextBox.Text = ViewState[textBoxId].ToString();
        //}
    }
}
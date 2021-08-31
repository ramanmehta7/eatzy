using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Eatzy
{
    public partial class signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx");
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                string ConnString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "INSERT INTO users VALUES ('" + usernameInput.Text + "','" + nameInput.Text + "','" + emailInput.Text + "','" + passwordInput.Text + "');";
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                Session["Name"] = nameInput.Text;
                Session["username"] = usernameInput.Text;
                Response.Redirect("~/menu.aspx");
            }
        }
    }
}
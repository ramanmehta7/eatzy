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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void SigninButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/signin.aspx");
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string ConnString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                string user = string.Empty;
                string username = string.Empty;
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "SELECT username, name FROM users WHERE username='" + usernameInput.Text + "' AND pass='" + passwordInput.Text + "';";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            username = reader["username"].ToString();
                            user = reader["name"].ToString();
                        }
                    }
                    con.Close();
                }
                if (username != string.Empty)
                {
                    Session["Name"] = user;
                    Session["username"] = username;
                    Response.Redirect("~/menu.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Wrong Credentials');</script>");
                }
            }
        }
    }
}
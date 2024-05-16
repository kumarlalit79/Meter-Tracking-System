using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mts_project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Logout = Request.QueryString["Logout"];
                if (!string.IsNullOrEmpty(Logout) && Logout == "True")
                {
                    Session["Mob_Num"] = null;
                    Session.Clear();
                    Session.Abandon();

                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Mob_Num"] = txtPhoneNum.Text;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select * from account_detail where Mob_Num='" + txtPhoneNum.Text + "' ", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Mob_Num"].ToString() == txtPhoneNum.Text)
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Response.Redirect("Create_User.aspx");
                }
            }
            else
            {
                Response.Redirect("Create_User.aspx");
            }
        }
    }
}
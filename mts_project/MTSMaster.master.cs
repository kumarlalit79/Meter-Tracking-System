using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mts_project
{
    public partial class MTSMaster : System.Web.UI.MasterPage
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count > 0)
            {
                if (!IsPostBack)
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

                    SqlCommand cmd = new SqlCommand("view_account_detail ", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    string mob_num = Session["Mob_Num"].ToString();
                    cmd.Parameters.AddWithValue("@Mob_Num", mob_num);
                    if (con.State == ConnectionState.Closed)
                        con.Open();

                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        //lblAccNum.Text = dr["Account"].ToString();
                        //lblMobNum.Text = dr["Mob_Num"].ToString();
                        lbluser.Text = dr["Name"].ToString();

                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }
        }
    }
}
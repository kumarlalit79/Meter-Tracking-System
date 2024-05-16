using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace mts_project
{
    public partial class My_Account : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Keys.Count > 0 && Session["Mob_Num"].ToString() != null)
            {

                if (!IsPostBack)
                {
                    //showchart();
                    //showData();


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
                        lblName.Text = dr["Name"].ToString();
                        lblMeter.Text = dr["Meter_Type"].ToString();
                        lblMobNum.Text = dr["Mob_Num"].ToString();
                        lblEmail.Text = dr["Email"].ToString();
                        lblAccNum.Text = dr["Account"].ToString();
                        lblAddress.Text = dr["Address"].ToString();
                        lblState.Text = dr["State_Name"].ToString();
                        lblDistrict.Text = dr["district_Name"].ToString();
                        lblPin.Text = dr["Pin_Code"].ToString();
                        lblStatus.Text = dr["acc_status"].ToString();
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create_User.aspx?UserEdit=True", false);
        }

        protected void BtnAddAccount_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
                SqlCommand cmd;
                //int activestatus = 0;
                //int isdelete=0;
                //if (RadioButtonList2.SelectedItem.ToString()=="Active")
                //{
                //    activestatus = 1;
                //    isdelete = 0;
                //}
                //else
                //{
                //    activestatus = 0;
                //    isdelete = 1;
                //}
                cmd = new SqlCommand("add_account_details_info", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FK_ACCOUNT_ID", 2);
                cmd.Parameters.AddWithValue("@Meter_Type", rbtMeterType.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@ACCOUNT_NUM", txtaccountnumber.Text);
                cmd.Parameters.AddWithValue("@Is_Active", 1);
                cmd.Parameters.AddWithValue("@is_Deleted", 0);
                cmd.Parameters.AddWithValue("@CREATEDBY", "9971989212");

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Response.Write("<script>alert('Record Save Successfully')</script>");

                    Response.Redirect("My_Account.aspx", false);
                }
                else
                {
                    Response.Write("<script>alert('Failed inserting Record into table')</script>");
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace mts_project
{
    public partial class Create_User : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            
            if (Session.Count > 0)
            {
                

                //if (Session["Mob_Num"].ToString() != null)
                //{


                if (!IsPostBack)
                {
                    string UserEdit = Request.QueryString["UserEdit"];
                    if (!string.IsNullOrEmpty(UserEdit) && UserEdit == "True")
                    {

                        Bind_User();
                    }
                    loadState();
                    loadDistrict();
                    //}
                    //else
                    //{
                    //    Response.Redirect("Login_Page.aspx", false);
                    //}
                    dynamicNumber();
                }
                else
                {
                    Response.Redirect("Login_Page.aspx", false);
                }
            }
        }

        private void dynamicNumber()
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("view_account_detail ", con);

                cmd.CommandType = CommandType.StoredProcedure;

                //SqlCommand cmd = new SqlCommand("select Mob_Num from account_detail", con);

                string mob_num = Session["Mob_Num"].ToString();

                cmd.Parameters.AddWithValue("@Mob_Num", mob_num);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    txtMob.Text = dt.Rows[0]["Mob_Num"].ToString();
                }
                else
                {
                    txtMob.Text = mob_num;
                    //txtMob.Enabled = false;
                }

            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                if(con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }

        private void Bind_User()
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

                txtFname.Text = dr["Name"].ToString();
                RadioButtonList1.SelectedValue = dr["Meter_Type"].ToString();
                RadioButtonList2.SelectedValue = dr["acc_status1"].ToString();

                txtMob.Text = dr["Mob_Num"].ToString();
                //lblMob.Text = dr["mob_num"].ToString();
                txtEmail.Text = dr["Email"].ToString();
                txtAccountNum.Text = dr["Account"].ToString();
                txtAdd1.Text = dr["Address"].ToString();
                ddlState.SelectedValue = dr["State_Id"].ToString();
                ddlDist.SelectedValue = dr["district_Id"].ToString();
                txtPin.Text = dr["Pin_Code"].ToString();
                //lblStatus.Text = dr["acc_status"].ToString();
            }
        }
        private void loadDistrict()
        {
            try
            {
                //if (con.State == ConnectionState.Closed)
                //{
                con.Open();
                // }
                cmd = new SqlCommand("select * from district_master", con);

                dr = cmd.ExecuteReader();
                ddlDist.DataSource = dr;
                ddlDist.DataTextField = "district_Name";
                ddlDist.DataValueField = "district_Id";
                ddlDist.DataBind();
                ddlDist.Items.Insert(0, "-Select District-");
                // con.Close();
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

        private void loadState()
        {
            try
            {

                con.Open();
                //if (con.State == ConnectionState.Closed)
                //{
                //    con.Open();
                //}
                cmd = new SqlCommand("select * from state_master", con);

                dr = cmd.ExecuteReader();
                ddlState.DataSource = dr;
                ddlState.DataTextField = "State_Name";
                ddlState.DataValueField = "State_Id";
                ddlState.DataBind();
                ddlState.Items.Insert(0, "-Select State-");
                // con.Close();
            }
            catch (Exception ex) { throw ex; }

            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string UserEdit = Request.QueryString["UserEdit"];
                if (!string.IsNullOrEmpty(UserEdit) && UserEdit == "True")
                {
                    int activestatus = 0;
                    int isdelete = 0;
                    if (RadioButtonList2.SelectedItem.ToString() == "Active")
                    {
                        activestatus = 1;
                        isdelete = 0;
                    }
                    else
                    {
                        activestatus = 0;
                        isdelete = 1;
                    }
                    cmd = new SqlCommand("Update_account", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Name", txtFname.Text + " " + txtLname.Text);
                    cmd.Parameters.AddWithValue("@Meter_Type", RadioButtonList1.SelectedItem.ToString());

                    cmd.Parameters.AddWithValue("@Mob_Num", txtMob.Text);
                    //cmd.Parameters.AddWithValue("@Mob_Num", lblMob.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Account", txtAccountNum.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAdd1.Text + " " + txtAdd2.Text);
                    cmd.Parameters.AddWithValue("@Pin_Code", txtPin.Text);
                    cmd.Parameters.AddWithValue("@State_Id ", ddlState.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@district_Id", ddlDist.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@Is_Active", activestatus);
                    cmd.Parameters.AddWithValue("@is_Deleted", isdelete);
                }
                else
                {


                    cmd = new SqlCommand("add_account", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Name", txtFname.Text + " " + txtLname.Text);
                    cmd.Parameters.AddWithValue("@Meter_Type", RadioButtonList1.SelectedItem.ToString());
                    //cmd.Parameters.AddWithValue("@Mob_Num", lblMob.Text);
                    cmd.Parameters.AddWithValue("@Mob_Num", txtMob.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Account", txtAccountNum.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAdd1.Text + " " + txtAdd2.Text);
                    cmd.Parameters.AddWithValue("@Pin_Code", txtPin.Text);
                    cmd.Parameters.AddWithValue("@State_Id ", ddlState.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@district_Id", ddlDist.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@Is_Active", 1);
                    cmd.Parameters.AddWithValue("@is_Deleted", 0);
                }
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
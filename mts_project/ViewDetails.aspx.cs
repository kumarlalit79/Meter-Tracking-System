using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace mts_project
{
    public partial class ViewDetails : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Action = "";
                Action = Request.QueryString["Action"];
                //if (!string.IsNullOrEmpty(Action) && Action == "True")
                //{
                //    showDetails(Action);
                //}
                showDetails(Action);
            }
        }

        private void showDetails(string Action)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlCommand cmd = new SqlCommand("select_Bill_Details_by_Bill_Id", con);
            cmd.CommandType = CommandType.StoredProcedure;

            string Bill_Id = Session["Bill_Id"].ToString();
            cmd.Parameters.AddWithValue("@Bill_Id", Bill_Id);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblAccount.Text = dr["Account"].ToString();
                lblMeter.Text = dr["Meter_Type"].ToString();
                lblMob.Text = dr["Mob_Num"].ToString();
                lblBillDate.Text = dr["Bill_Date"].ToString();
                lblFromDate.Text = dr["From_Date"].ToString();
                lblTotalDays.Text = dr["Total_Day"].ToString();
                lblPreviousRDG.Text = dr["Previous_RDG"].ToString();
                lblTotal.Text = dr["Total_Bill_Unit"].ToString();
                lblCurrentBill.Text = dr["Current_Bill_Amount"].ToString();
                lblCurrentLps.Text = dr["Current_LPS"].ToString();
                lblName.Text = dr["Name"].ToString();
                lblDueDate.Text = dr["Due_Date"].ToString();
                lblToDate.Text = dr["To_Date"].ToString();
                lblDisconnectionDate.Text = dr["Disconnection"].ToString();
                lblPresentRGD.Text = dr["Present_RDG"].ToString();
                lblPrevBalance.Text = dr["Previous_Balance"].ToString();
                lblTotalBill.Text = dr["Total_bill"].ToString();
                lnbtnView.HRef = dr["Bill_Upload_Path"].ToString();
                txtdeposit.Text = dr["Bill_Deposit_AMT"].ToString();
                txtdepositdate.Text = dr["Bill_Deposit_Date"].ToString();


                if (!string.IsNullOrEmpty(Action) && Action == "True")
                {
                    divdeposit.Visible = false;
                }
                else
                {
                    divdeposit.Visible = true;
                }

                if (!string.IsNullOrEmpty(txtdeposit.Text))
                {
                    btnDeposite.Visible = false;

                }
                else
                {
                    btnDeposite.Visible = true;
                }

            }
        }

        protected void btnDeposite_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlCommand cmd = new SqlCommand("update_payement_on_BillDetail", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Bill_Deposit_AMT", txtdeposit.Text);
            cmd.Parameters.AddWithValue("@Bill_Deposit_Date", txtdepositdate.Text);

            string Bill_Id = Session["Bill_Id"].ToString();
            cmd.Parameters.AddWithValue("@Bill_Id", Bill_Id);

            Response.Write("<script>alert('Updated Successfully')</script>");

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                //  lblAccNum.Text = dr["Bill_Deposit_AMT"].ToString();
                // lblMobNum.Text = dr["Bill_Deposit_Date"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}
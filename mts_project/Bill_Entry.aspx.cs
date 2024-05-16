using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace mts_project
{
    public partial class Bill_Entry : System.Web.UI.Page
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
                        lblAccNum.Text = dr["Account"].ToString();
                        lblMobNum.Text = dr["Mob_Num"].ToString();
                        lblName.Text = dr["Name"].ToString();
                        lblEmail.Text = dr["Email"].ToString();
                        HdfAccNo.Value = dr["Account_id"].ToString();
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }
        }

        protected void txtFromDate_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(FileUpload1.FileName) && string.IsNullOrEmpty(HdfImg.Value))
            {
                // Image1.ImageUrl = FileUpload1.FileName;
                HdfImg.Value = FileUpload1.FileName;
            }
            if (!string.IsNullOrEmpty(txtFromDate.Text) && !string.IsNullOrEmpty(txtToDate.Text))
            {


                DateTime StartDate = DateTime.ParseExact(txtFromDate.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);

                DateTime EndDate = DateTime.ParseExact(txtToDate.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);

                TimeSpan difference = EndDate - StartDate;

                lblTotalDays.Text = (difference.Days + 1).ToString();
                // string dateToInsert = theDate.ToString("dd-MM-yyyy");
                // DateTime EndDate = DateTime.ParseExact(txtToDate.Text, "dd/MM/yyyy", null);
                //DateTime StartDate = DateTime.Parse(txtFromDate.Text);

                //lblTotalDays.Text = (EndDate - StartDate).TotalDays.ToString();
            }
        }

        protected void txtToDate_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(FileUpload1.FileName) && string.IsNullOrEmpty(HdfImg.Value))
            {
                //Image1.ImageUrl = FileUpload1.FileName;
                HdfImg.Value = FileUpload1.FileName;
            }
            if (!string.IsNullOrEmpty(txtFromDate.Text) && !string.IsNullOrEmpty(txtToDate.Text))
            {


                DateTime StartDate = DateTime.ParseExact(txtFromDate.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);

                DateTime EndDate = DateTime.ParseExact(txtToDate.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
                TimeSpan difference = EndDate - StartDate;
                lblTotalDays.Text = (difference.Days + 1).ToString();
            }
        }

        


        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

                //if (FileUpload1.HasFile)
                //{
                //    FileUpload1.SaveAs(MapPath("~/mydoc/" + FileUpload1.FileName));

                //}



                if (con.State == ConnectionState.Closed)
                    con.Open();
                //cmd = new SqlCommand("add_bill_details '"+ HdfAccNo.Value.ToString() + "','"+ txtBillDate.Text + "' ", con);
                cmd = new SqlCommand("add_bill_details", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Account_id", HdfAccNo.Value.ToString());
                cmd.Parameters.AddWithValue("@Bill_Date", txtBillDate.Text);
                cmd.Parameters.AddWithValue("@Due_Date ", txtDueDate.Text);
                cmd.Parameters.AddWithValue("@From_Date", txtFromDate.Text);
                cmd.Parameters.AddWithValue("@To_Date", txtToDate.Text);
                cmd.Parameters.AddWithValue("@Total_Day", lblTotalDays.Text);
                cmd.Parameters.AddWithValue("@Disconnection ", txtDisconnected.Text);
                cmd.Parameters.AddWithValue("@Previous_RDG", txtPrevRDG.Text);
                cmd.Parameters.AddWithValue("@Present_RDG", txtPresentRDG.Text);
                cmd.Parameters.AddWithValue("@Total_Bill_Unit", lblTotal.Text);
                cmd.Parameters.AddWithValue("@Bill_Upload_Path", "~/mydoc/" + FileUpload1.FileName);
                cmd.Parameters.AddWithValue("@Current_Bill_Amount", txtBilableAmt.Text);
                cmd.Parameters.AddWithValue("@Previous_Balance", txtPrevBalance.Text);
                cmd.Parameters.AddWithValue("@Current_LPS", txtCurrentLPS.Text);
                cmd.Parameters.AddWithValue("@Total_bill", txtTotalBill.Text);


                


                if (cmd.ExecuteNonQuery() > 0)
                {
                    Response.Redirect("Home.aspx");
                    
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
                    con.Close();
            }
        }

        protected void txtPrevRDG_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(FileUpload1.FileName) && string.IsNullOrEmpty(HdfImg.Value))
            {
                HdfImg.Value = FileUpload1.FileName;
            }
            if (!string.IsNullOrEmpty(txtPresentRDG.Text) && !string.IsNullOrEmpty(txtPrevRDG.Text))
            {
                lblTotal.Text = (int.Parse(txtPresentRDG.Text) - int.Parse(txtPrevRDG.Text)).ToString();
            }
        }

        protected void txtPresentRDG_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(FileUpload1.FileName) && string.IsNullOrEmpty(HdfImg.Value))
            {
                HdfImg.Value = FileUpload1.FileName;
            }
            if (!string.IsNullOrEmpty(txtPresentRDG.Text) && !string.IsNullOrEmpty(txtPrevRDG.Text))
            {
                lblTotal.Text = (int.Parse(txtPresentRDG.Text) - int.Parse(txtPrevRDG.Text)).ToString();
            }
        }

        protected void txtBilableAmt_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(FileUpload1.FileName) && string.IsNullOrEmpty(HdfImg.Value))
            {
                // Image1.ImageUrl = FileUpload1.FileName;
                HdfImg.Value = FileUpload1.FileName;
            }

            if (!string.IsNullOrEmpty(txtBilableAmt.Text) && !string.IsNullOrEmpty(txtPrevBalance.Text) && !string.IsNullOrEmpty(txtCurrentLPS.Text))
            {
                txtTotalBill.Text = (decimal.Parse(txtBilableAmt.Text) + decimal.Parse(txtPrevBalance.Text) + decimal.Parse(txtCurrentLPS.Text)).ToString();
            }
        }

        protected void txtPrevBalance_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(FileUpload1.FileName) && string.IsNullOrEmpty(HdfImg.Value))
            {
                //Image1.ImageUrl = FileUpload1.FileName;
                HdfImg.Value = FileUpload1.FileName;
            }
            if (!string.IsNullOrEmpty(txtBilableAmt.Text) && !string.IsNullOrEmpty(txtPrevBalance.Text) && !string.IsNullOrEmpty(txtCurrentLPS.Text))
            {
                txtTotalBill.Text = (decimal.Parse(txtBilableAmt.Text) + decimal.Parse(txtPrevBalance.Text) + decimal.Parse(txtCurrentLPS.Text)).ToString();
            }
        }

        protected void txtCurrentLPS_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(FileUpload1.FileName) && string.IsNullOrEmpty(HdfImg.Value))
            {
                //Image1.ImageUrl = FileUpload1.FileName;
                HdfImg.Value = FileUpload1.FileName;
            }
            if (!string.IsNullOrEmpty(txtBilableAmt.Text) && !string.IsNullOrEmpty(txtPrevBalance.Text) && !string.IsNullOrEmpty(txtCurrentLPS.Text))
            {
                txtTotalBill.Text = (decimal.Parse(txtBilableAmt.Text) + decimal.Parse(txtPrevBalance.Text) + decimal.Parse(txtCurrentLPS.Text)).ToString();
            }
        }

        

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        
    }
}
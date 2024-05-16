using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace mts_project
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Keys.Count > 0 && Session["Mob_Num"].ToString() != null)
            {

                if (!IsPostBack)
                {
                    bindYear();
                    showchart();
                    showLabel();
                    showData();

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
                        lblMob.Text = dr["Mob_Num"].ToString();
                        //  lblEmail.Text = dr["Email"].ToString();
                        lblAccount.Text = dr["Account"].ToString();
                        //lblAddress.Text = dr["fullAddress"].ToString();
                        //lblState.Text = dr["State_Name"].ToString();
                        //lblDistrict.Text = dr["district_Name"].ToString();
                        //lblPin.Text = dr["Pin_Code"].ToString();
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }
        }


        private void bindYear()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);



            SqlCommand cmd = new SqlCommand("select distinct CAST( Year(Bill_Date) as int) as Year1 from bill_details inner join account_detail  on bill_details.Account_id =  account_detail.Account_id where account_detail.Mob_Num='" + Session["Mob_Num"].ToString() + "' order by CAST( Year(Bill_Date) as int) desc", con);
            cmd.CommandType = CommandType.Text;
            // cmd.Parameters.AddWithValue("@Mob_Num",  Session["Mob_Num"].ToString());

            SqlDataAdapter da = new SqlDataAdapter(cmd);


            DataTable dt = new DataTable();

            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                ddlyear.DataSource = dt;
                ddlyear.DataTextField = "Year1";
                ddlyear.DataValueField = "Year1";
                ddlyear.DataBind();
            }

        }
        private void showchart()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Bind_Chart", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Mob_Num", Session["Mob_Num"].ToString());
            cmd.Parameters.AddWithValue("@Year", ddlyear.SelectedValue);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            //SqlDataAdapter da = new SqlDataAdapter("select * from account_detail where Mob_Num='" + lblMob.Text+"'", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            StringBuilder sb = new StringBuilder();
            //string chart = "<script> Highcharts.chart('container', { chart: { type: 'spline' }, title: { text: 'Monthly Unit' }, xAxis: { categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'], accessibility: { description: 'Months of the year' } }, yAxis: { title: { text: 'Unit' }, labels: { format: '{value}' } }, tooltip: { crosshairs: true, shared: true }, plotOptions: { spline: { marker: { radius: 4, lineColor: '#666666', lineWidth: 1 } } }, series: [{ name: 'MTS', marker: { symbol: 'square' }, data: [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, 22.8, 17.5, 12.1, 7.6] }] }); </script>";

            sb.Append("<script> Highcharts.chart('container', { chart: { type: 'spline' }, title: { text: '" + ddlyear.SelectedValue.ToString() + " - Monthly Unit' }, xAxis: { categories: [");
            string s = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (s == "")
                {
                    s = "'" + dt.Rows[i]["MonthName"].ToString() + "'";
                }
                else
                {
                    s = s + "," + "'" + dt.Rows[i]["MonthName"].ToString() + "'";

                }
            }
            sb.Append(s);
            sb.Append("], accessibility: { description: 'Months of the year' } }, yAxis: { title: { text: 'Unit' }, labels: { format: '{value}' } }, tooltip: { crosshairs: true, shared: true }, plotOptions: { spline: { marker: { radius: 4, lineColor: '#666666', lineWidth: 1 } } }, series: [{ name: 'Unit', marker: { symbol: 'square' }, data: [");

            string dataval = "";
            for (int j = 0; j < dt.Rows.Count; j++)
            {
                if (dataval == "")
                {
                    dataval = dt.Rows[j]["Total_Bill_Unit"].ToString();
                }
                else
                {
                    dataval = dataval + "," + dt.Rows[j]["Total_Bill_Unit"].ToString();
                }
            }
            sb.Append(dataval);
            sb.Append("] }] }); </script>");

            Literal1.Text = sb.ToString();
        }

        private void showLabel()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Bind_Deshbord", con);
            cmd.CommandType = CommandType.StoredProcedure;
            string mob_num = Session["Mob_Num"].ToString();
            cmd.Parameters.AddWithValue("@Mob_Num", mob_num);
            cmd.Parameters.AddWithValue("@year", ddlyear.SelectedValue);


            SqlDataAdapter da = new SqlDataAdapter(cmd);

            //SqlDataAdapter da = new SqlDataAdapter("select * from account_detail where Mob_Num='" + lblMob.Text+"'", con);

            DataTable dt = new DataTable();

            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                LblTotalRecord.Text = dt.Rows[0]["total_record"].ToString();
                if (dt.Rows.Count > 1)
                {
                    LblTotalDues.Text = dt.Rows[1]["total_dues"].ToString();
                }
                else
                {
                    LblTotalDues.Text = "N/A";
                }

                if (dt.Rows.Count > 2)
                {
                    LblLatestDues.Text = dt.Rows[2]["Upcoming_duesdate"].ToString();
                }
                else
                {
                    LblLatestDues.Text = "N/A";
                       
                }
                   
              
            }

        }

        private void showData()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

            if (con.State == ConnectionState.Closed) con.Open();

            SqlCommand cmd = new SqlCommand("select_Bill_Details", con);
            cmd.CommandType = CommandType.StoredProcedure;
            string mob_num = Session["Mob_Num"].ToString();
            cmd.Parameters.AddWithValue("@Mob_Num", mob_num);
            cmd.Parameters.AddWithValue("@Year", ddlyear.SelectedValue);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            //SqlDataAdapter da = new SqlDataAdapter("select * from account_detail where Mob_Num='" + lblMob.Text+"'", con);

            DataSet ds = new DataSet();

            da.Fill(ds);

            con.Close();

            gvMyAcc.DataSource = ds;
            gvMyAcc.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string Bill_Id = btn.CommandName.ToString();
            Session["Bill_Id"] = Bill_Id;
            Response.Redirect("ViewDetails.aspx?Action=True");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string Bill_Id = btn.CommandName.ToString();
            Session["Bill_Id"] = Bill_Id;
            Response.Redirect("ViewDetails.aspx");
        }
        protected void ddlyear_SelectedIndexChanged(object sender, EventArgs e)
        {
            showchart();
            showLabel();
            showData();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Database_Connectivity
{
    public partial class admin_dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            filltotalorder();
            filltotaluser();
            filltotalproduct();
            filltotalamount();

        }

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void filltotalorder()
        {
            getCon();
            string query = "SELECT COUNT(*) FROM Order_Tbl";
            cmd = new SqlCommand(query, con);
            int totalOrders = (int)cmd.ExecuteScalar();
            lblOrders.Text = totalOrders.ToString();

        }

        void filltotaluser()
        {
            getCon();
            string query = "SELECT COUNT(*) FROM emp_tbl";
            cmd = new SqlCommand(query, con);
            int totalUsers = (int)cmd.ExecuteScalar();
            lblUsers.Text = totalUsers.ToString();

        }

        void filltotalproduct()
        {
            getCon();
            string query = "SELECT COUNT(*) FROM Add_Products_Tbl";
            cmd = new SqlCommand(query, con);
            int totalProducts = (int)cmd.ExecuteScalar();
            lblProducts.Text = totalProducts.ToString();



        }


        void filltotalamount()
        {
            getCon();
            string query = "SELECT ISNULL(SUM(Quentity * Unit_Price), 0) FROM Order_Details_Tbl";
            cmd = new SqlCommand(query, con);
            decimal totalAmount = Convert.ToDecimal(cmd.ExecuteScalar());
            lblRevenue.Text = totalAmount.ToString();
            con.Close();
        }



    }
}

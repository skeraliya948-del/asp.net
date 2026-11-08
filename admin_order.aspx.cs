using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Database_Connectivity
{
    public partial class admin_order : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillGrid()
        {
            getCon();

            string query =
                "SELECT d.Order_Detail_Id, o.Order_No, " +
                "ISNULL(e.Name, 'Unknown') AS Name, " +
                "d.Product_Name AS Prod_Name, " +
                "d.Quentity, d.Unit_Price, " +
                "(d.Quentity * d.Unit_Price) AS Amount, " +
                "o.Order_Date, o.Ship_Address, " +
                "o.Pay_Method, o.Pay_Status, " +
                "ISNULL(o.Order_Status, 'Pending') AS Order_Status " +
                "FROM Order_Tbl o " +
                "INNER JOIN Order_Details_Tbl d ON o.Order_No = d.Order_No " +
                "LEFT JOIN emp_tbl e ON o.Order_User_Id = e.Id ";

            int orderNo;
            if (int.TryParse(Request.QueryString["orderno"], out orderNo) && orderNo > 0)
            {
                query += "WHERE o.Order_No = @filterOrderNo ";
            }

            query += "ORDER BY o.Order_Date DESC, d.Order_Detail_Id DESC";

            da = new SqlDataAdapter(query, con);
            if (int.TryParse(Request.QueryString["orderno"], out orderNo) && orderNo > 0)
            {
                da.SelectCommand.Parameters.AddWithValue("@filterOrderNo", orderNo);
            }

            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            if (ds.Tables[0].Rows.Count > 0)
                lblMessage.Text = "Order Details Loaded Successfully";
            else
                lblMessage.Text = "No Orders Found";

            con.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillGrid();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            fillGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int orderNo = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            DropDownList ddlPay =
                (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlPayStatus");
            DropDownList ddlOrder =
                (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlOrderStatus");

            if (ddlPay == null || ddlOrder == null)
            {
                lblMessage.Text = "Could not find the status dropdowns.";
                return;
            }

            getCon();
            string query = "UPDATE Order_Tbl SET Pay_Status = @pay, " +
                           "Order_Status = @status WHERE Order_No = @orderNo";

            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@pay", ddlPay.SelectedValue);
            cmd.Parameters.AddWithValue("@status", ddlOrder.SelectedValue);
            cmd.Parameters.AddWithValue("@orderNo", orderNo);
            cmd.ExecuteNonQuery();
            con.Close();

            GridView1.EditIndex = -1;
            fillGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            fillGrid();
        }
    }
}

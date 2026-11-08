using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Database_Connectivity
{
    public partial class ViewDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager
                    .ConnectionStrings["dbcon"]
                    .ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillDataList()
        {
            string pid = Request.QueryString["pid"];

            if (string.IsNullOrEmpty(pid))
            {
                return;
            }

            getCon();

            da = new SqlDataAdapter(
                "SELECT * FROM Add_Products_Tbl WHERE Prod_Id = " + pid,
                con
            );

            ds = new DataSet();

            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataList1.DataSource = ds;
                DataList1.DataBind();
            }

            con.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                fillDataList();
            }
        }
    }
}

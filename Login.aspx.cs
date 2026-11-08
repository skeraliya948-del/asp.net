using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Database_Connectivity
{
    public partial class login : System.Web.UI.Page
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                Response.Redirect("Add_Company.aspx");
            }
        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            if (!(string.IsNullOrEmpty(txtemail.Text)) && !(string.IsNullOrEmpty(txtpassword.Text)))
            {
                getCon();

                da = new SqlDataAdapter(
                    "SELECT * FROM emp_tbl WHERE Email='" + txtemail.Text + "' AND Password='" + txtpassword.Text + "'",
                    con
                );

                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["uid"] = ds.Tables[0].Rows[0]["Id"].ToString();
                    Session["admin"] = txtemail.Text;

                    Response.Redirect("Add_Company.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email or Password')</script>");
                }

               
            }
        }
    }
}

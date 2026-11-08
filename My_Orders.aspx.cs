using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Database_Connectivity
{
    public partial class My_Orders : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        int uid;

        decimal subtotal = 0;
        decimal delcharge = 0;
        decimal grandtotal = 0;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillCustomer()
        {
            getCon();

            da = new SqlDataAdapter(
                "SELECT * FROM emp_tbl WHERE Id = " + uid, con);

            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow r = ds.Tables[0].Rows[0];

                txtcustname.Text = r["Name"].ToString();
                txtemail.Text = r["Email"].ToString();
                txtmobile.Text = r["Mobile"].ToString();
            }

            con.Close();
        }

        void fillOrderNo()
        {
            getCon();

            cmd = new SqlCommand(
                "SELECT ISNULL(MAX(Order_No), 0) + 1 FROM Order_Tbl", con);

            txtordno.Text = cmd.ExecuteScalar().ToString();
            txtorddate.Text = DateTime.Now.ToString("dd/MM/yyyy");

            con.Close();
        }

        void fillGrid()
        {
            getCon();

            string query =
                "SELECT c.Cart_Prod_Id, p.Prod_Img, p.Prod_Name, " +
                "c.Quentity, p.Prod_Price, " +
                "(c.Quentity * p.Prod_Price) AS Total " +
                "FROM Cart_Tbl c " +
                "INNER JOIN Add_Products_Tbl p " +
                "ON c.Cart_Prod_Id = p.Prod_Id " +
                "WHERE c.Cart_User_Id = " + uid;

            da = new SqlDataAdapter(query, con);

            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            subtotal = 0;

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                decimal price = Convert.ToDecimal(row["Prod_Price"]);
                int qty = Convert.ToInt32(row["Quentity"]);

                subtotal += price * qty;
            }

            if (subtotal == 0 || subtotal >= 1000)
            {
                delcharge = 0;
            }
            else
            {
                delcharge = 50;
            }

            grandtotal = subtotal + delcharge;

            txtsubtotal.Text = subtotal.ToString("0.00");
            txtdelcharge.Text = delcharge.ToString("0.00");
            txtgrandtotal.Text = grandtotal.ToString("0.00");

            con.Close();
        }

        void fillPayStatus()
        {
            txtpaystatus.Text = "Pending";
            txtorderstatus.Text = "Pending";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            uid = Convert.ToInt32(Session["uid"]);

            if (!IsPostBack)
            {
                fillOrderNo();
                fillCustomer();
                fillGrid();
                fillPayStatus();
            }
        }

        protected void rblpay_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillPayStatus();
            fillGrid();
        }

        protected void btn_place_Click(object sender, EventArgs e)
        {
            if (txtaddress.Text.Trim() == "")
            {
                lblMessage.Text = "Please enter shipping address";
                return;
            }

            fillGrid();

            if (ds.Tables[0].Rows.Count == 0)
            {
                lblMessage.Text = "Your cart is empty";
                return;
            }

            DataTable cart = ds.Tables[0];

            getCon();

            SqlTransaction tr = con.BeginTransaction(IsolationLevel.Serializable);

            int orderNo = 0;
            bool saved = false;

            try
            {
                cmd = new SqlCommand(
                    "SELECT ISNULL(MAX(Order_No), 0) + 1 " +
                    "FROM Order_Tbl WITH (UPDLOCK, HOLDLOCK)",
                    con, tr);

                orderNo = Convert.ToInt32(cmd.ExecuteScalar());

                for (int i = 0; i < cart.Rows.Count; i++)
                {
                    int pid = Convert.ToInt32(cart.Rows[i]["Cart_Prod_Id"]);
                    int qty = Convert.ToInt32(cart.Rows[i]["Quentity"]);

                    string address = txtaddress.Text.Trim().Replace("'", "''");

                    string query =
                        "INSERT INTO Order_Tbl " +
                        "(Order_No, Order_User_Id, Order_Prod_Id, " +
                        "Quentity, Order_Date, Ship_Address, " +
                        "Pay_Method, Pay_Status, Order_Status) " +
                        "VALUES (" +
                        orderNo + "," +
                        uid + "," +
                        pid + "," +
                        qty + ",GETDATE(),'" +
                        address + "','" +
                        rblpay.SelectedValue + "','Pending','Pending')";

                    cmd = new SqlCommand(query, con, tr);
                    cmd.ExecuteNonQuery();
                }

                cmd = new SqlCommand(
                    "DELETE FROM Cart_Tbl WHERE Cart_User_Id = " + uid,
                    con, tr);

                cmd.ExecuteNonQuery();

                tr.Commit();
                saved = true;
            }
            catch (Exception ex)
            {
                if (tr.Connection != null)
                {
                    tr.Rollback();
                }

                lblMessage.Text = "Order could not be placed.";
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
            finally
            {
                con.Close();
            }

            if (saved)
            {
                Response.Redirect("admin_order.aspx?orderno=" + orderNo);
            }
        }
    }
}

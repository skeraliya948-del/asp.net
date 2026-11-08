using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace SweetDelights
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Returns the actual total item count from Cart_Tbl for the logged-in user.
        /// If user has no products or is not logged in, returns "0".
        /// </summary>
        public string GetCartCount()
        {
            if (Session["uid"] == null)
            {
                return "0";
            }

            try
            {
                string s = ConfigurationManager.ConnectionStrings["dbcon"]?.ConnectionString;
                if (string.IsNullOrEmpty(s))
                {
                    return "0";
                }

                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();
                    // Realistic count: total quantity of products currently in the user's cart
                    using (SqlCommand cmd = new SqlCommand("SELECT ISNULL(SUM(Quentity), 0) FROM Cart_Tbl WHERE Cart_User_Id = @uid", con))
                    {
                        cmd.Parameters.AddWithValue("@uid", Convert.ToInt32(Session["uid"]));
                        object res = cmd.ExecuteScalar();
                        if (res != null && res != DBNull.Value)
                        {
                            return res.ToString();
                        }
                    }
                }
            }
            catch
            {
                return "0";
            }

            return "0";
        }
    }
}

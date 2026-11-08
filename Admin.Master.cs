using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace SweetDelights
{
    public partial class AdminMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public string GetOrdersCount()
        {
            try
            {
                string s = ConfigurationManager.ConnectionStrings["dbcon"]?.ConnectionString;
                if (!string.IsNullOrEmpty(s))
                {
                    using (SqlConnection con = new SqlConnection(s))
                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Order_Tbl", con))
                        {
                            object res = cmd.ExecuteScalar();
                            if (res != null && res != DBNull.Value)
                            {
                                return res.ToString();
                            }
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

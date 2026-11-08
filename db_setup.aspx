<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();
                string sql = @"
                    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Order_Tbl')
                    BEGIN
                        CREATE TABLE Order_Tbl (
                            Order_Id INT IDENTITY(1,1) PRIMARY KEY,
                            Order_No INT NULL,
                            Order_User_Id INT NULL,
                            Order_Prod_Id INT NULL,
                            Quentity INT NULL DEFAULT 1,
                            Order_Date DATETIME NULL DEFAULT GETDATE(),
                            Ship_Address NVARCHAR(MAX) NULL,
                            Pay_Method NVARCHAR(50) NULL,
                            Pay_Status NVARCHAR(50) NULL DEFAULT 'Pending',
                            Order_Status NVARCHAR(50) NULL DEFAULT 'Pending'
                        );
                    END
                    ELSE
                    BEGIN
                        IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Order_Tbl') AND name = 'Order_Prod_Id')
                            ALTER TABLE Order_Tbl ADD Order_Prod_Id INT NULL;
                        IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Order_Tbl') AND name = 'Quentity')
                            ALTER TABLE Order_Tbl ADD Quentity INT NULL DEFAULT 1;
                        IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Order_Tbl') AND name = 'Order_No')
                            ALTER TABLE Order_Tbl ADD Order_No INT NULL;
                        IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Order_Tbl') AND name = 'Order_User_Id')
                            ALTER TABLE Order_Tbl ADD Order_User_Id INT NULL;
                        IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Order_Tbl') AND name = 'Order_Date')
                            ALTER TABLE Order_Tbl ADD Order_Date DATETIME NULL DEFAULT GETDATE();
                        IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Order_Tbl') AND name = 'Ship_Address')
                            ALTER TABLE Order_Tbl ADD Ship_Address NVARCHAR(MAX) NULL;
                        IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Order_Tbl') AND name = 'Pay_Method')
                            ALTER TABLE Order_Tbl ADD Pay_Method NVARCHAR(50) NULL;
                        IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Order_Tbl') AND name = 'Pay_Status')
                            ALTER TABLE Order_Tbl ADD Pay_Status NVARCHAR(50) NULL DEFAULT 'Pending';
                        IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Order_Tbl') AND name = 'Order_Status')
                            ALTER TABLE Order_Tbl ADD Order_Status NVARCHAR(50) NULL DEFAULT 'Pending';
                    END;

                    IF NOT EXISTS (SELECT 1 FROM Order_Tbl) AND EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Add_Products_Tbl')
                    BEGIN
                        DECLARE @firstProdId INT;
                        SELECT TOP 1 @firstProdId = Prod_Id FROM Add_Products_Tbl;
                        IF @firstProdId IS NOT NULL
                        BEGIN
                            INSERT INTO Order_Tbl (Order_No, Order_User_Id, Order_Prod_Id, Quentity, Order_Date, Ship_Address, Pay_Method, Pay_Status, Order_Status)
                            VALUES (1001, 1, @firstProdId, 1, GETDATE(), 'SweetDelights Bakery Store', 'Cash', 'Paid', 'Delivered');
                        END;
                    END;";

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }
        catch { }

        Response.Redirect("Admin_Dashboard.aspx");
    }
</script>

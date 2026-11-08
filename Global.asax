<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<script runat="server">
    private static bool _dbInitialized = false;
    private static readonly object _syncLock = new object();

    void Application_BeginRequest(object sender, EventArgs e)
    {
        if (_dbInitialized) return;

        lock (_syncLock)
        {
            if (_dbInitialized) return;

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["dbcon"] != null
                    ? ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString
                    : null;

                if (!string.IsNullOrEmpty(connStr))
                {
                    using (SqlConnection con = new SqlConnection(connStr))
                    {
                        con.Open();

                        string ddl = @"
                            -- 1. Ensure Order_Tbl exists and has all required columns
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

                            -- 2. If Order_Tbl is empty, insert a sample order so SUM does not return DBNull
                            IF NOT EXISTS (SELECT 1 FROM Order_Tbl) AND EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Add_Products_Tbl')
                            BEGIN
                                DECLARE @firstProdId INT;
                                SELECT TOP 1 @firstProdId = Prod_Id FROM Add_Products_Tbl;

                                IF @firstProdId IS NOT NULL
                                BEGIN
                                    INSERT INTO Order_Tbl (Order_No, Order_User_Id, Order_Prod_Id, Quentity, Order_Date, Ship_Address, Pay_Method, Pay_Status, Order_Status)
                                    VALUES (1001, 1, @firstProdId, 1, GETDATE(), 'SweetDelights Bakery Store, City Center', 'Cash', 'Paid', 'Delivered');
                                END;
                            END;";

                        using (SqlCommand cmd = new SqlCommand(ddl, con))
                        {
                            cmd.ExecuteNonQuery();
                        }
                    }

                    _dbInitialized = true;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("DB Setup Error: " + ex.Message);
            }
        }
    }
</script>

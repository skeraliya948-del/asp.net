-- ==============================================================
-- Database: SweetDelights_DB
-- Exact 6 Tables Schema Matching Visual Studio / Server Explorer
--
-- 1. Add_Company_Tbl
-- 2. Add_Products_Tbl
-- 3. Cart_Tbl
-- 4. emp_tbl
-- 5. Order_Tbl
-- 6. Order_Details_Tbl
-- ==============================================================

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'SweetDelights_DB')
BEGIN
    CREATE DATABASE SweetDelights_DB;
END
GO

USE SweetDelights_DB;
GO

-- Drop tables in reverse order of foreign keys if re-creating
IF OBJECT_ID('dbo.Order_Details_Tbl', 'U') IS NOT NULL DROP TABLE dbo.Order_Details_Tbl;
IF OBJECT_ID('dbo.Order_Tbl', 'U') IS NOT NULL DROP TABLE dbo.Order_Tbl;
IF OBJECT_ID('dbo.Cart_Tbl', 'U') IS NOT NULL DROP TABLE dbo.Cart_Tbl;
IF OBJECT_ID('dbo.Add_Products_Tbl', 'U') IS NOT NULL DROP TABLE dbo.Add_Products_Tbl;
IF OBJECT_ID('dbo.Add_Company_Tbl', 'U') IS NOT NULL DROP TABLE dbo.Add_Company_Tbl;
IF OBJECT_ID('dbo.emp_tbl', 'U') IS NOT NULL DROP TABLE dbo.emp_tbl;
GO

-- ==============================================================
-- 1. Add_Company_Tbl
-- ==============================================================
CREATE TABLE dbo.Add_Company_Tbl
(
    Comp_Id          INT IDENTITY(1,1) PRIMARY KEY,
    Comp_Name        NVARCHAR(150) NOT NULL,
    Comp_Owner_Name  NVARCHAR(150) NULL,
    Comp_Email       NVARCHAR(100) NULL,
    Comp_Address     NVARCHAR(250) NULL,
    Comp_Cover_Img   NVARCHAR(300) NULL,
    Comp_Image       NVARCHAR(300) NULL,
    Comp_Desc        NVARCHAR(MAX) NULL
);
GO

-- ==============================================================
-- 2. emp_tbl
-- ==============================================================
CREATE TABLE dbo.emp_tbl
(
    Id               INT IDENTITY(1,1) PRIMARY KEY,
    Name             NVARCHAR(100) NOT NULL,
    Gender           NVARCHAR(20)  NULL,
    Email            NVARCHAR(100) NOT NULL UNIQUE,
    Password         NVARCHAR(100) NOT NULL,
    City             NVARCHAR(100) NULL,
    Address          NVARCHAR(250) NULL,
    Mobile           NVARCHAR(30)  NULL,
    Image            NVARCHAR(300) NULL
);
GO

-- ==============================================================
-- 3. Add_Products_Tbl
-- ==============================================================
CREATE TABLE dbo.Add_Products_Tbl
(
    Prod_Id          INT IDENTITY(1,1) PRIMARY KEY,
    Prod_Comp_Id     INT NULL,
    Prod_Name        NVARCHAR(150) NOT NULL,
    Prod_Model       NVARCHAR(100) NULL,
    Prod_Desc        NVARCHAR(MAX) NULL,
    Prod_Weight      NVARCHAR(50)  NULL,
    Prod_Config      NVARCHAR(100) NULL,
    Prod_Img         NVARCHAR(300) NULL,
    Prod_Image       NVARCHAR(300) NULL,
    Prod_Price       DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Prod_Comp FOREIGN KEY (Prod_Comp_Id)
        REFERENCES dbo.Add_Company_Tbl(Comp_Id) ON DELETE SET NULL
);
GO

-- ==============================================================
-- 4. Cart_Tbl
-- ==============================================================
CREATE TABLE dbo.Cart_Tbl
(
    Cart_Id          INT IDENTITY(1,1) PRIMARY KEY,
    Cart_User_Id     INT NULL,
    Cart_Prod_Id     INT NOT NULL,
    Quentity         INT DEFAULT 1,
    AddedDate        DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Cart_User FOREIGN KEY (Cart_User_Id)
        REFERENCES dbo.emp_tbl(Id) ON DELETE CASCADE,
    CONSTRAINT FK_Cart_Prod FOREIGN KEY (Cart_Prod_Id)
        REFERENCES dbo.Add_Products_Tbl(Prod_Id) ON DELETE CASCADE
);
GO

-- ==============================================================
-- 5. Order_Tbl
-- ==============================================================
CREATE TABLE dbo.Order_Tbl
(
    Order_No         NVARCHAR(50) PRIMARY KEY,
    Order_User_Id    INT NULL,
    Order_Date       DATETIME DEFAULT GETDATE(),
    Ship_Address     NVARCHAR(300) NOT NULL,
    Pay_Method       NVARCHAR(50)  DEFAULT 'Card',
    Pay_Status       NVARCHAR(50)  DEFAULT 'Paid',
    Order_Status     NVARCHAR(50)  DEFAULT 'Placed',
    Subtotal         DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    Delivery_Charge  DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    Grand_Total      DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT FK_Order_User FOREIGN KEY (Order_User_Id)
        REFERENCES dbo.emp_tbl(Id) ON DELETE SET NULL
);
GO

-- ==============================================================
-- 6. Order_Details_Tbl
-- ==============================================================
CREATE TABLE dbo.Order_Details_Tbl
(
    Order_Detail_Id  INT IDENTITY(1,1) PRIMARY KEY,
    Order_No         NVARCHAR(50) NOT NULL,
    Order_Prod_Id    INT NULL,
    Product_Name     NVARCHAR(150) NOT NULL,
    Quentity         INT NOT NULL DEFAULT 1,
    Unit_Price       DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_OD_OrderNo FOREIGN KEY (Order_No)
        REFERENCES dbo.Order_Tbl(Order_No) ON DELETE CASCADE,
    CONSTRAINT FK_OD_Prod FOREIGN KEY (Order_Prod_Id)
        REFERENCES dbo.Add_Products_Tbl(Prod_Id) ON DELETE SET NULL
);
GO

-- ==============================================================
-- Sample Dummy Data
-- ==============================================================

-- 1. Company
INSERT INTO dbo.Add_Company_Tbl 
    (Comp_Name, Comp_Owner_Name, Comp_Email, Comp_Address, Comp_Cover_Img, Comp_Image, Comp_Desc)
VALUES
    (N'The Velvet Truffle Co.', N'Chef Marco Rossi', N'marco@velvettruffle.com', N'45 Cocoa Lane, Sweet Valley', N'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?auto=format&fit=crop&w=700&q=80', N'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=200&q=80', N'Specialists in rich Belgian cocoa and dark chocolate pastries.'),
    (N'La Petite Patisserie', N'Chef Monique Laurent', N'contact@lapetite.com', N'12 Rue de Pain, San Francisco', N'https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=700&q=80', N'https://images.unsplash.com/photo-1569864358642-9d1684040f43?auto=format&fit=crop&w=200&q=80', N'Authentic Paris-trained master pastry and French macaron house.');

-- 2. Employees / Users
INSERT INTO dbo.emp_tbl 
    (Name, Gender, Email, Password, City, Address, Mobile, Image)
VALUES
    (N'Admin User', N'Male', N'admin@sweetdelights.com', N'Admin@123', N'Sweet Valley', N'Admin HQ, Sweet Valley', N'9876543210', N'~/images/admin.jpg'),
    (N'Sarah Jenkins', N'Female', N'sarah@example.com', N'Sarah@123', N'Sweet Valley', N'742 Evergreen Terrace', N'9123456780', N'~/images/sarah.jpg');

-- 3. Products
INSERT INTO dbo.Add_Products_Tbl 
    (Prod_Comp_Id, Prod_Name, Prod_Model, Prod_Desc, Prod_Weight, Prod_Config, Prod_Img, Prod_Image, Prod_Price)
VALUES
    (1, N'Belgian Dark Chocolate Cake', N'Truffle-2024', N'Moist chocolate layers with 70% dark Belgian cocoa ganache.', N'1.0 kg', N'100% Eggless', N'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=600&q=80', N'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=600&q=80', 36.99),
    (2, N'Parisian Macaron Rainbow Box', N'Macaron-12', N'Box of 12 assorted French macarons with almond flour and fruit puree.', N'Box of 12', N'Contains Eggs', N'https://images.unsplash.com/photo-1569864358642-9d1684040f43?auto=format&fit=crop&w=600&q=80', N'https://images.unsplash.com/photo-1569864358642-9d1684040f43?auto=format&fit=crop&w=600&q=80', 24.99);

-- 4. Cart
INSERT INTO dbo.Cart_Tbl (Cart_User_Id, Cart_Prod_Id, Quentity)
VALUES (2, 1, 1);

-- 5. Order
INSERT INTO dbo.Order_Tbl 
    (Order_No, Order_User_Id, Ship_Address, Pay_Method, Pay_Status, Order_Status, Subtotal, Delivery_Charge, Grand_Total)
VALUES
    (N'SWD-2024-8901', 2, N'742 Evergreen Terrace, Sweet Valley', N'Card', N'Paid', N'In Oven', 36.99, 5.00, 41.99);

-- 6. Order Details
INSERT INTO dbo.Order_Details_Tbl 
    (Order_No, Order_Prod_Id, Product_Name, Quentity, Unit_Price)
VALUES
    (N'SWD-2024-8901', 1, N'Belgian Dark Chocolate Cake', 1, 36.99);
GO

-- Verify Count
SELECT 'Add_Company_Tbl' AS TableName, COUNT(*) AS RowsCount FROM dbo.Add_Company_Tbl
UNION ALL
SELECT 'emp_tbl', COUNT(*) FROM dbo.emp_tbl
UNION ALL
SELECT 'Add_Products_Tbl', COUNT(*) FROM dbo.Add_Products_Tbl
UNION ALL
SELECT 'Cart_Tbl', COUNT(*) FROM dbo.Cart_Tbl
UNION ALL
SELECT 'Order_Tbl', COUNT(*) FROM dbo.Order_Tbl
UNION ALL
SELECT 'Order_Details_Tbl', COUNT(*) FROM dbo.Order_Details_Tbl;
GO

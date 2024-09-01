
--===================================================================================================
                     --Creating Database for "Nursery Management System"
--===================================================================================================

USE master
IF DB_ID('NurseryManagementSystem_DB') IS NOT NULL
DROP DATABASE NurseryManagementSystem_DB
GO
--creating database with custom properties and storage default location
USE master
GO

DECLARE @data_path NVARCHAR(256)
SET @data_path = (SELECT SUBSTRING(physical_name,1, CHARINDEX(N'master.mdf',LOWER(physical_name)) -1)
                  FROM master.sys.master_files
		          WHERE database_id=1 and FILE_ID=1)
EXECUTE ('CREATE DATABASE NurseryManagementSystem_DB
        ON PRIMARY (name= NurseryManagementSystem_DB_data, filename=''' +@data_path+'NurseryManagementSystem_DB_data.mdf'',size=16MB,maxsize=unlimited, filegrowth=2MB)
		LOG ON (name= NurseryManagementSystem_DB_log, filename='''+ @data_path+'NurseryManagementSystem_DB_log.ldf'',size=10MB,maxsize=100MB,filegrowth=1MB)'
		)
GO

--===================================================================================================
                     --Creating Schema
--===================================================================================================
------Schema Creation
USE NurseryManagementSystem_DB
GO
CREATE SCHEMA nms
GO

--===================================================================================================
                     --Creating Tables
--===================================================================================================

-- Create the Categories table
USE NurseryManagementSystem_DB
CREATE TABLE nms.Categories (
    CategoryID INT PRIMARY KEY IDENTITY,
    CategoryName VARCHAR(255) NOT NULL,
    ParentCategoryID INT,
    FOREIGN KEY (ParentCategoryID) REFERENCES nms.Categories(CategoryID)
)
GO

-- Create the PlantSizes table
USE NurseryManagementSystem_DB
CREATE TABLE nms.PlantSizes (
    SizeID INT PRIMARY KEY IDENTITY,
    SizeName VARCHAR(255) NOT NULL,
    Description NVARCHAR(100)
)
GO

-- Create the PlantSources table
USE NurseryManagementSystem_DB
CREATE TABLE nms.PlantSources (
    SourceID INT PRIMARY KEY,
    SourceName VARCHAR(255) NOT NULL
)
GO

-- Create the PlantSourceDetails table
USE NurseryManagementSystem_DB
CREATE TABLE nms.PlantSourceDetails 
(
    SourceDetailID INT PRIMARY KEY IDENTITY,
    SourceID INT,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    IsOwnGrown BIT NOT NULL,
    IsForSale BIT NOT NULL,
    PurchasePrice DECIMAL(10, 2),
    FOREIGN KEY (SourceID) REFERENCES nms.PlantSources(SourceID)
)
GO

-- Create the Plants table
USE NurseryManagementSystem_DB
CREATE TABLE nms.Plants (
    PlantID INT PRIMARY KEY IDENTITY,
    PlantName VARCHAR(255) NOT NULL,
    Description TEXT,
    CategoryID INT NOT NULL,
    SubcategoryID INT,
    SizeID INT,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    DateAdded DATE,
    IsReadyForSale BIT,
    IsAvailableForRental BIT,
    SourceDetailID INT,
    FOREIGN KEY (CategoryID) REFERENCES nms.Categories(CategoryID),
    FOREIGN KEY (SubcategoryID) REFERENCES nms.Categories(CategoryID),
    FOREIGN KEY (SizeID) REFERENCES nms.PlantSizes(SizeID),
    FOREIGN KEY (SourceDetailID) REFERENCES nms.PlantSourceDetails(SourceDetailID)
)
GO

-- Create the Employees table
USE NurseryManagementSystem_DB
CREATE TABLE nms.Employees (
    EmployeeID INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    Phone VARCHAR(20),
    HireDate DATE,
    Role VARCHAR(50),
    Salary DECIMAL(10, 2)
)
GO

-- Create the Customers table
USE NurseryManagementSystem_DB
CREATE TABLE nms.Customers 
(
    CustomerID INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Address TEXT
)
GO

-- Create the Suppliers table
USE NurseryManagementSystem_DB
CREATE TABLE nms.Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY,
    SupplierName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Address TEXT
)
GO

-- Create the Products table
USE NurseryManagementSystem_DB
CREATE TABLE nms.Products (
    ProductID INT PRIMARY KEY IDENTITY,
    ProductName VARCHAR(255) NOT NULL,
    Description TEXT,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
)
GO

-- Create the PlantCareLogs table
USE NurseryManagementSystem_DB
CREATE TABLE nms.PlantCareLogs (
    LogID INT PRIMARY KEY IDENTITY,
    PlantID INT,
    EmployeeID INT,
    Action VARCHAR(50),
    ActionDate DATE,
    Notes TEXT,
    FOREIGN KEY (PlantID) REFERENCES NMS.Plants(PlantID),
    FOREIGN KEY (EmployeeID) REFERENCES nms.Employees(EmployeeID)
)
GO

-- Create the Inventory table
USE NurseryManagementSystem_DB
CREATE TABLE nms.Inventory (
    InventoryID INT PRIMARY KEY IDENTITY,
    ProductID INT,
    PlantID INT,
    QuantityInStock INT NOT NULL,
    LastUpdateDate DATE
)
GO

-- Create the InventoryAdjustments table
USE NurseryManagementSystem_DB
CREATE TABLE nms.InventoryAdjustments (
    AdjustmentID INT PRIMARY KEY IDENTITY,
    EmployeeID INT,
    InventoryID INT,
    AdjustmentDate DATE,
    QuantityAdjusted INT NOT NULL,
    Reason TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES nms.Employees(EmployeeID),
    FOREIGN KEY (InventoryID) REFERENCES nms.Inventory(InventoryID)
)
GO

-- Create the Sales table
USE NurseryManagementSystem_DB
CREATE TABLE nms.Sales (
    SaleID INT PRIMARY KEY IDENTITY,
    SaleDate DATE,
    EmployeeID INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES nms.Employees(EmployeeID)
)
GO

-- Create the SaleDetails table
USE NurseryManagementSystem_DB
CREATE TABLE nms.SaleDetails (
    SaleDetailID INT PRIMARY KEY IDENTITY,
    SaleID INT,
    ProductID INT,
    PlantID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    SubtotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (SaleID) REFERENCES nms.Sales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES nms.Products(ProductID),
    FOREIGN KEY (PlantID) REFERENCES nms.Plants(PlantID)
)
GO




-- Create the TransactionsInformation table
USE NurseryManagementSystem_DB
CREATE TABLE nms.TransactionsInformation (
    TransactionID INT PRIMARY KEY IDENTITY,
    TransactionDate DATE,
    TransactionType VARCHAR(50),
    ProductID INT,
    PlantID INT,
    Quantity INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES nms.Products(ProductID),
    FOREIGN KEY (PlantID) REFERENCES nms.Plants(PlantID)
)
GO
-- Create the RentalInformation table
USE NurseryManagementSystem_DB
CREATE TABLE nms.RentalInformation (
    RentalID INT PRIMARY KEY IDENTITY,
	TransactionID INT,
    PlantID INT,
	QuantityRented INT,
    CustomerID INT,
    EmployeeID INT,
    ContractStartDate DATE,
    ContractEndDate DATE,
    RentalStartDate DATE,
    RentalEndDate DATE,
	RentalStatus VARCHAR(50),
    RentalAmount DECIMAL(10, 2),
    FOREIGN KEY (PlantID) REFERENCES nms.Plants(PlantID),
    FOREIGN KEY (CustomerID) REFERENCES nms.Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES nms.Employees(EmployeeID),
	FOREIGN KEY (TransactionID) REFERENCES nms.TransactionsInformation(TransactionID)
)
GO

-- Create the AdditionalCosts table
USE NurseryManagementSystem_DB
CREATE TABLE nms.AdditionalCosts (
    CostID INT PRIMARY KEY IDENTITY,
    CostType VARCHAR(255) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    CostDate DATE,
    TransactionID INT,
    FOREIGN KEY (TransactionID) REFERENCES nms.TransactionsInformation(TransactionID)
)
GO

-- Create the PurchaseOrders table
USE NurseryManagementSystem_DB
CREATE TABLE nms.PurchaseOrders (
    PurchaseOrderID INT PRIMARY KEY IDENTITY,
    SupplierID INT,
    EmployeeID INT,
    OrderDate DATE,
    DeliveryDate DATE,
    FOREIGN KEY (SupplierID) REFERENCES nms.Suppliers(SupplierID),
    FOREIGN KEY (EmployeeID) REFERENCES nms.Employees(EmployeeID)
)
GO

-- Create the PurchaseOrderDetails table
USE NurseryManagementSystem_DB
CREATE TABLE nms.PurchaseOrderDetails (
    PurchaseOrderDetailID INT PRIMARY KEY IDENTITY,
    PurchaseOrderID INT,
	PlantID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PurchaseOrderID) REFERENCES nms.PurchaseOrders(PurchaseOrderID),
    FOREIGN KEY (ProductID) REFERENCES nms.Products(ProductID),
	FOREIGN KEY (PlantID) REFERENCES nms.Plants(PlantID)
)
GO

-- Create the Orders table
USE NurseryManagementSystem_DB
CREATE TABLE nms.Orders (
    OrderID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    SaleID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES nms.Customers(CustomerID),
    FOREIGN KEY (SaleID) REFERENCES nms.Sales(SaleID)
)
GO

-- Create the OrderDetails table
USE NurseryManagementSystem_DB
CREATE TABLE nms.OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    ProductID INT,
    PlantID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    SubTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES nms.Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES nms.Products(ProductID),
    FOREIGN KEY (PlantID) REFERENCES nms.Plants(PlantID)
)
GO

-- Create the EmployeeAttendance table
USE NurseryManagementSystem_DB
CREATE TABLE nms.EmployeeAttendance (
    AttendanceID INT identity,
    EmployeeID INT,
    AttendanceDate DATE,
    ClockInTime TIME,
    ClockOutTime TIME,
    FOREIGN KEY (EmployeeID) REFERENCES nms.Employees(EmployeeID),
	CONSTRAINT PK_EmployeeAttendance Primary key (AttendanceID)
)
GO

---Creating Table to insert after Trigger info
USE NurseryManagementSystem_DB
GO
CREATE TABLE nms.PlantChangeLog (
    LogID INT PRIMARY KEY IDENTITY,
    ChangeType VARCHAR(10) NOT NULL,  -- INSERT, UPDATE, DELETE
    PlantID INT,
    ChangeDate DATETIME,
)
GO
--===================================================================================================
                     --Alter Table
--===================================================================================================

USE NurseryManagementSystem_DB;
GO
ALTER TABLE nms.EmployeeAttendance
DROP CONSTRAINT PK_EmployeeAttendance;
GO
--===================================================================================================
                     --Creating Index Table
--===================================================================================================

-- Create a clustered index on SaleID column in NMS.Sales table
USE NurseryManagementSystem_DB
GO

CREATE CLUSTERED INDEX IX_EmployeeAttendance_AttendanceID
ON nms.EmployeeAttendance (AttendanceID);
GO

-- Create a non-clustered index on EmployeeID column in NMS.Employees table
USE NurseryManagementSystem_DB
GO

CREATE NONCLUSTERED INDEX IX_Employees_EmployeeID
ON nms.Employees (EmployeeID);
GO

--===================================================================================================
                     --Creating Functions
--===================================================================================================
---creating function to calculate total sales by month
USE NurseryManagementSystem_DB
GO
CREATE FUNCTION nms.TotalSalesByMonth(@year INT, @month INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @totalSales DECIMAL(10, 2);

    SELECT @totalSales = SUM(TotalAmount)
    FROM NMS.Sales
    WHERE YEAR(SaleDate) = @year AND MONTH(SaleDate) = @month;

    RETURN ISNULL(@totalSales, 0);
END
GO
SELECT nms.TotalSalesByMonth(2023, 10) AS TotalSalesNovember;
GO

------creating function to get available plants
USE NurseryManagementSystem_DB
GO
CREATE FUNCTION nms.GetAvailablePlants()
RETURNS TABLE
AS
RETURN (
    SELECT PlantID, PlantName, Description, UnitPrice
    FROM nms.Plants
    WHERE IsReadyForSale = 1
)
GO
 
------creating functions to observe employees performance over sales
USE NurseryManagementSystem_DB
GO
CREATE FUNCTION nms.GetEmployeeSalesPerformance(@employeeID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @totalSales DECIMAL(10, 2);

    SELECT @totalSales = SUM(TotalAmount)
    FROM nms.Sales
    WHERE EmployeeID = @employeeID;

    RETURN ISNULL(@totalSales, 0);
END;
GO

-- Create a function to calculate total sales for a specific year
USE NurseryManagementSystem_DB
GO
CREATE FUNCTION nms.TotalSalesByYear(@year INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @totalSales DECIMAL(10, 2);

    SELECT @totalSales = SUM(TotalAmount)
    FROM nms.Sales
    WHERE YEAR(SaleDate) = @year;

    RETURN ISNULL(@totalSales, 0);
END;
GO

--===================================================================================================
                     --- Creating Store Procedure
--===================================================================================================

-- Create a stored procedure for adding a new own grown plant
USE NurseryManagementSystem_DB
GO

CREATE PROCEDURE nms.AddOwnGrownPlant
(
    @PlantName VARCHAR(255),
    @Description TEXT,
    @CategoryID INT,
    @SubcategoryID INT,
    @SizeID INT,
    @UnitPrice DECIMAL(10, 2),
    @StockQuantity INT,
    @DateAdded DATE,
    @IsReadyForSale BIT,
    @IsAvailableForRental BIT,
    @EmployeeID INT
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert the plant into the Plants table
    INSERT INTO NMS.Plants (
        PlantName, Description, CategoryID, SubcategoryID, SizeID,
        UnitPrice, StockQuantity, DateAdded, IsReadyForSale, IsAvailableForRental
    )
    VALUES (
        @PlantName, @Description, @CategoryID, @SubcategoryID, @SizeID,
        @UnitPrice, @StockQuantity, @DateAdded, @IsReadyForSale, @IsAvailableForRental
    );

    DECLARE @NewPlantID INT;
    SET @NewPlantID = SCOPE_IDENTITY();

    -- Log the plant care action
    INSERT INTO nms.PlantCareLogs (
        PlantID, EmployeeID, Action, ActionDate, Notes
    )
    VALUES (
        @NewPlantID, @EmployeeID, 'Own Grown', GETDATE(), 'Own grown plant added to inventory'
    );

    -- Update the inventory with the new plant
    INSERT INTO nms.Inventory (ProductID, PlantID, QuantityInStock, LastUpdateDate)
    VALUES (NULL, @NewPlantID, @StockQuantity, GETDATE());
END;
GO


-----Store Procedure for Purchasing Items and distributing them
USE NurseryManagementSystem_DB
GO
CREATE PROCEDURE NMS.PurchasePlantsAndProducts
    @productID INT,
    @plantID INT,
    @quantity INT,
    @employeeID INT,
    @supplierID INT,
    @purchaseDate DATE
AS
BEGIN
    DECLARE @productName VARCHAR(255);
    DECLARE @plantName VARCHAR(255);
    DECLARE @totalCost DECIMAL(10, 2);

    -- Check if the product or plant exists
    IF @productID IS NOT NULL
    BEGIN
        SELECT @productName = ProductName, @totalCost = UnitPrice * @quantity
        FROM nms.Products
        WHERE ProductID = @productID;

        IF @productName IS NULL
        BEGIN
            PRINT 'Error: Invalid Product ID';
            RETURN;
        END;

        -- Update Products table with additional information
        UPDATE nms.Products
        SET StockQuantity = StockQuantity + @quantity
        WHERE ProductID = @productID;
    END

    IF @plantID IS NOT NULL
    BEGIN
        SELECT @plantName = PlantName, @totalCost = UnitPrice * @quantity
        FROM NMS.Plants
        WHERE PlantID = @plantID;

        IF @plantName IS NULL
        BEGIN
            PRINT 'Error: Invalid Plant ID';
            RETURN;
        END;

        -- Update Plants table with additional information
        UPDATE nms.Plants
        SET StockQuantity = StockQuantity + @quantity
        WHERE PlantID = @plantID;
    END

    -- Update inventory for products and plants
    UPDATE nms.Inventory
    SET QuantityInStock = QuantityInStock + @quantity,
        LastUpdateDate = @purchaseDate
    WHERE (ProductID = @productID AND @productID IS NOT NULL)
       OR (PlantID = @plantID AND @plantID IS NOT NULL);

    -- Log the transaction
    INSERT INTO nms.TransactionsInformation (TransactionDate, TransactionType, ProductID, PlantID, Quantity, Amount)
    VALUES (@purchaseDate, 'Buy', @productID, @plantID, @quantity, @totalCost);

    -- Record the purchase order
    INSERT INTO nms.PurchaseOrders (SupplierID, EmployeeID, OrderDate, DeliveryDate)
    VALUES (@supplierID, @employeeID, @purchaseDate, DATEADD(day, 7, @purchaseDate))

    DECLARE @purchaseOrderID INT;
    SET @purchaseOrderID = SCOPE_IDENTITY();

    -- Record purchase order details
    IF @productID IS NOT NULL
    BEGIN
        INSERT INTO nms.PurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, UnitPrice)
        VALUES (@purchaseOrderID, @productID, @quantity, (SELECT UnitPrice FROM NMS.Products WHERE ProductID = @productID));
    END

    IF @plantID IS NOT NULL
    BEGIN
        INSERT INTO nms.PurchaseOrderDetails (PurchaseOrderID, PlantID, Quantity, UnitPrice)
        VALUES (@purchaseOrderID, @plantID, @quantity, (SELECT UnitPrice FROM NMS.Plants WHERE PlantID = @plantID));
    END

    PRINT 'Purchase successful!';
END;
GO


--  stored procedure for selling plants and products and distribute them respectively	
USE NurseryManagementSystem_DB
GO
CREATE PROCEDURE nms.SellPlantsAndProducts
    @productID INT,
    @plantID INT,
    @quantity INT,
    @employeeID INT,
    @customerID INT,
    @saleDate DATE
AS
BEGIN
    DECLARE @productName VARCHAR(255);
    DECLARE @plantName VARCHAR(255);
    DECLARE @totalRevenue DECIMAL(10, 2);

    -- Check if the product or plant exists
    IF @productID IS NOT NULL
    BEGIN
        SELECT @productName = ProductName
        FROM nms.Products
        WHERE ProductID = @productID;

        IF @productName IS NULL
        BEGIN
            PRINT 'Error: Invalid Product ID';
            RETURN;
        END;
    END

    IF @plantID IS NOT NULL
    BEGIN
        SELECT @plantName = PlantName
        FROM nms.Plants
        WHERE PlantID = @plantID;

        IF @plantName IS NULL
        BEGIN
            PRINT 'Error: Invalid Plant ID';
            RETURN;
        END;
    END

    -- Check if there is sufficient stock
    IF EXISTS (
        SELECT 1
        FROM nms.Inventory
        WHERE (ProductID = @productID AND @productID IS NOT NULL)
           OR (PlantID = @plantID AND @plantID IS NOT NULL)
           AND QuantityInStock >= @quantity
    )
    BEGIN
        -- Calculate total revenue
        SET @totalRevenue = (
            SELECT SUM(UnitPrice * @quantity)
            FROM (
                SELECT UnitPrice
                FROM nms.Products
                WHERE ProductID = @productID
                UNION
                SELECT UnitPrice
                FROM nms.Plants
                WHERE PlantID = @plantID
            ) AS UnitPrices
        );
        -- Update inventory for products and plants
        UPDATE nms.Inventory
        SET QuantityInStock = QuantityInStock - @quantity,
            LastUpdateDate = @saleDate
        WHERE (ProductID = @productID AND @productID IS NOT NULL)
           OR (PlantID = @plantID AND @plantID IS NOT NULL);

        -- Log the transaction
        INSERT INTO nms.TransactionsInformation (TransactionDate, TransactionType, ProductID, PlantID, Quantity, Amount)
        VALUES (@saleDate, 'Sell', @productID, @plantID, @quantity, @totalRevenue);

        -- Record the sale
        INSERT INTO nms.Sales (SaleDate, EmployeeID, TotalAmount)
        VALUES (@saleDate, @employeeID, @totalRevenue);

        DECLARE @saleID INT;
        SET @saleID = SCOPE_IDENTITY();

        -- Record sale details
        IF @productID IS NOT NULL
        BEGIN
            INSERT INTO nms.SaleDetails (SaleID, ProductID, Quantity, UnitPrice, SubtotalAmount)
            VALUES (@saleID, @productID, @quantity, (SELECT UnitPrice FROM NMS.Products WHERE ProductID = @productID), @totalRevenue);
        END
        IF @plantID IS NOT NULL
        BEGIN
            INSERT INTO nms.SaleDetails (SaleID, PlantID, Quantity, UnitPrice, SubtotalAmount)
            VALUES (@saleID, @plantID, @quantity, (SELECT UnitPrice FROM NMS.Plants WHERE PlantID = @plantID), @totalRevenue);
        END

        PRINT 'Sale successful!';
    END
    ELSE
    BEGIN
        PRINT 'Error: Insufficient stock';
    END;
END;
Go


-- Create a stored procedure for adjusting inventory due to loss (plant death or wasted product)
USE NurseryManagementSystem_DB
GO
CREATE PROCEDURE nms.AdjustInventoryForLoss
    @productID INT,
    @plantID INT,
    @quantity INT,
    @employeeID INT,
    @adjustmentDate DATE,
    @reason TEXT
AS
BEGIN
    DECLARE @productName VARCHAR(255);
    DECLARE @plantName VARCHAR(255);

    -- Check if the product or plant exists
    IF @productID IS NOT NULL
    BEGIN
        SELECT @productName = ProductName
        FROM nms.Products
        WHERE ProductID = @productID;

        IF @productName IS NULL
        BEGIN
            PRINT 'Error: Invalid Product ID';
            RETURN;
        END;
    END

    IF @plantID IS NOT NULL
    BEGIN
        SELECT @plantName = PlantName
        FROM nms.Plants
        WHERE PlantID = @plantID;

        IF @plantName IS NULL
        BEGIN
            PRINT 'Error: Invalid Plant ID';
            RETURN;
        END;
    END

    -- Check if there is sufficient stock to adjust
    IF EXISTS (
        SELECT 1
        FROM nms.Inventory
        WHERE (ProductID = @productID AND @productID IS NOT NULL)
           OR (PlantID = @plantID AND @plantID IS NOT NULL)
           AND QuantityInStock >= @quantity
    )
    BEGIN
        -- Update inventory for products and plants
        UPDATE nms.Inventory
        SET QuantityInStock = QuantityInStock - @quantity,
            LastUpdateDate = @adjustmentDate
        WHERE (ProductID = @productID AND @productID IS NOT NULL)
           OR (PlantID = @plantID AND @plantID IS NOT NULL);

        -- Log the inventory adjustment
        INSERT INTO nms.InventoryAdjustments (EmployeeID, InventoryID, AdjustmentDate, QuantityAdjusted, Reason)
        VALUES (@employeeID, 
                (SELECT TOP 1 InventoryID FROM nms.Inventory WHERE ProductID = @productID OR PlantID = @plantID), 
                @adjustmentDate, 
                @quantity, 
                @reason);

        PRINT 'Inventory adjustment for loss successful!';
    END
    ELSE
    BEGIN
        PRINT 'Error: Insufficient stock to adjust';
    END;
END;
GO

USE NurseryManagementSystem_DB
GO
CREATE PROCEDURE nms.RentOutPlants
    @plantID INT,
    @quantityRented INT,
    @customerID INT,
    @employeeID INT,
    @ContractStartDate DATE,
    @ContractEndDate DATE,
    @rentalStartDate DATE,
    @rentalEndDate DATE,
    @rentalAmount DECIMAL(10, 2)
AS
BEGIN
    DECLARE @plantName VARCHAR(255);

    -- Check if the plant exists
    SELECT @plantName = PlantName
    FROM nms.Plants
    WHERE PlantID = @plantID;

    IF @plantName IS NULL
    BEGIN
        PRINT 'Error: Invalid Plant ID';
        RETURN;
    END;

    -- Check if there is sufficient stock to rent
    IF EXISTS (
        SELECT 1
        FROM nms.Inventory
        WHERE PlantID = @plantID AND QuantityInStock >= @quantityRented
    )
    BEGIN
        -- Update inventory for rented plants
        UPDATE nms.Inventory
        SET QuantityInStock = QuantityInStock - @quantityRented,
            LastUpdateDate = @rentalStartDate
        WHERE PlantID = @plantID;

        -- Record the rental transaction
        INSERT INTO nms.RentalInformation (PlantID, QuantityRented, CustomerID, EmployeeID,ContractStartDate,ContractEndDate, RentalStartDate, RentalEndDate, RentalStatus, RentalAmount)
        VALUES (@plantID, @quantityRented, @customerID, @employeeID,@ContractStartDate,@ContractEndDate,@rentalStartDate, @rentalEndDate, 'Rented Out', @rentalAmount);

        PRINT 'Plants rented out successfully!';
    END
    ELSE
    BEGIN
        PRINT 'Error: Insufficient stock to rent';
    END;
END;

GO



CREATE PROCEDURE nms.ReturnRentedPlants
    @rentalTransactionID INT,
    @employeeID INT,
    @returnDate DATE
AS
BEGIN
    DECLARE @plantID INT;
    DECLARE @quantityReturned INT;

    -- Retrieve rental information
    SELECT @plantID = PlantID, @quantityReturned = QuantityRented
    FROM nms.RentalInformation
    WHERE TransactionID = @rentalTransactionID;

    -- Update inventory for returned plants
    UPDATE nms.Inventory
    SET QuantityInStock = QuantityInStock + @quantityReturned,
        LastUpdateDate = @returnDate
    WHERE PlantID = @plantID;

    -- Update rental status
    UPDATE nms.RentalInformation
    SET RentalStatus = 'Returned', RentalEndDate = @returnDate
    WHERE TransactionID = @rentalTransactionID;

    PRINT 'Plants returned from rental successfully!';
END;
GO

--===================================================================================================
                     --- Creating Store Procedure
--===================================================================================================

-- Create a view to display detailed plant information with category name 
CREATE VIEW NMS.DetailedPlantView
--With Schemabinding
AS
SELECT
    P.PlantID,
    P.PlantName AS PlantName,
    P.Description AS PlantDescription,
    P.UnitPrice,
    P.StockQuantity,
    C.CategoryName
FROM
    nms.Plants AS P
    INNER JOIN nms.Categories AS C ON P.CategoryID = C.CategoryID
GO

--===================================================================================================
                     --- Creating After Trigger 
--===================================================================================================

USE NurseryManagementSystem_DB
GO
-- Create the trigger
CREATE TRIGGER nms.Plants_Trigger
ON nms.Plants
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ChangeType VARCHAR(10);

    -- Check the type of change
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        SET @ChangeType = 'UPDATE';
    ELSE IF EXISTS (SELECT * FROM inserted)
        SET @ChangeType = 'INSERT';
    ELSE IF EXISTS (SELECT * FROM deleted)
        SET @ChangeType = 'DELETE';

    -- Log the change in the PlantChangeLog table
    INSERT INTO nms.PlantChangeLog (ChangeType, PlantID, ChangeDate)
    SELECT
        @ChangeType,
        COALESCE(i.PlantID, d.PlantID),
        GETDATE()
    FROM
        inserted i
        FULL OUTER JOIN deleted d ON i.PlantID = d.PlantID;
END
GO
-------- Drop, Disable and Enable Trigger
--DROP TRIGGER trg_AfterUpdate
--GO

--ALTER TABLE sp.Scholarships DISABLE TRIGGER trg_AfterInsert
--GO

--ALTER TABLE sp.Scholarships ENABLE TRIGGER trg_AfterInsert
--GO

--===================================================================================================
                     --- Creating CTE
--===================================================================================================
-- Common Table Expression (CTE) to retrieve plant information with category details
WITH PlantInfoCTE AS (
    SELECT
        P.PlantID,
        P.PlantName AS PlantName,
        P.Description AS PlantDescription,
        P.CategoryID,
        C.CategoryName,
        P.SizeID,
        PS.SizeName,
        P.UnitPrice,
        P.StockQuantity,
        P.DateAdded,
        P.IsReadyForSale,
        P.IsAvailableForRental
    FROM
        nms.Plants P
    LEFT JOIN
        nms.Categories C ON P.CategoryID = C.CategoryID
    LEFT JOIN
        nms.PlantSizes PS ON P.SizeID = PS.SizeID
)
-- Query the CTE
SELECT *
FROM PlantInfoCTE
GO

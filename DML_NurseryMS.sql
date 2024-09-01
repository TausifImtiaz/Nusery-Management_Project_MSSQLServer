

--===================================================================================================
                     --Inserting Data Into Tables
--===================================================================================================
-- Insert sample data into Categories table
INSERT INTO nms.Categories ( CategoryName, ParentCategoryID) VALUES
    ('Flowering Plants', NULL),
    ('Foliage Plants', NULL),
    ('Succulents', NULL),
    ('Herbs', NULL),
    ('Shrubs', NULL),
    ('Fruits', NULL),  -- Category for fruits
    ('Roses', 1),  -- Subcategory of Flowering Plants
    ('Tulips', 1),  -- Subcategory of Flowering Plants
    ('Ferns', 2),   -- Subcategory of Foliage Plants
    ('Snake Plant', 2),  -- Subcategory of Foliage Plants
    ('Aloe Vera', 3),  -- Subcategory of Succulents
    ('Basil', 4),  -- Subcategory of Herbs
    ('Lavender', 4),  -- Subcategory of Herbs
    ('Apple', 6),  -- Subcategory of Fruits
    ('Orange', 6);  -- Subcategory of Fruits
GO

-- Insert sample data into PlantSizes table
INSERT INTO nms.PlantSizes (SizeName, Description) VALUES
     ('Small', 'Suitable for small indoor spaces'),
    ('Medium', 'Ideal for gardens and medium-sized spaces'),
    ('Large', 'Perfect for spacious gardens and landscapes'),
    ('X-Large', 'For large outdoor areas and landscapes'),
    ('Tiny', 'Compact size, suitable for small pots'),
    ('Huge', 'Massive size, suitable for large gardens'),
    ('Miniature', 'Small and decorative, great for tabletops'),
    ('Standard', 'Common size for various planting needs'),
    ('Giant', 'Extra-large size, makes a statement in landscapes'),
    ('Dwarf', 'Compact and slow-growing, suitable for small gardens'),
    ('Tall', 'Tall and elegant, great for vertical landscaping'),
    ('Low', 'Low-growing, ideal for ground cover'),
    ('Bushy', 'Compact and densely branched, great for hedges'),
    ('Columnar', 'Tall and narrow, suitable for narrow spaces'),
    ('Spreading', 'Wide-spreading, ideal for ground cover');
GO

-- Insert sample data into PlantSources table
INSERT INTO nms.PlantSources (SourceID, SourceName) VALUES
    (1, 'Local Grown'),
    (2, 'Imported')
GO

-- Insert sample data into PlantSourceDetails table
INSERT INTO nms.PlantSourceDetails ( SourceID, Name, Description, IsOwnGrown, IsForSale, PurchasePrice) VALUES
        (1, 'Local Nursery', 'Local nursery-grown plants', 1, 1, 15.00),
    (1, 'Green Thumb Growers', 'High-quality plants from Green Thumb Growers', 0, 1, 20.00),
    (1, 'Botanical Gardens', 'Plants from the Botanical Gardens', 0, 1, 25.00),
    (1, 'Home Garden', 'Plants grown in a home garden', 1, 0, NULL),
    (1, 'Exotic Plants', 'Rare and exotic plants collection', 0, 1, 30.00),
    (1, 'Local Farmers Market', 'Plants from local farmers market', 0, 1, 18.00),
    (1, 'Community Garden', 'Plants from the community garden', 1, 1, 22.00),
    (1, 'Seeds of Bangladesh', 'Plant seeds originating from Bangladesh', 1, 0, NULL),
    (2, 'Tropical Plants', 'Plants from tropical regions', 0, 1, 28.00),
    (1, 'Bonsai Nursery', 'Specialized in bonsai plants', 1, 1, 35.00);

GO

-- Insert sample data into Plants table
INSERT INTO nms.Plants ( PlantName, Description, CategoryID, SubcategoryID, SizeID, UnitPrice, StockQuantity, DateAdded, IsReadyForSale, IsAvailableForRental) VALUES
        ('Rose', 'Beautiful red flowers', 1, 2,1, 10.99, 50, '2023-01-01', 1, 1),
    ('Sunflower', 'Bright yellow petals', 1, 3,2, 8.99, 30, '2023-01-02', 1, 1 ),
    ('Tulip', 'Colorful spring flowers', 1, 2,3, 12.99, 40, '2023-01-03', 1, 1 ),
    ('Bamboo', 'Green leafy plant', 2, 4, 15.99,1, 20, '2023-01-04', 1, 1),
    ('Fern', 'Beautiful green foliage', 2, 3,6, 9.99, 25, '2023-01-05', 1, 1 ),
    ('Lavender', 'Aromatic purple flowers', 1, 2,4, 11.99, 35, '2023-01-06', 1, 1 ),
    ('Daisy', 'Classic white petals', 1, 2, 9,10.99, 30, '2023-01-07', 1, 1),
    ('Aloe Vera', 'Succulent plant with medicinal properties', 3, 2,5, 14.99, 15, '2023-01-08', 1, 1 ),
    ('Money Plant', 'Symbol of good luck', 2, 3,8, 12.99, 20, '2023-01-09', 1, 1),
    ('Orchid', 'Elegant and exotic flowers', 1, 4,3, 18.99, 15, '2023-01-10', 1, 1),
    ('Cactus', 'Prickly but low-maintenance', 2, 4,1, 11.99, 25, '2023-01-11', 1, 1),
    ('Mint', 'Refreshing herb', 3, 2,9, 8.99, 30, '2023-01-12', 1, 1),
    ('Snake Plant', 'Tolerant to low light conditions', 2, 3,5, 14.99, 18, '2023-01-13', 1, 1),
    ('Chrysanthemum', 'Colorful and vibrant flowers', 1, 3, 10, 13.99, 22, '2023-01-14', 1, 1),
    ('Spider Plant', 'Air-purifying plant', 2, 2,11, 9.99, 28, '2023-01-15', 1, 1),
    ('Jasmine', 'Fragrant white flowers', 1, 3,14, 12.99, 20, '2023-01-16', 1, 1),
    ('Pothos', 'Heart-shaped leaves', 2, 2,8, 10.99, 25, '2023-01-17', 1, 1),
    ('Peace Lily', 'Elegant white blooms', 1, 3,6, 15.99, 15, '2023-01-18', 1, 1),
    ('Bougainvillea', 'Vibrant and colorful flowers', 1, 4,7, 17.99, 18, '2023-01-19', 1, 1),
    ('Daffodil', 'Yellow spring flowers', 1, 2,5, 11.99, 30, '2023-01-20', 1, 1)

GO

-- Insert sample data into Employees table
INSERT INTO nms.Employees ( FirstName, LastName, Email, Phone, HireDate, Role, Salary) VALUES
       ('Md.', 'Rahman', 'md.rahman@example.com', '+8801712345678', '2023-11-18', 'Manager', 50000),
    ('Fatima', 'Khatun', 'fatima.khatun@example.com', '+8801812345678', '2023-11-18', 'Sales Associate', 30000),
    ('Abdul', 'Ali', 'abdul.ali@example.com', '+8801912345678', '2023-11-18', 'Gardener', 25000),
    ('Tasnim', 'Ahmed', 'tasnim.ahmed@example.com', '+8801512345678', '2023-11-18', 'Nursery Assistant', 20000),
    ('Ayesha', 'Khan', 'ayesha.khan@example.com', '+8801412345678', '2023-11-18', 'Cashier', 28000),
    ('Mizanur', 'Rahman', 'mizanur.rahman@example.com', '+8801312345678', '2023-11-18', 'Plant Care Specialist', 35000),
    ('Nazia', 'Begum', 'nazia.begum@example.com', '+8801212345678', '2023-11-18', 'Sales Associate', 30000)
GO

-- Insert sample data into Customers table
INSERT INTO nms.Customers (FirstName, LastName, Email, Phone, Address) VALUES
    ('Md.', 'Rahman', 'md.rahman@mail.com', '01711223344', 'Dhaka, Bangladesh'),
    ('Sadia', 'Akter', 'sadia.akter@mail.com', '01987654321', 'Chittagong, Bangladesh')
GO

-- Insert sample data into Suppliers table
INSERT INTO nms.Suppliers ( SupplierName, ContactName, Email, Phone, Address) VALUES
    ('Green World', 'Ali Ahmed', 'greenworld@mail.com', '01876543210', 'Dhaka, Bangladesh'),
    ('Global Plants', 'Mohan Das', 'globalplants@mail.com', '01612345678', 'Chittagong, Bangladesh')
GO

-- Insert sample data into Products table
INSERT INTO nms.Products (ProductName, Description, UnitPrice, StockQuantity) VALUES
    ('Potting Soil', 'Rich and fertile soil for plants', 15.00, 100),
    ('Fertilizer', 'Promotes healthy plant growth', 10.00, 80),
    ('Seeds Pack', 'Assorted flower seeds', 5.00, 50)
GO

-- Insert sample data into Sales table
INSERT INTO nms.Sales ( SaleDate, EmployeeID, TotalAmount) VALUES
    ('2023-05-01', 2, 150.00),
    ('2023-05-03', 2, 90.00)
GO

-- Insert sample data into SaleDetails table
INSERT INTO nms.SaleDetails ( SaleID, ProductID, PlantID, Quantity, UnitPrice, SubtotalAmount) VALUES
    (1, 1, NULL, 5, 15.00, 75.00),
    (1, 2, NULL, 2, 20.00, 40.00),
    (2, 3, NULL, 10, 5.00, 50.00)
GO

-- Insert sample data into TransactionsInformation table
INSERT INTO nms.TransactionsInformation (TransactionDate, TransactionType, ProductID, PlantID, Quantity, Amount) VALUES
    ('2023-05-01', 'Buy', 1, NULL, 10, 150.00),
    ('2023-05-03', 'Buy', 2, NULL, 5, 50.00),
    ('2023-06-05', 'Rent', NULL, 4, 1, 20.00),
    ('2023-06-15', 'Rent', NULL, 3, 1, 15.00)
GO
select * from nms.TransactionsInformation
-- Insert sample data into RentalInformation table
INSERT INTO nms.RentalInformation (TransactionID, PlantID, QuantityRented, CustomerID, EmployeeID, ContractStartDate, ContractEndDate, RentalStartDate,RentalEndDate,RentalStatus, RentalAmount) VALUES
    (6,4,1, 1, 2, '2023-06-01', '2023-12-01', '2023-06-05', '2023-06-15', 'Rented', 15),
    (7,3,1, 2, 2, '2023-05-01', '2024-11-01', '2023-06-05', '2023-06-15', 'Rented', 20)
GO


-- Insert sample data into AdditionalCosts table
INSERT INTO nms.AdditionalCosts ( CostType, Amount, CostDate, TransactionID) VALUES
    ('Transportation', 10.00, '2023-05-01', 5),
    ('Packaging', 5.00, '2023-05-03', 6)
GO

-- Insert sample data into PurchaseOrders table
INSERT INTO nms.PurchaseOrders (SupplierID, EmployeeID, OrderDate, DeliveryDate) VALUES
    ( 1, 1, '2023-04-01', '2023-04-10'),
    (2, 1, '2023-05-01', '2023-05-10')
GO

-- Insert sample data into PurchaseOrderDetails table
INSERT INTO nms.PurchaseOrderDetails ( PurchaseOrderID,PlantID, ProductID, Quantity, UnitPrice) VALUES
    (1,1, 1, 20, 10.00),
    (2,2, 3, 15, 3.00)
GO

-- Insert sample data into Orders table
INSERT INTO nms.Orders ( CustomerID, SaleID, OrderDate) VALUES
    (1, 1, '2023-05-01'),
    (2, 2, '2023-05-03')
GO

-- Insert sample data into OrderDetails table
INSERT INTO nms.OrderDetails ( OrderID, ProductID, PlantID, Quantity, UnitPrice, SubTotal) VALUES
    (1, 1, NULL, 5, 15.00, 75.00),
    (2, 2, NULL, 2, 20.00, 40.00)
GO

-- Insert sample data into Inventory table
INSERT INTO nms.Inventory ( ProductID, PlantID, QuantityInStock, LastUpdateDate) VALUES
    (1, NULL, 100, '2023-04-15'),
    (2, NULL, 80, '2023-05-05'),
    (NULL, 1, 50, '2023-04-20'),
    (NULL, 2, 30, '2023-05-15')
GO

-- Insert sample data into InventoryAdjustments table
INSERT INTO nms.InventoryAdjustments ( EmployeeID, InventoryID, AdjustmentDate, QuantityAdjusted, Reason) VALUES
    (1, 1, '2023-05-01', 10, 'Restocking'),
    (1, 2, '2023-05-03', -5, 'Damaged items')
GO

-- Insert sample data into PlantCareLogs table
INSERT INTO nms.PlantCareLogs ( PlantID, EmployeeID, Action, ActionDate, Notes) VALUES
    ( 1, 1, 'Watering', '2023-05-02', 'Watered with fertilizer'),
    ( 2, 1, 'Pruning', '2023-05-05', 'Trimmed excess branches'),
    ( 3, 2, 'Fertilizing', '2023-06-10', 'Applied orchid fertilizer')
GO

-- Insert sample data into EmployeeAttendance table
INSERT INTO nms.EmployeeAttendance ( EmployeeID, AttendanceDate, ClockInTime, ClockOutTime) VALUES
    (1, '2023-05-01', '09:00:00', '18:00:00'),
    (2, '2023-05-03', '10:00:00', '17:00:00');
GO

--===================================================================================================
                     --- Calling functions
--===================================================================================================

SELECT EmployeeID, nms.GetEmployeeSalesPerformance(EmployeeID) AS TotalSales
FROM nms.Employees;
GO

DECLARE @year INT;
SET @year = 2023

-- Call the function
DECLARE @totalSales DECIMAL(10, 2);
SET @totalSales = nms.TotalSalesByYear(@year);

-- Display the result
SELECT 'Total Sales for ' + CAST(@year AS VARCHAR) + ': ' + CAST(@totalSales AS VARCHAR) AS Result;
go

--===================================================================================================
                     --- correlated subquery
--===================================================================================================

-- Create a correlated subquery to find plants in stock with a price higher than the average price
SELECT
    PlantID,
    PlantName,
    UnitPrice,
    StockQuantity
FROM
    nms.Plants P
WHERE
    UnitPrice > (SELECT AVG(UnitPrice) FROM nms.Plants)  -- Correlated subquery
    AND EXISTS (
        SELECT 1
        FROM nms.Inventory I
        WHERE P.PlantID = I.PlantID
        AND I.QuantityInStock > 0
    )
go

--===================================================================================================
                     --- Query using various Clauses and Aggregate Functions 
--===================================================================================================

-- Comprehensive SQL query using various clauses
SELECT 
    C.CategoryID,
    C.CategoryName,
    COUNT(P.PlantID) AS TotalPlants,
    AVG(P.UnitPrice) AS AveragePrice,
    MAX(P.UnitPrice) AS HighestPriceS
FROM
    NMS.Categories C
    INNER JOIN nms.Plants P ON C.CategoryID = P.CategoryID
    INNER JOIN nms.Inventory I ON P.PlantID = I.PlantID
WHERE
    I.QuantityInStock > 0
GROUP BY
    C.CategoryID, C.CategoryName
HAVING
    AVG(P.UnitPrice) > 50  -- Adjust the threshold as needed
ORDER BY
    AveragePrice DESC
go

--===================================================================================================
                       -- Cube Query, ISNULL , CAST
--===================================================================================================

USE NurseryManagementSystem_DB
SELECT
    ISNULL(CAST(CategoryID AS VARCHAR(255)), 'All Categories') AS Category,
    ISNULL(CAST(SizeID AS VARCHAR(255)), 'All Sizes') AS Size,
    ISNULL(CAST(IsReadyForSale AS VARCHAR(255)), 'All Sales Status') AS SalesStatus,
    COUNT(*) AS TotalPlants
FROM
    nms.Plants
GROUP BY
    CategoryID, SizeID, IsReadyForSale
WITH CUBE
GO

--===================================================================================================
                                 --- Rollup Query
--===================================================================================================

USE NurseryManagementSystem_DB
SELECT
    ISNULL(CAST(CategoryID AS VARCHAR(255)), 'All Categories') AS Category,
    ISNULL(CAST(SizeID AS VARCHAR(255)), 'All Sizes') AS Size,
    ISNULL(CAST(IsReadyForSale AS VARCHAR(255)), 'All Sales Status') AS SalesStatus,
    COUNT(*) AS TotalPlants
FROM
    nms.Plants
GROUP BY
    CategoryID, SizeID, IsReadyForSale
WITH ROLLUP
GO

--===================================================================================================
                                 --- Query
--===================================================================================================

-- Query for plants ready for sale
USE NurseryManagementSystem_DB
SELECT
    PlantID,
    PlantName AS PlantName,
    'Ready for Sale' AS PlantStatus
FROM
    nms.Plants
WHERE
    IsReadyForSale = 1

UNION

-- Query for plants available for rental
SELECT
    PlantID,
    PlantName AS PlantName,
    'Available for Rental' AS PlantStatus
FROM
    nms.Plants
WHERE
    IsAvailableForRental = 1

GO

-- Select distinct values from the PlantNames column in the Plants table
SELECT DISTINCT PlantName
FROM nms.Plants
GO

--================================================================================================================
--									CAST,CONVERT,TRY_CONVERT
--================================================================================================================

SELECT 'Today :' + CAST(GETDATE() AS VARCHAR)
SELECT 'Today :' + CONVERT(VARCHAR, GETDATE(),1)  AS VARCHARDATE_1
SELECT 'Today :' + TRY_CONVERT (VARCHAR, GETDATE(), 7) AS VARCHARDATE_07
SELECT 'Today :' + TRY_CONVERT (VARCHAR, GETDATE(), 10) AS VARCHARDATE_10
SELECT 'Today :' + TRY_CONVERT (VARCHAR, GETDATE(), 12) AS VARCHARDATE_12
GO


Select DATEDIFF (yy, CAST('10/12/1990' as datetime), GETDATE()) As Years,
DATEDIFF (MM, CAST('10/12/1990' as datetime), GETDATE()) As Months,
DATEDIFF (DD, CAST('10/12/1990' as datetime), GETDATE ()) As Days
GO

--================================================================================================================
--									   DATE/TIME Function
--================================================================================================================

-- DATE/TIME Function- 
SELECT DATEDIFF(yy, CAST('02/09/2020' AS Datetime), GETDATE()) AS YEARS
SELECT DATEDIFF(MM, CAST('01/09/2021' AS Datetime), GETDATE()) %12 AS Months
SELECT DATEDIFF(DD, CAST('02/09/2021' AS Datetime), GETDATE())%30 AS YEARS
GO

--Isdate
SELECT ISDATE('2030-10-21')
--Datepart
SELECT DATEPART(MONTH,'2030-07-21')
--Datename
SELECT DATENAME(MONTH,'2030-01-21')
--Sysdatetime
SELECT Sysdatetime()
--UTC
SELECT GETUTCDATE()
--Datediff
SELECT DATEDIFF (YEAR, '2015-12-01', '2016-09-30')
GO

--================================================================================================================
--                                        MATHEMATICAL OPERATOR
--================================================================================================================

SELECT 500+3916 as [Sum]
GO
SELECT 4067-1535 as [Substraction]
GO
SELECT 3.14*3 as [Multiplication]
GO
SELECT 39/2 as [Divide]
GO
SELECT 100%3 as [Remainder]
GO
--================================================================================================================
--                                        EXECUTING PROCEDURES
--================================================================================================================
exec nms.RentOutPlants 1,5,1,2,'2023-04-01','2023-04-08',1500
GO
exec nms.AdjustInventoryForLoss 2,NULL,2,2,'2023-04-11','Broken'
GO
exec nms.SellPlantsAndProducts 1,2,14,2,2,'2023-05-05'
GO
exec nms.PurchasePlantsAndProducts NULL,2,7,1,2,'2023-03-11'
GO
exec nms.ReturnRentedPlants 4,2,'2023-06-15'
GO
exec nms.AddOwnGrownPlant 'Golap','Nice',2,1,2,200,54,'02/5/2020',1,1,2
go


----------------
SELECT * FROM nms.Inventory
SELECT * FROM nms.InventoryAdjustments
SELECT * FROM nms.SaleDetails
SELECT * FROM nms.Sales
SELECT * FROM nms.TransactionsInformation
SELECT * FROM nms.Inventory
SELECT * FROM nms.RentalInformation
SELECT * FROM nms.PurchaseOrderDetails
SELECT * FROM nms.DetailedPlantView
SELECT * FROM nms.PlantChangeLog
SELECT * FROM nms.Plants
GO

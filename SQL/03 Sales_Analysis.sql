-- KPI SALES ANYALSIS --

-- Total Sales -- 

SELECT SUM(Sales) AS TotalSale FROM Superstore

-- Total Profit --

SELECT SUM(Profit) AS TotalProfit FROM Superstore
 
-- Total Orders --

SELECT COUNT( DISTINCT Order_ID) AS TotalOrders FROM Superstore

-- Total Quantity Sold --

SELECT SUM(Quantity) AS TotalQuantitySold FROM Superstore

-- Average Order Value --

SELECT SUM(Sales) / COUNT(DISTINCT Order_ID) AS AOV FROM Superstore

-- TOP 10 Selling Product --

SELECT TOP 10 Product_Name, SUM(Sales) AS TotalSales
FROM Superstore GROUP BY Product_Name ORDER BY TotalSales DESC

-- TOP 10 Profitable Product --

SELECT TOP 10 Product_Name, SUM(Profit) AS TotalProfit
FROM Superstore GROUP BY Product_Name ORDER BY TotalProfit DESC

-- LOSS MAKING PRODUCT --

SELECT Product_Name , SUM(Profit) AS TotalProfit  
FROM Superstore GROUP BY Product_Name HAVING SUM(Profit) < 0 ORDER BY TotalProfit 

-- Category wise Discount Impact on Profit --

SELECT
    Category,
    Discount,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM Superstore
GROUP BY
    Category,
    Discount
ORDER BY
    Category,
    Discount;


-- Stored Procedure --

CREATE PROCEDURE sp_RegionSales (
@Region nvarchar(50) )
AS
BEGIN
SELECT Region, State,
SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit FROM Superstore
WHERE Region = @Region GROUP BY Region, State ORDER BY TotalSales DESC
END;

-- executing SP --

EXEC sp_RegionSales @Region = 'west'
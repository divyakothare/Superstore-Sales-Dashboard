-- 1. Sales Summary VIEW --

CREATE VIEW VW_Sales_Summary AS
SELECT Order_ID, Order_Date, Customer_ID, Customer_Name, Region, Category, Sub_Category,
Product_Name,Sales,Quantity,Profit,Discount FROM Superstore


-- 2. Product Performance VIEW --

CREATE VIEW VW_Product_Performance AS
SELECT Product_Name, Category, Sub_Category ,
SUM(Sales) AS TotalSale ,
SUM(Profit) AS TotalProfit,
SUM(Quantity) AS TotalQuantitySale
FROM Superstore GROUP BY Product_Name, Category, Sub_Category 


-- 3. Regional Sales VIEW --

CREATE VIEW VW_Regional_Sales AS
SELECT Region, State, City,
SUM(Sales) AS TotalSale ,
SUM(Profit) AS TotalProfit FROM Superstore 
GROUP BY Region, State, City 
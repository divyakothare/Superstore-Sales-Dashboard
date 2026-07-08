-- checking null values --

SELECT SUM(
CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS OrderID_NULL,
SUM(
CASE WHEN Customer_Name IS NULL THEN 1 ELSE 0 END) AS CustomerName_NULL,
SUM(
CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Sales_NULL,
SUM(
CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Profit_NULL
FROM Superstore

-- checking duplicate orders --

SELECT Order_ID, Product_ID , COUNT(*) AS DuplicateCount
FROM Superstore GROUP BY Order_ID, Product_ID HAVING COUNT(*) > 1
select * from superstore

-- remove true duplicate recoords using cte --

WITH DuplicateRecords AS
(
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY
               Order_ID,
               Product_ID,
               Sales,
               Quantity,
               Discount,
               Profit
               ORDER BY Row_ID
           ) AS RN
    FROM Superstore
)
DELETE FROM DuplicateRecords
WHERE RN > 1;

-- checking blank values --

SELECT * FROM Superstore 
WHERE Customer_Name = '' OR Product_Name = ''

-- checking negative sales --

SELECT * FROM Superstore WHERE Sales < 0

-- checking nagative profit--

SELECT * FROM Superstore WHERE Discount < 0 AND Discount > 1

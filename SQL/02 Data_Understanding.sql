-- displaying entire dataset--
SELECT * FROM Superstore

-- TOTAL records count --
SELECT COUNT(*) FROM Superstore

-- first 5 records --
SELECT TOP 5 * FROM Superstore

-- distinct product --
SELECT DISTINCT(Product_name) FROM Superstore

-- distinct categories --
SELECT DISTINCT(Category) FROM Superstore

-- distinct regions -- 
SELECT DISTINCT(Region) FROM Superstore

-- date range --
SELECT MIN(Order_date) AS startdate, 
MAX(Order_date) AS enddate
FROM Superstore
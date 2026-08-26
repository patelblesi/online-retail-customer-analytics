-- ============================================================
-- ONLINE RETAIL CUSTOMER & SALES ANALYTICS
-- SQL Analysis
-- ============================================================

-- 1. Preview the dataset
SELECT TOP 10 *
FROM OnlineRetail;


-- 2. Total number of transactions
SELECT 
    COUNT(*) AS Total_Transactions
FROM OnlineRetail;


-- 3. Total revenue
SELECT
    SUM(Quantity * UnitPrice) AS Total_Revenue
FROM OnlineRetail
WHERE Quantity > 0
  AND UnitPrice > 0;


-- 4. Revenue by country
SELECT
    Country,
    SUM(Quantity * UnitPrice) AS Revenue
FROM OnlineRetail
WHERE Quantity > 0
  AND UnitPrice > 0
GROUP BY Country
ORDER BY Revenue DESC;


-- 5. Top 10 products by revenue
SELECT TOP 10
    Description,
    SUM(Quantity * UnitPrice) AS Revenue
FROM OnlineRetail
WHERE Quantity > 0
  AND UnitPrice > 0
GROUP BY Description
ORDER BY Revenue DESC;


-- 6. Top 10 products by quantity sold
SELECT TOP 10
    Description,
    SUM(Quantity) AS Units_Sold
FROM OnlineRetail
WHERE Quantity > 0
GROUP BY Description
ORDER BY Units_Sold DESC;


-- 7. Monthly revenue trend
SELECT
    YEAR(InvoiceDate) AS Sales_Year,
    MONTH(InvoiceDate) AS Sales_Month,
    SUM(Quantity * UnitPrice) AS Revenue
FROM OnlineRetail
WHERE Quantity > 0
  AND UnitPrice > 0
GROUP BY
    YEAR(InvoiceDate),
    MONTH(InvoiceDate)
ORDER BY
    Sales_Year,
    Sales_Month;


-- 8. Customer-level revenue
SELECT
    CustomerID,
    SUM(Quantity * UnitPrice) AS Customer_Revenue
FROM OnlineRetail
WHERE CustomerID IS NOT NULL
  AND Quantity > 0
  AND UnitPrice > 0
GROUP BY CustomerID
ORDER BY Customer_Revenue DESC;


-- 9. Number of unique customers
SELECT
    COUNT(DISTINCT CustomerID) AS Unique_Customers
FROM OnlineRetail
WHERE CustomerID IS NOT NULL;


-- 10. Average order value
SELECT
    SUM(Quantity * UnitPrice) /
    COUNT(DISTINCT InvoiceNo) AS Average_Order_Value
FROM OnlineRetail
WHERE Quantity > 0
  AND UnitPrice > 0;


-- ============================================================
-- END OF ANALYSIS
-- ============================================================
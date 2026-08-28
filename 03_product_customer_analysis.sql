--Q1. Which product has the highest total quantity sold?
SELECT StockCode,
       SUM(Quantity) AS total_quantity
FROM online_retail
GROUP BY StockCode
ORDER BY total_quantity DESC
LIMIT 1;
--Q2. What are the top 10 products by quantity sold?
SELECT StockCode,
       SUM(Quantity) AS total_quantity
FROM online_retail
GROUP BY StockCode
ORDER BY total_quantity DESC
LIMIT 10;
--Q3. What are the top 10 products by revenue?
SELECT StockCode,
       SUM(Quantity * UnitPrice) AS revenue
FROM online_retail
GROUP BY StockCode
ORDER BY revenue DESC
LIMIT 10;
--Q4. Which product appears in the highest number of different invoices?
SELECT StockCode,
       COUNT(DISTINCT InvoiceNo) AS invoice_count
FROM online_retail
GROUP BY StockCode
ORDER BY invoice_count DESC
LIMIT 1;
--Q5. Which customer purchased the highest total quantity of items?
SELECT CustomerID,
       SUM(Quantity) AS total_quantity
FROM online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY total_quantity DESC
LIMIT 1;

--Q6. Which product generated the highest total revenue?
SELECT StockCode, SUM(Quantity * UnitPrice) AS revenue
FROM online_retail 
GROUP BY StockCode
ORDER BY revenue DESC
LIMIT 1;

--Q7. Which product has the highest average UnitPrice?
SELECT StockCode , AVG(UnitPrice) as average_price
FROM online_retail
GROUP BY StockCode
ORDER BY average_price DESC
LIMIT 1;

--Q8. Which customer has spent the most money?
SELECT CustomerID,SUM(Quantity * UnitPrice) AS revenue
FROM online_retail
GROUP BY CustomerID
ORDER BY revenue DESC LIMIT 1;
--Q9. Which customer has placed the most orders?
ORDER BY orders  DESC LIMIT 1
--Q10. How many customers have made only one order?
SELECT  COUNT(*)
FROM(
	SELECT  CustomerID, COUNT(DISTINCT InvoiceNo)  AS orderS
	FROM online_retail
	WHERE CustomerID IS NOT NULL
	GROUP BY CustomerID
) AS customer_orders
WHERE orders = 1;
--Q1. Which country has the highest number of orders?SELECT Country,
       COUNT(DISTINCT InvoiceNo) AS total_orders
FROM online_retail
GROUP BY Country
ORDER BY total_orders DESC
LIMIT 1;
--Q2. Which country has the highest number of customers?
SELECT Country,
       COUNT(DISTINCT CustomerID) AS total_customers
FROM online_retail
GROUP BY Country
ORDER BY total_customers DESC
LIMIT 1;
--Q3. Which country has the highest average order value?
SELECT Country,
       AVG(order_revenue) AS average_order_value
FROM (
    SELECT Country,
           InvoiceNo,
           SUM(Quantity * UnitPrice) AS order_revenue
    FROM online_retail
    GROUP BY Country, InvoiceNo
) AS invoice_totals
GROUP BY Country
ORDER BY average_order_value DESC
LIMIT 1;
--Q4. Which country has the highest total quantity sold?
SELECT Country,
       SUM(Quantity) AS total_quantity
FROM online_retail
GROUP BY Country
ORDER BY total_quantity DESC
LIMIT 1;
--Q5. What is the running total of revenue by month?

SELECT month,
       monthly_revenue,
       SUM(monthly_revenue) OVER (
           ORDER BY month
       ) AS running_total
FROM (
    SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS month,
           SUM(Quantity * UnitPrice) AS monthly_revenue
    FROM online_retail
    GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
) AS monthly_sales
ORDER BY month;

--Q6. What are the top 10 countries by revenue?
SELECT COUNTRY , SUM(Quantity * UnitPrice) AS revenue
FROM online_retail
GROUP BY Country
ORDER BY revenue DESC
LIMIT 10
--Q7. What is the rank of each product by total revenue?
SELECT StockCode,
       revenue,
       RANK() OVER (ORDER BY revenue DESC) AS product_rank
FROM(
	SELECT StockCode ,SUM(Quantity * UnitPrice) AS revenue
	FROM online_retail
	GROUP BY StockCode
)AS prodect_revenue
--Q8. What is the rank of each customer by total spending?
SELECT CustomerID,
       revenue,
       RANK() OVER (ORDER BY revenue DESC) AS customer_rank
FROM(
	SELECT CustomerID ,SUM(Quantity * UnitPrice) AS revenue
	FROM online_retail
	GROUP BY CustomerID
)AS customer_revenue
--Q9. What percentage of the total revenue does each country contribute?

SELECT COUNTRY,SUM(Quantity * UnitPrice) AS country_revenue,
	SUM(Quantity * UnitPrice)/
	(SELECT SUM(Quantity * UnitPrice)
        FROM online_retail) * 100 AS revenue_percentage
FROM online_retail
GROUP BY COUNTRY;
--Q10. For each customer, what is their first purchase date and total number of orders?
SELECT
    CustomerID,
    MIN(InvoiceDate) AS first_purchase_date,
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID;
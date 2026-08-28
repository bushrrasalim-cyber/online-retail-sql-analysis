--Q1: What is the total revenue generated from all transactions?
SELECT SUM(Quantity * UnitPrice) FROM online_retail;
--Q2: What is the average transaction value?
SELECT AVG(total_revenue)
FROM(
	SELECT InvoiceNo, SUM(Quantity * UnitPrice) AS total_revenue
	FROM online_retail
	GROUP BY InvoiceNo) AS invoice_totals
--Q3: What is the total number of items sold?
SELECT SUM(Quantity) FROM online_retail;
--Q4: What is the average quantity of items per transaction record?
SELECT AVG(total_quantity)
FROM(
	SELECT InvoiceNo, SUM(Quantity) AS total_quantity
	FROM online_retail
	GROUP BY InvoiceNo) AS items_quantity
--Q5: What is the total revenue associated with cancelled invoices?
SELECT SUM(Quantity * UnitPrice) FROM online_retail WHERE InvoiceNo LIKE 'C%';
--Q6:Which month generated the highest revenue?
SELECT MONTH(InvoiceDate) AS month , SUM(Quantity * UnitPrice) AS revenue
FROM online_retail
GROUP BY month
ORDER BY revenue DESC LIMIT 1
--Q7: Which year generated the highest revenue?
SELECT YEAR(InvoiceDate) AS year , SUM(Quantity * UnitPrice) AS revenue
FROM online_retail
GROUP BY year
ORDER BY revenue DESC LIMIT 1;

--Q8: What is the average revenue generated per invoice/order?
SELECT AVG(total_revenue)
FROM(
	SELECT InvoiceNo, SUM(Quantity * UnitPrice) AS total_revenue
	FROM online_retail
	GROUP BY InvoiceNo) AS invoice_totals;

--Q9: Which invoice/order generated the highest revenue?
SELECT InvoiceNo , SUM(Quantity * UnitPrice) AS revenue
FROM online_retail
GROUP BY InvoiceNo
ORDER BY revenue DESC LIMIT 1;
--Q10: What is the total revenue for each country?
SELECT COUNTRY, SUM(Quantity * UnitPrice) AS revenue
FROM online_retail
GROUP BY COUNTRY
--Q11: Which country generated the highest revenue?
SELECT COUNTRY, SUM(Quantity * UnitPrice) AS revenue
FROM online_retail
GROUP BY COUNTRY
ORDER BY revenue DESC LIMIT 1;
---Q12: What is the total revenue generated from all transactions excluding cancellations?
SELECT SUM(Quantity * UnitPrice) FROM online_retail WHERE InvoiceNo NOT LIKE 'C%';



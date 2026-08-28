-- Q1: How many total transaction records are in the dataset?
SELECT COUNT(*)
FROM online_retail;

--Q2: What is the earliest and latest transaction date?
SELECT MIN(InvoiceDate) , MAX(InvoiceDate) FROM online_retail;
--Q3:How many unique invoices/orders are there?
SELECT COUNT(DISTINCT InvoiceNo) FROM online_retail;
--Q4: How many unique products are in the dataset?
SELECT COUNT(DISTINCT StockCode) FROM online_retail;
--Q5: How many unique customers are in the dataset?
SELECT COUNT(DISTINCT CustomerID) FROM online_retail;
--Q6: How many different countries are represented?
SELECT COUNT(DISTINCT Country) FROM online_retail;
--Q7: How many transactions have a missing CustomerID?
SELECT COUNT(*) FROM online_retail WHERE CustomerID IS NULL OR CustomerID = '';
--Q8: What is the total quantity of items recorded?
SELECT SUM(Quantity) FROM online_retail;
--Q9: What are the minimum and maximum UnitPrice values?
SELECT MIN(UnitPrice), MAX(UnitPrice) FROM online_retail;
--Q10: How many transaction records have a negative Quantity?
SELECT COUNT(*) FROM online_retail WHERE Quantity < 0;
--Q11: How many invoices are cancellations?
SELECT COUNT(*) FROM online_retail WHERE InvoiceNo LIKE 'C%';
--Q12: How many records have a UnitPrice of 0?
SELECT COUNT(*) FROM online_retail WHERE UnitPrice = 0;


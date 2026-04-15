
-- ================================================
-- ETL Data Quality Monitoring - SQL Queries
-- Dataset: E-Commerce Sales Data
-- ================================================

-- 1. Total Records
SELECT COUNT(*) AS total_records 
FROM sales_data;

-- 2. Null Value Check
SELECT 
    SUM(CASE WHEN InvoiceNo IS NULL THEN 1 ELSE 0 END) AS null_invoice,
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS null_customer,
    SUM(CASE WHEN Description IS NULL THEN 1 ELSE 0 END) AS null_description,
    SUM(CASE WHEN UnitPrice IS NULL THEN 1 ELSE 0 END) AS null_price
FROM sales_data;

-- 3. Duplicate Records Check
SELECT InvoiceNo, StockCode, CustomerID, COUNT(*) AS duplicate_count
FROM sales_data
GROUP BY InvoiceNo, StockCode, CustomerID
HAVING COUNT(*) > 1;

-- 4. Negative Quantity Check (Returns)
SELECT COUNT(*) AS negative_quantity_records
FROM sales_data
WHERE Quantity < 0;

-- 5. Zero or Negative Price Check
SELECT COUNT(*) AS invalid_price_records
FROM sales_data
WHERE UnitPrice <= 0;

-- 6. KPI Summary
SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_revenue,
    ROUND(AVG(TotalPrice), 2) AS avg_order_value,
    COUNT(DISTINCT CustomerID) AS unique_customers,
    COUNT(DISTINCT Country) AS total_countries
FROM sales_data;

-- 7. Revenue by Country (Top 10)
SELECT Country, 
    ROUND(SUM(TotalPrice), 2) AS total_revenue
FROM sales_data
GROUP BY Country
ORDER BY total_revenue DESC
LIMIT 10;

-- 8. Monthly Revenue Trend
SELECT 
    strftime('%Y-%m', InvoiceDate) AS month,
    ROUND(SUM(TotalPrice), 2) AS monthly_revenue
FROM sales_data
GROUP BY month
ORDER BY month;

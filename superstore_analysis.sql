/*
=================================================
Project: Superstore Sales Analysis
Author: Melisa Demir
Tool: Google BigQuery
=================================================
*/

-- =============================================
-- DATA PROFILING
-- =============================================

-- Total Rows
SELECT COUNT(*) AS total_rows
FROM `melisa-project-496712.portfolio_projects.superstore`;

-- Unique Customers
SELECT COUNT(DISTINCT `Customer ID`) AS unique_customers
FROM `melisa-project-496712.portfolio_projects.superstore`;

-- Unique Orders
SELECT COUNT(DISTINCT `Order ID`) AS unique_orders
FROM `melisa-project-496712.portfolio_projects.superstore`;

-- =============================================
-- DATA QUALITY CHECKS
-- =============================================

-- NULL Check
SELECT
COUNTIF(Sales IS NULL) AS null_sales,
COUNTIF(Profit IS NULL) AS null_profit,
COUNTIF(`Customer ID` IS NULL) AS null_customer_id
FROM `melisa-project-496712.portfolio_projects.superstore`;

-- =============================================
-- BUSINESS ANALYSIS
-- =============================================

-- Sales by Category
SELECT
Category,
ROUND(SUM(Sales),2) AS total_sales
FROM `melisa-project-496712.portfolio_projects.superstore`
GROUP BY Category
ORDER BY total_sales DESC;

-- Profit by Category
SELECT
Category,
ROUND(SUM(Sales),2) AS total_sales,
ROUND(SUM(Profit),2) AS total_profit
FROM `melisa-project-496712.portfolio_projects.superstore`
GROUP BY Category
ORDER BY total_profit DESC;

-- Profit Margin by Category
SELECT
Category,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS profit_margin_pct
FROM `melisa-project-496712.portfolio_projects.superstore`
GROUP BY Category
ORDER BY profit_margin_pct DESC;

-- Technology Sub-Category Analysis
SELECT
`Sub-Category`,
ROUND(SUM(Sales),2) AS total_sales,
ROUND(SUM(Profit),2) AS total_profit
FROM `melisa-project-496712.portfolio_projects.superstore`
WHERE Category = 'Technology'
GROUP BY `Sub-Category`
ORDER BY total_profit DESC;
CREATE DATABASE FINANCIAL_ANALYSIS;
USE FINANCIAL_ANALYSIS;
SELECT COUNT(*) AS Total_Rows FROM `financial data set`;
SHOW TABLES;

# TOTAL REVENUE 
SELECT ROUND(SUM(Sales),2) AS Total_Revenue FROM `financial data set`;

# TOTAL PROFIT 
SELECT ROUND(SUM(Profit),2) AS Total_Profit FROM `financial data set`;
SELECT Sales, Profit
FROM `financial data set`
LIMIT 10;
DESCRIBE `financial data set`;

# TO FIX THE REVENUE 
SELECT
ROUND(
SUM(
CAST(
REPLACE(REPLACE(REPLACE(Sales,'?',''),',',''),' ','')
AS DECIMAL(15,2)
)
),2
) AS Total_Revenue
FROM `financial data set`;

# TO FIX THE PROFIT 
SELECT
ROUND(
SUM(
CAST(
REPLACE(REPLACE(REPLACE(Profit,'?',''),',',''),' ','')
AS DECIMAL(15,2)
)
),2
) AS Total_Profit
FROM `financial data set`;

#Revenue by Country
SELECT
Country,
ROUND(
SUM(
CAST(REPLACE(REPLACE(REPLACE(Sales,'?',''),',',''),' ','')
AS DECIMAL(15,2))
),2
) AS Revenue
FROM `financial data set`
GROUP BY Country
ORDER BY Revenue DESC;

#Profit by Product
SELECT
Product,
ROUND(
SUM(
CAST(REPLACE(REPLACE(REPLACE(Profit,'?',''),',',''),' ','')
AS DECIMAL(15,2))
),2
) AS Profit
FROM `financial data set`
GROUP BY Product
ORDER BY Profit DESC;

#Revenue by Segment
SELECT
Segment,
ROUND(
SUM(
CAST(REPLACE(REPLACE(REPLACE(Sales,'?',''),',',''),' ','')
AS DECIMAL(15,2))
),2
) AS Revenue
FROM `financial data set`
GROUP BY Segment
ORDER BY Revenue DESC;

#Top 5 Countries
SELECT
Country,
ROUND(
SUM(
CAST(REPLACE(REPLACE(REPLACE(Sales,'?',''),',',''),' ','')
AS DECIMAL(15,2))
),2
) AS Revenue
FROM `financial data set`
GROUP BY Country
ORDER BY Revenue DESC
LIMIT 5;

#Best Revenue Year
SELECT
Year,
ROUND(
SUM(
CAST(REPLACE(REPLACE(REPLACE(Sales,'?',''),',',''),' ','')
AS DECIMAL(15,2))
),2
) AS Revenue
FROM `financial data set`
GROUP BY Year
ORDER BY Revenue DESC;

#Best Revenue Month
SELECT
`Month Name`,
ROUND(
SUM(
CAST(REPLACE(REPLACE(REPLACE(Sales,'?',''),',',''),' ','')
AS DECIMAL(15,2))
),2
) AS Revenue
FROM `financial data set`
GROUP BY `Month Name`
ORDER BY Revenue DESC;

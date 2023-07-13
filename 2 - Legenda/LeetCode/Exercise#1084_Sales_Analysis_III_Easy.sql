-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 13-07-2023
-- Description:	1084. Sales Analysis III
-- Level:   Easy

--https://leetcode.com/problems/sales-analysis-iii/description/

/* Write your T-SQL query statement below */
SELECT DISTINCT B.product_id,A.product_name
FROM Product A
INNER JOIN Sales B on A.Product_id = B.product_id
WHERE DATEPART(QUARTER, B.sale_date) = 1
AND B.product_id Not in (Select Distinct Product_id FROM Sales Where DATEPART(QUARTER, sale_date) <> 1 )
Group By B.product_id,A.product_name,B.sale_date
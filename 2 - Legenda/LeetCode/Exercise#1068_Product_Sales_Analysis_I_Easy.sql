-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 17-07-2023
-- Description:	1068. Product Sales Analysis I
-- Level:   Easy

--https://leetcode.com/problems/product-sales-analysis-i/description/

/* Write your T-SQL query statement below */

SELECT B.product_name,A.year,A.price FROM Sales A
INNER JOIN Product B on A.product_id = B.Product_id
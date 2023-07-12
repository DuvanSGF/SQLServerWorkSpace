-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 12-07-2023
-- Description:	1070. Product Sales Analysis III
-- Level:   Medium

--https://leetcode.com/problems/product-sales-analysis-iii/

/* Write your T-SQL query statement below */

With Batman AS 
(
Select product_id, [Year] as first_year,quantity,price,
RANK() OVER   
    (PARTITION BY product_id ORDER BY Year ASC) AS Rank  
	FROM Sales
GROUP BY product_id,[Year],quantity,price
)

Select product_id,first_year,quantity,price from Batman Where Rank = 1
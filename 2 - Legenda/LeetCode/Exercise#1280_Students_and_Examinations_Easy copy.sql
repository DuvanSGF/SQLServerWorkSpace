-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 12-09-2023
-- Description:	1327. List the Products Ordered in a Period
-- Level:   Easy
-- =============================================

--https://leetcode.com/problems/list-the-products-ordered-in-a-period/description/

/* Write your T-SQL query statement below */
SELECT 
     A.product_name,Sum(unit) as unit 
FROM Products A
INNER JOIN Orders B on A.product_id = B.product_id
WHERE order_date Between '2020-02-01' and '2020-02-29' 
Group by A.product_name
Having Sum(unit) >= 100

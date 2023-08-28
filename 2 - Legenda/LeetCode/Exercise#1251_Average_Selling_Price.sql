-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 28-08-2023
-- Description:	1251. Average Selling Price
-- Level:   Easy
-- =============================================

--https://leetcode.com/problems/average-selling-price/description/

/* Write your T-SQL query statement below */
With BATMAN AS (
SELECT 
	 A.product_id
	,SUM(A.price*B.units) AS TotalPrice
	,SUM(B.units) as NumberProductsSold
FROM [dbo].[prices] A
INNER JOIN [dbo].[UnitsSold] B
ON A.product_id = B.product_id AND B.purchase_date BETWEEN A.start_date AND A.end_date
Group By A.product_id,A.price,B.units
)
SELECT  product_id, ROUND(SUM(TotalPrice)*1.00/SUM(NumberProductsSold),2) AS average_price FROM BATMAN
GROUP BY product_id

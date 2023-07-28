-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 28-07-2023
-- Description:	1164. Product Price at a Given Date
-- Level:   Medium

--https://leetcode.com/problems/product-price-at-a-given-date/description/

/* Write your T-SQL query statement below */
--SOLUTION 1 
SELECT 
	  product_id
	 ,new_price AS Price
FROM Products
WHERE change_date = CAST('2019-08-16' as date)
UNION
SELECT 
	  product_id
	 ,Max(new_price) AS Price
FROM Products
WHERE change_date < CAST('2019-08-16' as date)
AND product_id NOT IN (SELECT product_id FROM Products WHERE change_date = CAST('2019-08-16' as date))                                                            
GROUP BY product_id
UNION
SELECT 
	  product_id
	 ,10 AS Price
FROM Products
WHERE change_date > CAST('2019-08-16' as date)
	AND product_id NOT IN (SELECT product_id FROM Products WHERE change_date <= CAST('2019-08-16' as date))
GROUP BY product_id

--Solution2
WITH CTE AS (
		SELECT
			T1.*
		FROM
			Products T1
		INNER JOIN
			(
				SELECT	
					Product_id,
					MAX(change_date) as sdate
				FROM
					Products
				WHERE
					change_date <= '2019-08-16'
				GROUP BY
					Product_id
			)Sub ON T1.Product_id = Sub.Product_id
			AND	T1.change_date = Sub.sdate
	)
SELECT
	product_id,
	new_price price
FROM
	CTE
UNION ALL
SELECT DISTINCT
	product_id,
	10
FROM
	products P
WHERE
	p.product_id NOT IN (SELECT product_id FROM CTE)
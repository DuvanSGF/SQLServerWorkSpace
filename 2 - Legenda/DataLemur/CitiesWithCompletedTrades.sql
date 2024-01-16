-- =============================================
-- Author:	    Ing. Duván Albeiro Mejia Cortes
-- Create date: 16-01-2024
-- Description: Cities With Completed Trades [Robinhood SQL Interview Question]
-- Level:       Easy
-- Url:         https://datalemur.com/questions/completed-trades
-- ============================================= 


/* Write your T-SQL query statement below */
SELECT 
    B.city, 
    Count(B.city) AS total_orders 
FROM trades A
INNER  JOIN users B
    ON A.user_id = B.user_id
WHERE A.status = 'Completed'
GROUP BY B.city
ORDER BY 2 DESC
LIMIT 3 
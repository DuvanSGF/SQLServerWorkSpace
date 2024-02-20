-- =============================================
-- Author:	    Ing. Duván Albeiro Mejia Cortes
-- Create date: 19-02-2024
-- Description: User's Third Transaction
-- Level:       Medium
-- Url:         https://datalemur.com/questions/sql-third-transaction
-- ============================================= 


/* Write your T-SQL query statement below */
SELECT 
    B.user_id,
    A.spend,
    B.maxDate
FROM transactions A
INNER JOIN (
    SELECT user_id, MAX(transaction_date) AS maxDate
    FROM transactions
    GROUP BY user_id
    HAVING COUNT(*) > 2
) AS B
ON A.user_id = B.user_id AND A.transaction_date = B.maxDate;;


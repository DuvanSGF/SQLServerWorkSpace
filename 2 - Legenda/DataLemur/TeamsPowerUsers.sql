-- =============================================
-- Author:	    Ing. Duván Albeiro Mejia Cortes
-- Create date: 12-01-2024
-- Description: Teams Power Users [Microsoft SQL Interview Question]
-- Level:       Easy
-- Url:         https://datalemur.com/questions/teams-power-users
-- ============================================= 


/* Write your T-SQL query statement below */
--PostgresSQL
SELECT 
     sender_id,
     COUNT(sender_id) as count_messages
FROM messages
WHERE DATE_PART('month', sent_date::DATE) = 8 AND DATE_PART('year', sent_date::DATE) = '2022'
GROUP BY sender_id
ORDER BY 2 DESC
LIMIT 2;

--SQL Server
SELECT 
     sender_id,
     COUNT(sender_id) as count_messages
FROM messages
WHERE MONTH(sent_date) = 8 AND YEAR(sent_date) = 2022
GROUP BY sender_id
ORDER BY count_messages DESC
OFFSET 0 ROWS FETCH NEXT 2 ROWS ONLY;

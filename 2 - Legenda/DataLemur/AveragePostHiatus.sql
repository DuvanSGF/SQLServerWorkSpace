-- =============================================
-- Author:	    Ing. Duván Albeiro Mejia Cortes
-- Create date: 12-01-2024
-- Description: Average Post Hiatus (Part 1) [Facebook SQL Interview Question]
-- Level:       Easy
-- Url:         https://datalemur.com/questions/sql-average-post-hiatus-1
-- ============================================= 


/* Write your T-SQL query statement below */
--PostgresSQL
SELECT 
   user_id,
   EXTRACT(DAY FROM MAX(post_date) - MIN(post_date)) AS days_between
FROM posts
WHERE DATE_PART('year', post_date::DATE) = 2021 
GROUP BY user_id
HAVING COUNT(user_id) >1;

--SQL server
SELECT 
   userId ,
   DATEDIFF(DAY, min(datePost),  max(datePost)) AS DateDiff
   FROM exam
 WHERE Year(datePost) = '2021'
 GROUP BY userId
 HAVING COUNT(userId) > 1
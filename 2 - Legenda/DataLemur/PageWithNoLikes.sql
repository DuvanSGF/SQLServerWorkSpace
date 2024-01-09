-- =============================================
-- Author:	    Ing. Duván Albeiro Mejia Cortes
-- Create date: 09-01-2024
-- Description: Page With No Likes [Facebook SQL Interview Question]
-- Level:       Easy
-- Url:         https://datalemur.com/questions/sql-page-with-no-likes
-- ============================================= 


/* Write your T-SQL query statement below */
SELECT 
      A.page_id 
FROM pages A
LEFT JOIN page_likes B
      ON A.page_id = B.page_id
WHERE B.page_id IS NULL
ORDER BY B.page_id ASC

--This is not the only Solution
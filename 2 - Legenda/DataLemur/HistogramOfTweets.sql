-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 08-01-2024
-- Description:	Histogram of Tweet [Twitter SQL Interview Question]
-- Level:       Easy
-- Url:         https://datalemur.com/questions/sql-histogram-tweets
-- ============================================= 


/* Write your T-SQL query statement below */
SELECT 
      C.CountUser as tweet_bucket,
      Count(user_id) as users_num
FROM
(
  SELECT
        user_id, 
        COUNT(user_id) as CountUser 
  FROM tweets
  WHERE tweet_date Between '20220101' and '20220331'
  GROUP BY user_id) as C
GROUP BY C.CountUser

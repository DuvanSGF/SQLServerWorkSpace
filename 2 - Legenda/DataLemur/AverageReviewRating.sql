-- =============================================
-- Author:	    Ing. Duván Albeiro Mejia Cortes
-- Create date: 16-01-2024
-- Description: Average Review Ratings [Amazon SQL Interview Question]
-- Level:       Easy
-- Url:         https://datalemur.com/questions/sql-avg-review-ratings
-- ============================================= 


/* Write your T-SQL query statement below */
SELECT 
   EXTRACT(MONTH FROM (submit_date)) as mth,
   product_id 
  ,ROUND(AVG(stars),2) avg_stars
FROM reviews
GROUP BY 
   EXTRACT(MONTH FROM submit_date),
   product_id
ORDER BY 1, 2 ASC

-- =============================================
-- Author:	    Ing. Duván Albeiro Mejia Cortes
-- Create date: 10-01-2024
-- Description: Laptop vs. Mobile Viewership [New York Times SQL Interview Question]
-- Level:       Easy
-- Url:         https://datalemur.com/questions/laptop-mobile-viewership
-- ============================================= 


/* Write your T-SQL query statement below */
SELECT 
COUNT(device_type) AS laptop_views,
COUNT(device_type) + (SELECT Count(*) FROM viewership WHERE device_type = 'phone') AS mobile_views
  FROM viewership
WHERE device_type = 'laptop'
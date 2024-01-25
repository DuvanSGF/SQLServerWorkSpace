-- =============================================
-- Author:	    Ing. Duván Albeiro Mejia Cortes
-- Create date: 25-01-2024
-- Description: App Click-through Rate (CTR) [Facebook SQL Interview Question]
-- Level:       Easy
-- Url:         https://datalemur.com/questions/click-through-rate
-- ============================================= 


/* Write your T-SQL query statement below */
SELECT
  app_id,
  ROUND(
    100.0 * SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) /
           SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END),
    2
  ) AS ctr_app
FROM
  events
WHERE
  timestamp >= '2022-01-01'
  AND timestamp < '2023-01-01'
GROUP BY
  app_id;


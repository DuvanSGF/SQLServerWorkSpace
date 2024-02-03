-- =============================================
-- Author:	    Ing. Duván Albeiro Mejia Cortes
-- Create date: 02-02-2024
-- Description: Active User Retention [Facebook SQL Interview Question]
-- Level:       Hard
-- Url:         https://datalemur.com/questions/user-retention
-- ============================================= 


/* Write your T-SQL query statement below */
WITH MountBefore AS (
    SELECT user_id AS userID, event_date, (event_date - INTERVAL '1 month') AS Datebefore
    FROM user_actions
    WHERE EXTRACT(year FROM event_date) = 2022 AND EXTRACT(month FROM event_date) = 6
)

SELECT 7 AS month, COUNT(*) AS monthly_active_users
FROM (
    SELECT DISTINCT A.user_id AS monthly_active_users
    FROM user_actions A
    INNER JOIN MountBefore B ON B.userID = A.user_id
    GROUP BY A.user_id
) AS b;
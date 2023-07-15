-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 14-07-2023
-- Description:	511. Game Play Analysis I
-- Level:   Easy

--https://leetcode.com/problems/game-play-analysis-i/description/

/* Write your T-SQL query statement below */
SELECT 
    player_id,
    Min(event_date) AS first_login
FROM Activity
GROUP BY player_id
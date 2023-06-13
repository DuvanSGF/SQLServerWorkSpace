-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 13-06-2023
-- Description:	610. Triangle Judgement
-- Nivel: Easy
-- ============================================= 

--https://leetcode.com/problems/triangle-judgement/

SELECT x,y,z,
CASE
    WHEN (x+y > z AND y+z > x AND z+x > y) THEN 'Yes'
ELSE 'No'
END AS triangle
FROM Triangle
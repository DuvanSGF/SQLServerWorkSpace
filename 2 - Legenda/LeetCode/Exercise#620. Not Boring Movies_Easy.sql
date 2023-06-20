-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 16-06-2023
-- Description:	620. Not Boring Movies
-- Level: Easy
-- ============================================= 

--https://leetcode.com/problems/not-boring-movies/description/

/* Write your T-SQL query statement below */
SELECT id, movie, description, rating FROM
(
    SELECT *, Modulo = CASE WHEN id % 2 = 0 THEN 'Par' ELSE 'Impar' END
    FROM Cinema 
    WHERE description NOT LIKE '%boring%'
) Batman
WHERE Modulo = 'Impar'
ORDER BY Rating DESC
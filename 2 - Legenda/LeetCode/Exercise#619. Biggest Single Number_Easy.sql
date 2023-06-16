-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 16-06-2023
-- Description:	619. Biggest Single Number
-- Nivel: Easy
-- ============================================= 

--https://leetcode.com/problems/biggest-single-number/description/

/* Write your T-SQL query statement below */
SELECT Max(num) as num FROM 
(
	SELECT * FROM MyNumbers
	GROUP BY num
	HAVING COUNT(*) < 2
) Temp

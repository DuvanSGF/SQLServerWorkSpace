-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 23-08-2023
-- Description:	1204. Last Person to Fit in the Bus
-- Level:   Medium
-- =============================================

--https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/

/* Write your T-SQL query statement below */
WITH Batman AS (
	SELECT
		 person_id
		,person_name
		,sum(sum(weight)) over (order by turn asc) as Accumulated	
	FROM Queue
	GROUP BY turn,person_id,person_name
)
SELECT
	 Top 1 person_name 
FROM Batman 
WHERE Accumulated <=1000
ORDER BY Accumulated DESC
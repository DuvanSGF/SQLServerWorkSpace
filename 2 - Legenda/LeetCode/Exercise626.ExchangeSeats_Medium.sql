-- =============================================
-- Author:		In. Duván Albeiro Mejia Cortes
-- Create date: 19-06-2023
-- Description:	626. Exchange Seats
-- Level:   Medium

--https://leetcode.com/problems/exchange-seats/description/

/* Write your T-SQL query statement below */

SELECT 
	CASE 
		WHEN id % 2 = 1 THEN LEAD(id, 1,id) OVER (ORDER BY id ASC)
		WHEN id % 2 = 0 THEN id - 1
	END AS id, student
FROM
Seat
ORDER BY id

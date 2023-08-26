-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 26-08-2023
-- Description:	1211. Queries Quality and Percentage
-- Level:   Easy
-- =============================================

--https://leetcode.com/problems/queries-quality-and-percentage/description/

/* Write your T-SQL query statement below */
SELECT 
	 A.query_name
	,ROUND(CONVERT(FLOAT,SUM(CONVERT(FLOAT,A.rating) / A.position)) / Count(A.query_name),2) AS quality
	,ROUND(SUM(case WHEN rating <3 then 1 else 0 end )*100.0/ COUNT(*),2)  as poor_query_percentage 
	FROM Queries A
GROUP BY A.query_name
-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 13-07-2023
-- Description:	1075. Project Employees I
-- Level:   Easy

--https://leetcode.com/problems/project-employees-i/description/

/* Write your T-SQL query statement below */

SELECT 
	B.project_id,
	CAST(Round(Sum(A.Experience_years) * 1. / Count(B.project_id),2)AS float) as average_years
FROM Employee A
Inner Join Project B ON A.employee_id = B.employee_id
Group By project_id
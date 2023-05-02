--Exercises Solution
-- =============================================
-- Author:		In. Duván Albeiro Mejia Cortes
-- Create date: 02-05-2023
-- Description:	Union & Select
-- ============================================= 

--1965. Employees With Missing Information
--https://leetcode.com/problems/employees-with-missing-information/description/?envType=study-plan&id=sql-i
/* Write your T-SQL query statement below */
wITH queryTable as (
Select A.employee_id  from Employees A
Full outer join  Salaries B on A.employee_id  = B.employee_id 
Where A.employee_id  is null or B.employee_id  is NULL
UNION ALL
Select b.employee_id  from Employees A
Full outer join  Salaries B on A.employee_id  = B.employee_id 
Where A.employee_id  is null or B.employee_id  is NULL
)
Select * from queryTable where employee_id is not null order by employee_id
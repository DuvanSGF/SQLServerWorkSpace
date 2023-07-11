-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 22-05-2023
-- Description:	5577. Employee Bonus
-- ============================================= 

--https://leetcode.com/problems/employee-bonus/description/

/* Write your T-SQL query statement below */
--Solution 1 - Oprtimized
Select A.name, B.bonus from Employee A
LEFT JOIN bonos B on A.empId = B.empID
where B.bonus < 1000 or bonus is null 


--Solution 2
Select A.name, B.bonus from Employee A
LEFT JOIN Bonus B on A.empId = B.empID
Where A.empId Not IN (
Select B.empID from Employee A
LEFT JOIN Bonus B on A.empId = B.empID
Where B.bonus >= 1000 
)
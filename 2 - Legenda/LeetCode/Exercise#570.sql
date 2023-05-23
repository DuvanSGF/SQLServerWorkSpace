-- =============================================
-- Author:		In. Duván Albeiro Mejia Cortes
-- Create date: 22-05-2023
-- Description:	570. Managers with at Least 5 Direct Reports
-- ============================================= 

--https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/

/* Write your T-SQL query statement below */
Select name from Employee
Where Id in (Select managerId from Employee
GROUP BY managerId
Having Count(managerId) > 4) 

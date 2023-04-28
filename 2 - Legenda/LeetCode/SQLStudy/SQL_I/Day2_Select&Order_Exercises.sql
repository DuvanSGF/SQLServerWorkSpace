--1873. Calculate Special Bonus
--https://leetcode.com/problems/calculate-special-bonus/?envType=study-plan&id=sql-i
Select employee_id,
bonus = (CASE WHEN employee_id % 2 = 0 or name LIKE '%M%' THEN 0 ELSE salary END)
from Employees
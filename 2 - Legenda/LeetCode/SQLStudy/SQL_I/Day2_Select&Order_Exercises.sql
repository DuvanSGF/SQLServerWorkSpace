--1873. Calculate Special Bonus
--https://leetcode.com/problems/calculate-special-bonus/?envType=study-plan&id=sql-i
Select employee_id,
bonus = (CASE WHEN employee_id % 2 = 0 or name LIKE 'm%' THEN 0 ELSE salary END)
from Employees
order by employee_id
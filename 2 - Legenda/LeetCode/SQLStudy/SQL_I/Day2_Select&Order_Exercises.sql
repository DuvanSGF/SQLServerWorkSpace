--1873. Calculate Special Bonus
--https://leetcode.com/problems/calculate-special-bonus/?envType=study-plan&id=sql-i
Select employee_id,
bonus = (CASE WHEN employee_id % 2 = 0 or name LIKE 'm%' THEN 0 ELSE salary END)
from Employees
order by employee_id

--627. Swap Salary
--https://leetcode.com/problems/swap-salary/description/?envType=study-plan&id=sql-i
Update salary 
set sex = (Case WHEN sex = 'f' then 'm' else 'f' end)

--196. Delete Duplicate Emails
--https://leetcode.com/problems/delete-duplicate-emails/?envType=study-plan&id=sql-i
with cteTemp as(
Select id, email,
rank() over(partition By email order By id ASC) as THERANK
from Person
)

Delete from Person where id in (Select id from cteTemp where THERANK <> 1)

--1667. Fix Names in a Table
--https://leetcode.com/problems/fix-names-in-a-table/?envType=study-plan&id=sql-i
Select user_id,
name = SUBSTRING(Upper(name),1,1) + LOWER(SUBSTRING(name, 2, LEN(name))) 
from Users
order by user_id asc
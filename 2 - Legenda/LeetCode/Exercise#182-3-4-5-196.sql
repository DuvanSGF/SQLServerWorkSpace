
-- https://leetcode.com/problems/department-highest-salary/

Create table Employee (
	id int primary key identity(1,1),
	name varchar(50),
	salary int,
	departamenId int
)
go

Create table Department (
	id int primary key identity(1,1),
	name varchar(50)
)
go 

Insert into Employee values('Joe','70000',1),('Jim','90000',1),('Henry','80000',2),('Sam','60000',2),('Max','90000',1)--,('Randy','85000',1),('Will','70000',1)

Insert into Department values ('IT'),('SALES')

Truncate table Department
Truncate TABLE Employee

sELECT *  FROM Department
sELECT *  FROM Employee


--Solution
With cteTemp as (
Select A.name as Department, B.name as Employee, B.salary,
rank() over(partition By  a.name order By B.salary DESC) as THERANK
from Department A
JOIN Employee B on A.id = B.departmentId
)
Select Department, Employee, salary from cteTemp where THERANK = 1

-- Solution the second One
--https://leetcode.com/problems/department-top-three-salaries/description/
With cteTemp as (
Select A.name as Department, B.name as Employee, B.salary,
rank() over(partition By  a.name order By B.salary DESC) as THERANK,
dense_rank() over(partition by a.name order By B.salary DESC) as DENSERANK
from Department A
JOIN Employee B on A.id = B.departamenId
)
Select Department, Employee, salary from cteTemp where DENSERANK in (1,2,3)




--
--https://leetcode.com/problems/delete-duplicate-emails/description/
--Solution
with cteTemp as(
Select id, name,
rank() over(partition By name order By id ASC) as THERANK
--dense_rank() over(partition by name order by id ASC) as DENSERANK
from Department
)
Delete from Department where id in (Select id from cteTemp where THERANK <> 1)



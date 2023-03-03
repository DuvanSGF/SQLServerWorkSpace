--https://leetcode.com/problems/employees-earning-more-than-their-managers/

Create table Employee
(	id int primary key identity(1,1),
	name varchar(50),
	salary int,
	managerId int default NULL
)

GO

Insert Into Employee values ('Joe', 70000,3), ('Henry', 80000,4),('Sam', 60000,null),('Max', 90000,Null)

GO

--DROP TABLE Employee
Select * from Employee

--Solution
WITH manager as (
Select Distinct A.managerId, B.salary from Employee A
iNNER JOIN
(
Select id, salary from Employee
	) B on  B.id = A.managerId
)

Select A.name as Employee from Employee A
inner Join manager B on A.managerId = B.managerId
Where A.salary > B.salary
and A.managerID is not null

/* Write your T-SQL query statement below */

select name as Employee from employee e where e.salary > (select e1.salary from employee e1 where e1.id = e.managerid);


# Write your MySQL query statement below
select E1.Name as Employee
from Employee as E1, Employee as E2 
where E1.ManagerId = E2.Id and E1.Salary > E2.Salary








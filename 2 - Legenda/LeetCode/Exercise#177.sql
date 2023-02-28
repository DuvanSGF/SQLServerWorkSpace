-- https://leetcode.com/problems/nth-highest-salary/


--Create table HightSalary
--(
--id int primary key identity (1,1) not null,
--salary int
--)
--GO
--Insert into HightSalary values(100 )
--GO
--Select * from HightSalary
--GO
alter FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        select max(salary) as getNthHighestsalary from
        (select salary,Dense_Rank() over (order by salary Desc) as rn from HightSalary)E where E.rn=@N       
    );
END


SELECT dbo.getNthHighestSalary(2)

 --Select max(Salary) from HightSalary Where id = 1
 --and salary < (select max(salary) from HightSalary)

 --Select MAX(salary) as Batman from HightSalary
 --OFFSET 0 ROWS
 --FETCH NEXT 1 ROWS ONLY

 Select * from HightSalary

 Select max(salary) as getNthHighestSalar from (
 select salary,Dense_Rank() over (order by salary asc) as rn from HightSalary
 ) a Where a.rn = 1

 Drop table HightSalary
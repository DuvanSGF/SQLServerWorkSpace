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

--1795. Rearrange Products Table
--https://leetcode.com/problems/rearrange-products-table/?envType=study-plan&id=sql-i
Select product_id, 'store1' as store, store1 as price from Products Where store1 IS NOT NULL
UNION
Select product_id, 'store2' as store, store2 as price from Products Where store2 IS NOT NULL
UNION
Select product_id, 'store3' as store, store3 as price from Products Where store3 IS NOT NULL

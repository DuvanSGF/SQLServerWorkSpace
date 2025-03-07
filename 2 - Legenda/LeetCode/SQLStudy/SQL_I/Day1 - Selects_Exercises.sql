--Exercises Solution
-- =============================================
-- Author:		In. Duván Albeiro Mejia Cortes
-- Create date: 26-04-2023
-- Description:	Select Exercises for LeetCode
-- ============================================= 

--595. Big Countries
--https://leetcode.com/problems/big-countries/description/?envType=study-plan&id=sql-i

Select name, population, area from world
Where area >= '3000000'  or  population >= '25000000'

--1757. Recyclable and Low Fat Products
--https://leetcode.com/problems/recyclable-and-low-fat-products/?envType=study-plan&id=sql-i
Select product_id  from products
Where low_fats in ('Y') and recyclable in ('Y')

--584. Find Customer Referee
--https://leetcode.com/problems/find-customer-referee/?envType=study-plan&id=sql-i
Select name from Customer
Where referee_id <> 2 or referee_id is null
--Solution2
select name
from customer
where referee_id is null or referee_id = '' or referee_id != 2;

--183. Customers Who Never Order
--https://leetcode.com/problems/customers-who-never-order/?envType=study-plan&id=sql-i
Select A.name as Customers 
From Customers A
Left Join Orders B ON A.id = B.customerId
WHERE B.customerId is null
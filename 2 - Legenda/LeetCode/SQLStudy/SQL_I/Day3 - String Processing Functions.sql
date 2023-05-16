--Exercises Solution
-- =============================================
-- Author:		In. Duván Albeiro Mejia Cortes
-- Create date: 02-05-2023
-- Description:	String Processing Functions
-- ============================================= 

--1667. Fix Names in a Table
--https://leetcode.com/problems/fix-names-in-a-table/?envType=study-plan&id=sql-i
Select user_id,
name = SUBSTRING(Upper(name),1,1) + LOWER(SUBSTRING(name, 2, LEN(name))) 
from Users
order by user_id asc

--1484. Group Sold Products By The Date
--https://leetcode.com/problems/group-sold-products-by-the-date/description/?envType=study-plan&id=sql-i
Select sell_date, Count(product) as num_sold, STRING_AGG(product,',')
	WITHIN GROUP (ORDER BY product) AS products
    from 
    (Select Distinct * from Activities) d
    Group by sell_date
Order By Sell_date 

--1527. Patients With a Condition
--https://leetcode.com/problems/patients-with-a-condition/description/?envType=study-plan&id=sql-i
Select * from Patients
Where conditions like 'DIAB1%' or conditions Like '% DIAB1%'
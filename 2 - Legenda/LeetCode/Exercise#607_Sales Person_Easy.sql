-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 13-06-2023
-- Description:	607. Sales Person
-- Nivel: Easy
-- ============================================= 

--https://leetcode.com/problems/sales-person/description/


SELECT name FROM SalesPerson
WHERE sales_id NOT IN (
SELECT B.sales_id FROM SalesPerson A
LEFT JOIN Orders B ON A.sales_id = b.order_id
WHERE b.com_id = (SELECT com_id FROM Company WHERE name LIKE '%RED%')
)
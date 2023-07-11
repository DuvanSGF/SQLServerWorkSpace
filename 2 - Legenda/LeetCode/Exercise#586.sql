-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 30-05-2023
-- Description:	586. Customer Placing the Largest Number of Orders
-- ============================================= 

--https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/description/
Select Top 1 A.Customer_number from 
(
Select Customer_number,Count(Customer_number) as TotalPedidos from Orders
Group By customer_number
) as A
Order By A.TotalPedidos DESC
-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 21-06-2023
-- Description:	1045. Customers Who Bought All Products
-- Level:   Medium

--https://leetcode.com/problems/customers-who-bought-all-products/description/

/* Write your T-SQL query statement below */

Select customer_id from customer
Group By customer_id
having COUNT(Distinct Product_Key) = (Select Count(Product_Key) ProductQuantity from Product)
-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 02-08-2023
-- Description:	1174. Immediate Food Delivery II
-- Level:   Medium

--https://leetcode.com/problems/immediate-food-delivery-ii/description/

/* Write your T-SQL query statement below */

With Batman as (
SELECT 
	customer_id,
	Min(order_date) AS Date1,
	Min(customer_pref_delivery_date) AS Date2
FROM Delivery
GROUP BY customer_id
)

SELECT  
     TOP 1 ROUND(Cast((SELECT Count(*) * 100 FROM Batman WHERE Date1 = Date2) as float) / COUNT(*) * 1.00,2) as immediate_percentage
FROM Batman
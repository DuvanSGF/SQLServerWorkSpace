-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 31-07-2023
-- Description:	1173. Immediate Food Delivery I
-- Level:   Easy

--https://leetcode.com/problems/immediate-food-delivery-i/description/

/* Write your T-SQL query statement below */

SELECT
	CAST(((COUNT(*) / ((SELECT COUNT(*) FROM Delivery)*1.00)) * 100) AS decimal (6,2)) AS immediate_percentage

FROM Delivery
WHERE order_date = customer_pref_delivery_date
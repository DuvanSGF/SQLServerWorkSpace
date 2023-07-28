-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 28-07-2023
-- Description:	1158. Market Analysis I
-- Level:   Medium

--hhttps://leetcode.com/problems/market-analysis-i/description/

/* Write your T-SQL query statement below */
SELECT 
	 U.user_id as buyer_id
	,U.join_date
	,COALESCE(T.orders_in_2019,0) as orders_in_2019
FROM Users U
LEFT JOIN (
	SELECT 
		 B.buyer_id
		,A.join_date
		,Count(B.buyer_id) as orders_in_2019
	FROM Users A
		INNER JOIN  Orders B on A.user_id = b.buyer_id
	WHERE B.order_date >= CAST('2019-01-01' as date)
	AND B.order_date < CAST('2020-01-01' as date)
	GROUP BY B.buyer_id,A.join_date
) T  ON U.user_id = T.buyer_id
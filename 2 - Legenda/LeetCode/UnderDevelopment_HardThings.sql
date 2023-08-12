-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 09-08-2023
-- Description:	1179. Reformat Department Table
-- Level:   Medium
-- =============================================

--https://leetcode.com/problems/monthly-transactions-i/

/* Write your T-SQL query statement below */
--Solution 1
	SELECT
		 month
		,country
		,SUM(CountxMonth) AS trans_count
	    ,[approved_count] = COUNT(approved_count) - (COUNT(CountxState)-SUM(approved_count))
		,SUM(amount) AS trans_total_amount
		,MAX([approved_total_amount]) AS approved_total_amount
		FROM(
				SELECT 
					CONCAT(DATEPART(year,A.trans_date), '-',FORMAT(A.trans_date,'MM')) AS [month]
					,country
					,SUM(CASE [state]
						WHEN 'approved' THEN 1 
						ELSE 0
						END)AS approved_count
				   ,[approved_total_amount] = iif(state <> 'declined',SUM(amount),0)
				   ,SUM(amount) AS amount
				   ,COUNT(country) AS CountxMonth
				   ,COUNT(state) CountxState
			FROM Transactions A
			GROUP BY CONCAT(DATEPART(year,trans_date), '-',FORMAT(A.trans_date,'MM')),country,state
		) as intern
	group by [month],country
	Order By month ASC
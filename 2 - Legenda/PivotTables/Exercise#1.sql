-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 04-08-2023
-- Description:	1179. Reformat Department Table
-- Level:   Easy

--https://leetcode.com/problems/reformat-department-table/description/

/* Write your T-SQL query statement below */

SELECT 
	 [id],[Jan] AS [Jan_Revenue],[Feb] AS [Feb_Revenue],[Mar] AS [Mar_Revenue],[Apr] AS [Apr_Revenue],[May] AS [May_Revenue],[Jun] AS [Jun_Revenue]
	,[Jul] AS [Jul_Revenue],[Aug] AS [Aug_Revenue],[Sep] AS [Sep_Revenue],[Oct] AS [Oct_Revenue],[Nov] AS [Nov_Revenue],[Dec] AS [Dec_Revenue]
FROM  
(
  SELECT id,revenue,[month]   
  FROM Department
) AS TableToPivot 
PIVOT  
(  
  Sum(revenue)
  FOR [month] IN ([Jan],[Feb],[Mar],[Apr],[May],[Jun],[Jul],[Aug],[Sep],[Oct],[Nov],[Dec])
) AS PivotTable; 
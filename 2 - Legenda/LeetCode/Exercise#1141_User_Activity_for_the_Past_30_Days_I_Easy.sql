-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 17-07-2023
-- Description:	1141. User Activity for the Past 30 Days I
-- Level:   Easy

--https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/

/* Write your T-SQL query statement below */

SELECT activity_date as day, Count(Distinct(user_id)) active_users FROM Activity
Where activity_date
BETWEEN DATEADD(DAY,-29, '2019-07-27') and '2019-07-27'
Group By activity_date

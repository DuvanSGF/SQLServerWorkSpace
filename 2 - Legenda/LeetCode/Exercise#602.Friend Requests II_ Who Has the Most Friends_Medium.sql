-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 12-06-2023
-- Description:	602. Friend Requests II: Who Has the Most Friends
-- Nivel: Medium
-- ============================================= 

--https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/

Select Top 1 id,Sum(num) as num from (
Select requester_id as id,Count(requester_id) AS num from RequestAccepted
Group By requester_id
UNION ALL
Select accepter_id as id,Count(accepter_id) AS num from RequestAccepted
Group By accepter_id) T
Group By id
Order BY 2 DESC


-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 18-07-2023
-- Description:	1148. Article Views I
-- Level:   Easy

--https://leetcode.com/problems/article-views-i/description/

/* Write your T-SQL query statement below */
Select Distinct(author_id) as id from Views
Where author_id = viewer_id
Order By author_id ASC
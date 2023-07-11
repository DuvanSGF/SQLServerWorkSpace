-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 17-07-2023
-- Description:	1050. Actors and Directors Who Cooperated At Least Three Times
-- Level:   Easy

--https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/description/

/* Write your T-SQL query statement below */

Select actor_id, director_id from ActorDirector
group by actor_id,director_id
Having Count(director_id) > 2
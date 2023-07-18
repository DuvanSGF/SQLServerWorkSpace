-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 17-07-2023
-- Description:	550. Game Play Analysis IV
-- Level:   Medium

--https://leetcode.com/problems/game-play-analysis-iv/

/* Write your T-SQL query statement below */

with day_log as 
(select player_id, min(event_date) as day1,dateadd(day,1,min(event_date)) as next_day  from Activity a group by player_id)

select 
round(cast(count(*) as float)/(select count(*) from day_log) ,2) as fraction 
from 
day_log a inner join Activity b 
on 
b.player_id=a.player_id and  b.event_date =a.next_day 
With firstEvent as (
Select * from (
Select Event_id, participant_name As Name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable] as A
Where event_id = 2187 AND score = (SELECT MAX(score)   
                        FROM [dbo].[scoretable] AS B  
                        WHERE A.participant_name = B.participant_name)  
) as E1table
Where DenseTheRank between 1 and 3
),
tempFirstEvent as (
Select DISTINCT
		DenseTheRank,
		Event_id,
(
		SELECT SUBSTRING(
		(
			SELECT ',' + Name
			From firstEvent
			WHERE DenseTheRank = t.DenseTheRank FOR XML PATH('')), 2, 200000)
) as name
 from firstEvent t),

 finalFirstEvent as (
select event_id, [1] as first,[2] as second,[3] as third
from
(
  select event_id, name, DenseTheRank
  from tempFirstEvent
) d
pivot
(
  max(name)
  for DenseTheRank in ([1],[2],[3])
) piv
)
--Zona de tablas Con union 
Select * from finalFirstEvent
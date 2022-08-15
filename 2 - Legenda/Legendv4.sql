-- =============================================
-- Author:		Ing. Duván Mejia
-- Create date: 2022-08-09
-- Description:	Exercise Advanced for SQL Server V4
-- =============================================
USE HackTeam;
GO

-- First Event 
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
),

--Second Event
secondEvent as (
Select * from (
Select Event_id, participant_name as Name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable] as A
Where event_id = 3478 AND score = (SELECT MAX(score)   
                        FROM [dbo].[scoretable] AS B  
                        WHERE A.participant_name = B.participant_name)  
) as TempTable
Where DenseTheRank between 1 and 3
),
tempSecondEvent as (
Select DISTINCT
		DenseTheRank,
		Event_id,
(
		SELECT SUBSTRING(
		(
			SELECT ',' + Name
			From secondEvent
			WHERE DenseTheRank = t.DenseTheRank FOR XML PATH('')), 2, 200000)
) as name
 from secondEvent t),

 finalSecondEvent as (
select event_id, [1] as first,[2] as second,[3] as third
from
(
  select event_id, name, DenseTheRank
  from tempSecondEvent
) d
pivot
(
  max(name)
  for DenseTheRank in ([1],[2],[3])
) piv
),

--Third Table
thirdEvent as (
Select * from (
Select Event_id, participant_name as Name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable] as A
Where event_id = 4361 AND score = (SELECT MAX(score)   
                        FROM [dbo].[scoretable] AS B  
                        WHERE A.participant_name = B.participant_name)  
) as TempTable
Where DenseTheRank between 1 and 3
),
tempThirdEvent as (
Select DISTINCT
		DenseTheRank,
		Event_id,
(
		SELECT SUBSTRING(
		(
			SELECT ',' + Name
			From thirdEvent
			WHERE DenseTheRank = t.DenseTheRank FOR XML PATH('')), 2, 200000)
) as name
 from thirdEvent t),

 finalthirdEvent as (
select event_id, [1] as first,[2] as second,[3] as third
from
(
  select event_id, name, DenseTheRank
  from tempThirdEvent
) d
pivot
(
  max(name)
  for DenseTheRank in ([1],[2],[3])
) piv
)
--Union Tables
Select * from finalFirstEvent
Union All
Select * from finalSecondEvent
Union all
Select * from finalthirdEvent
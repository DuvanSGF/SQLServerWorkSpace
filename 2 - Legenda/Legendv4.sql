-- =============================================
-- Author:		Ing. Duván Mejia
-- Create date: 2022-08-09
-- Description:	Exercise Advanced for SQL Server V4
-- =============================================
USE HackTeam;
GO

--Imprimir el rango el top 5 
With E1 as (
Select Top(5)  Event_id, participant_name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable]
Where event_id = 2187
),
E2 as (
Select Top(10) Event_id, participant_name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable]
Where event_id = 3478
)

UNION ALL
Select Top(5) Event_id, participant_name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable]
Where event_id = 4361
GO

Select distinct Top(5) event_id,participant_name,score from [dbo].[scoretable] where event_id = 3478
Order BY Score DESC
GO

Select Top(10)* from [dbo].[scoretable] where event_id = 3478
Order BY Score DESC

Select Top(5)  Event_id, participant_name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable]
Where event_id = 3478
Group by participant_name, Event_id,score
having Count(*) >1

--Con subconsulta
SELECT Distinct participant_name
from [dbo].[scoretable]
Where event_id = 3478
GO


Select Event_id as Id, participant_name as Name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable]
Where event_id = 3478


<<<<<<< HEAD

=======
>>>>>>> f106eb3 (Continue Improvement)

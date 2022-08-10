-- =============================================
-- Author:		Ing. Duván Mejia
-- Create date: 2022-08-09
-- Description:	Exercise Advanced for SQL Server V4
-- =============================================
USE HackTeam;
GO

--Imprimir el rango el top 5 
Select Top(5) Event_id, participant_name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable]
Where event_id = 2187
--Order BY score DESC
UNION ALL
Select Top(5) Event_id, participant_name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable]
Where event_id = 3478
--Order BY score DESC
UNION ALL
Select Top(5) Event_id, participant_name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable]
Where event_id = 4361
--Order BY score DESC
GO
Select DISTINCT(Event_id) FROM [dbo].[scoretable]
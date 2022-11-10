-- =============================================
-- Author:		Ing. Duvan Albeiro Mejia Cortes
-- Create date: 10-11-2022
-- Description:	Pivots
-- =============================================

/*
Exercise: Traer la cantidad de peleas que han hecho en total los heroes los ultimos 3 años

*/

--Solución 

WITH TableTransaction AS (
SELECT DATEPART(YEAR,BT.DateOfTransaction) AS [Year],
	   H.id,
	   H.[name] as Heroe
FROM Battletransaction BT WITH(NOLOCK)
INNER JOIN battles B WITH(NOLOCK) ON BT.BattleId = B.id
INNER JOIN Heros H WITH(NOLOCK) ON B.hero_id = H.id)

--Aplicamos Pivot al resultado

SELECT * FROM TableTransaction
PIVOT (COUNT(id) FOR [Year] in ([2022],[2021],[2020]) ) as Pivotable







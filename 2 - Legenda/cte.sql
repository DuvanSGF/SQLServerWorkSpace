--Ejercicio 1 With CTE
WITH SalesMonth
AS (
SELECT
MONTH(OrderDate) AS OrderMonth,
TotalDue
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2006
)
SELECT
OrderMonth,
SUM(TotalDue) AS MonthlySales
FROM SalesMonth
GROUP BY OrderMonth
ORDER BY 1

--Ejercicio 2 with CTE
--Ejercicio
--Select * from [dbo].[battles]
Select top 10 percent * from [dbo].[Battletransaction]
GO
WITH cte as
(
Select YEAR(DateOfTransaction) as Año ,Count(BattleId) as CantidadBatallas,Sum(Amount) as TotalGanacias from  [dbo].[Battletransaction] A
Inner join [dbo].[battles] B on A.BattleId = b.id
Where B.Status = 1
Group by YEAR(DateOfTransaction)
),
perdidas as
(
Select YEAR(DateOfTransaction) as Año ,Count(BattleId) as CantidadBatallas,Sum(Amount) as TotalPerdidas from  [dbo].[Battletransaction] A
Inner join [dbo].[battles] B on A.BattleId = b.id
Where B.Status = 0
Group by YEAR(DateOfTransaction)
)

Select A.Año,A.CantidadBatallas,A.TotalGanacias,B.TotalPerdidas, (A.TotalGanacias-B.TotalPerdidas) as Ganacia from cte A
Left Outer Join perdidas B on A.Año = B.Año

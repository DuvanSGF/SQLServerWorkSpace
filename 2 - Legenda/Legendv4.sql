-- =============================================
-- Author:		Ing. Duván Mejia
-- Create date: 2022-08-09
-- Description:	Exercise Advanced for SQL Server V4
-- =============================================
USE HackTeam;
GO

--Imprimir el rango el top 5
With E1 as (
Select * from (
Select Event_id, participant_name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable] as A
Where event_id = 2187 AND score = (SELECT MAX(score)   
                        FROM [dbo].[scoretable] AS B  
                        WHERE A.participant_name = B.participant_name)  
) as E1table
Where DenseTheRank between 1 and 3
),

E2 as (
Select * from (
Select Event_id as Id, participant_name as Name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable] as A
Where event_id = 3478 AND score = (SELECT MAX(score)   
                        FROM [dbo].[scoretable] AS B  
                        WHERE A.participant_name = B.participant_name)  
) as TempTable
Where DenseTheRank between 1 and 3

),

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

--Corregir
Select Event_id as Id, participant_name as Name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable]
Where event_id = 3478

--Revisar BN 
USE HackTeam;
GO

Select * from (
Select Event_id as Id, participant_name as Name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable] as A
Where event_id = 3478 AND score = (SELECT MAX(score)   
                        FROM [dbo].[scoretable] AS B  
                        WHERE A.participant_name = B.participant_name)  
) as TempTable
Where DenseTheRank between 1 and 3

--Ejercicio Completar
USE AdventureWorks2012  
SELECT TOP(10) BusinessEntityID, Rate,   
       RANK() OVER (ORDER BY Rate DESC) AS RankBySalary  
FROM HumanResources.EmployeePayHistory AS eph1  
WHERE RateChangeDate = (SELECT MAX(RateChangeDate)   
                        FROM HumanResources.EmployeePayHistory AS eph2  
                        WHERE eph1.BusinessEntityID = eph2.BusinessEntityID)  
ORDER BY BusinessEntityID;



USE AdventureWorks2012
GO
SELECT Cust.CustomerID,
       OrderHeader.CustomerID,
       OrderHeader.SalesOrderID,
       OrderHeader.Status
FROM Sales.Customer Cust 
INNER JOIN Sales.SalesOrderHeader OrderHeader
ON Cust.CustomerID = OrderHeader.CustomerID
FOR XML AUTO;

USE AdventureWorks2012;
GO
SELECT ProductModelID,
       Name
FROM Production.ProductModel
WHERE ProductModelID=122 OR ProductModelID=119
FOR XML PATH ('');
GO
SELECT ProductModelID AS "@id",
       Name
FROM Production.ProductModel
WHERE ProductModelID=122 or ProductModelID=119
FOR XML PATH ('ProductModelData'), root ('Root');
GO


-- Solcion Luego la reviso 
USE HackTeam;
GO
BEGIN TRAN
declare @Authors Table(ID int,AuthorName varchar(20))
Insert @Authors(ID,AuthorName)
Values
(1,'Rajendra'),(1,'Raj')
,(2,'Sonu'),(2,'Raju')
,(3,'Akshita'),(3,'Akshu')
,(4,'Kashish'),(4,'Kusum')
select * from @Authors

SELECT DISTINCT 
       ID, 
(
    SELECT SUBSTRING(
    (
        SELECT ',' + AuthorName
        FROM @Authors
        WHERE ID = t.ID FOR XML PATH('')), 2, 200000)
) AS AuthorName
FROM @Authors t;
rollback tran

GO

--Ejecuta Aqui

With DUVAN as (
Select * from (
Select Event_id, participant_name As Name, score, RANK() OVER (partition by Event_id ORDER BY Score DESC) as TheRank, Dense_RANK() OVER (partition by Event_id ORDER BY Score DESC) as DenseTheRank
from [dbo].[scoretable] as A
Where event_id = 2187 AND score = (SELECT MAX(score)   
                        FROM [dbo].[scoretable] AS B  
                        WHERE A.participant_name = B.participant_name)  
) as E1table
Where DenseTheRank between 1 and 3
),
--Select * from DUVAN 
s as (
Select DISTINCT
		DenseTheRank,
		Event_id,
(
		SELECT SUBSTRING(
		(
			SELECT ',' + Name
			From DUVAN
			WHERE DenseTheRank = t.DenseTheRank FOR XML PATH('')), 2, 200000)
) as DuvanName
 from DUVAN t) 

  Select * from s
 Pivot (count(Event_id) for DuvanName in ([1],[2],[3])) as Mypvt


--SELECT Event_id AS Evento,   
--  [1], [2], [3]
--FROM  
--(
--  SELECT DenseTheRank, Event_id ,DuvanName  
--  FROM s
--) AS SourceTable  
--PIVOT  
--(  
--	count(*) as event_iD
--  FOR DuvanName IN ([1], [2], [3])  
--) AS PivotTable;

-- -- Pivot table with one row and five columns  
--SELECT 'AverageCost' AS Cost_Sorted_By_Production_Days,   
--  [0], [1], [2], [3], [4]  
--FROM  
--(
--  SELECT DaysToManufacture, StandardCost   
--  FROM Production.Product
--) AS SourceTable  
--PIVOT  
--(  
--  AVG(StandardCost)  
--  FOR DaysToManufacture IN ([0], [1], [2], [3], [4])  
--) AS PivotTable;

 Select * from s
 Pivot (count(Event_id) for DenseTheRank in ([1],[2],[3])) as Mypvt


-- SELECT SO.DenseTheRank, SO.DuvanName
--, STUFF((
--       SELECT ','+p.DuvanName
--       FROM DUVAN SOP
--       INNER JOIN s P
--       ON SOP.DenseTheRank = p.DenseTheRank
--       --AND SOP.SpecialOfferID = SO.SpecialOfferID
--       FOR XML PATH('')
--),1,1,'' ) as productos
--FROM s SO


-- SELECT
--       DuvanName
--       ,STUFF((
--             SELECT ','+DuvanName
--             FROM s PSC
--             WHERE DenseTheRank = PC.DenseTheRank
--             FOR XML PATH('')
--       ),1,1,'')
--FROM s PC

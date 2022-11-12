USE AdventureWorks2019
GO

DECLARE @pageNumber as int, 
		@pagesize as int, 
		@totalpages as int

SET @pageNumber = 0
SET @pagesize = 10
SET @totalpages = (Select Count(*) from Sales.SalesOrderHeader) / @pagesize

Select * from 
	(SELECT *, ROW_NUMBER() OVER (ORDER BY SalesOrderID) as RowNumber
	FROM Sales.SalesOrderHeader) as Sales
Where RowNumber between @pagesize * @pageNumber + 1
				AND @pagesize * (@pageNumber +1)

					

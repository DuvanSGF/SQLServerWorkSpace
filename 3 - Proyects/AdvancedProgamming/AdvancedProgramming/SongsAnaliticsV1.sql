/*
Author: Ing. Duván Albeiro Mejia Cortes
Date: 21-11-2022
Description: It's a personal proyect about Songs analitics using SP, Cursos and Transact-SQL (Most Advanced)
*/

-- 1- Try to create a table using a Store procedure

ALTER PROC createTables(@name varchar, 
							  @year char(4), 
							  @period int,
							  @currentYear char(4),
							  @currentPeriod int)
AS
BEGIN
	SET NOCOUNT ON;

 
WHILE @year <= @currentYear  
BEGIN

SELECT * FROM Heros


END


--WHILE (SELECT AVG(ListPrice) FROM Production.Product) < $300  
--BEGIN  
--   UPDATE Production.Product  
--      SET ListPrice = ListPrice * 2  
--   SELECT MAX(ListPrice) FROM Production.Product  
--   IF (SELECT MAX(ListPrice) FROM Production.Product) > $500  
--      BREAK  
--   ELSE  
--      CONTINUE  
--END  
--PRINT 'Too much for the market to bear';


END

--EXEC createTables 'duvan',2012,4,2022,4


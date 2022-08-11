--Creamos y vemos la configuracion de un cursor 
BEGIN TRAN
CREATE TABLE #tblHerosTemp  
(  
   name varchar(25),
   age int
)  
GO  
  
INSERT INTO #tblHerosTemp(name,age) VALUES('Batman',34),('Spiderman',40),('thor',24)   

GO  
 DECLARE @Description AS nvarchar(400)

--Create a cursor.  
DECLARE cur CURSOR  
FOR SELECT name FROM #tblHerosTemp  
  
--Display the status of the cursor before and after opening  
--closing the cursor.  
SELECT CURSOR_STATUS('global','cur') AS 'Despues de declarar'  
OPEN cur  
FETCH NEXT FROM cur INTO @Description
 WHILE @@fetch_status = 0
BEGIN
    PRINT @Description
    FETCH NEXT FROM cur INTO @Description
END
SELECT CURSOR_STATUS('global','cur') AS 'Despues de estar abierta'  
CLOSE cur  
SELECT CURSOR_STATUS('global','cur') AS 'Despues de cerrar'  
--Remove the cursor.  
DEALLOCATE cur  
  
--Drop the table.  
DROP TABLE #tblHerosTemp
ROLLBACK TRAN;
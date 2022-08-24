EXEC sp_helpindex('HumanResources.Departmen')

--Limpiar cache
DBCC FREEPROCCACHE

select * from 
sys.dm_tran_locks

--Temp Tables
SELECT * FROM tempdb.sys.tables

--Temp files
SELECT * FROM tempdb.sys.database_files

--vesion
Select @@VERSION


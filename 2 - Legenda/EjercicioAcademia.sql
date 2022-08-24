-- =============================================
-- Author:		Duván Mejia Cortes
-- Create date: 2022-08-18
-- Description:	Exercise
-- =============================================

USE AdventureWorks2012;
--1)
--Para Obtener informacion acerca de una tabla en espcifico
EXEC sp_help 'Person.Password'

--Tambien si se quiere sabes un poco mas acerca de los metadatos de la tabla
SELECT s.name as schema_name, t.name as table_name, c.* FROM sys.columns AS c
INNER JOIN sys.tables AS t ON t.object_id = c.object_id
INNER JOIN sys.schemas AS s ON s.schema_id = t.schema_id
WHERE t.name = 'Password' AND s.name = 'Person';

--2) Creacion de la Funcion: Retornar la tabla donde haya un campo en especifico

BEGIN TRAN
--Elimino la Funcion Si existe
If exists (Select * from sys.objects where name = 'findTable')
	drop function findTable
GO

CREATE FUNCTION dbo.findTable(@columnName varchar(50))
RETURNS TABLE
AS
RETURN
(
	SELECT
	  sys.columns.name AS NombreColumna,
	  tables.name AS NombreTabla
	FROM
	  sys.columns
	JOIN sys.tables ON
	  sys.columns.object_id = tables.object_id
	WHERE
	  sys.columns.name = @columnName
);
GO

--Voy a Busacar que tablas Contienen la columna BusinessEntityID
SELECT * FROM dbo.findTable('BusinessEntityID');

ROLLBACK TRAN




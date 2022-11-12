
--Habilitamos distribited Query
SP_configure 'show advanced options', 1
RECONFIGURE

SP_configure 'Ad Hoc Distributed Queries', 1
RECONFIGURE


--Conectar a un servidor remoto --Pero local
SELECT * FROM OPENROWSET('SQLNCLI','Server=192.168.0.14;UID=mariano;PWD=Abc1234',
		cuatenta.sbo.udemycurso)
		
--Leer archivo JSON
DECLARE @JSON varchar(max)
Select * 
from OPENROWSET(BULK 'c:\sqlada\archivo.json', SINGLE_CLOB) import

--Para leer mejor un archivo JSON
DECLARE @JSON varchar(MAX)
Select @JSON = bulkcolumnFROM OPENROWSET (BULK 'c:\sqlada\archivo.json', SINGLE_CLOB) import
Select * from OPENJSON (@JSON)






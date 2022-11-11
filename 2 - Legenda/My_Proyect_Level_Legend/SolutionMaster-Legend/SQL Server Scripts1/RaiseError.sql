
BEGIN TRANSACTION

BEGIN TRY
	INSERT INTO dbo.Heros
	VALUES(NEWID(),'Duvan',3,8500,0)
END TRY
BEGIN CATCH
	RAISERROR ('Error al intentar grabar',16,1)
END CATCH

Select * from dbo.Heros
ROLLBACK TRANSACTION


--ERRORES PERSONALIZADOS
--ID ERROR > 50000
--SEVERITY 1 A 25

--Crear
--sp_addmessage 50001,16, 'Ocurrio un mensaje de conversion varchar en la tabla  dbo.heros, por vaor revisar bn'

--Editar
--sp_addmessage 50001,16, 'Ocurrio un mensaje de conversion varchar en la tabla  dbo.heros, por vaor revisar bn',@with_log = true, @replace = 'REPLACE'

BEGIN TRANSACTION

BEGIN TRY
	INSERT INTO dbo.Heros
	VALUES(NEWID(),'Duvan',3,8500,0)
END TRY
BEGIN CATCH
	If @@error <> 547
		RAISERROR (50001,-1,4)
	else
		RAISERROR ('(0) Error inesperado', 16,4)
END CATCH

Select * from dbo.Heros
ROLLBACK TRANSACTION

SELECT *
FROM master.dbo.sysmessages where error =547

sELECT ERROR_STATE ()  

--eliminar
--sp_dropmessage 50001

--Crear
--sp_addmessage 50001,16, 'Ocurrio un mensaje de conversion varchar en la tabla  %s, por vaor revisar bn'

BEGIN TRANSACTION

BEGIN TRY
	INSERT INTO dbo.Heros
	VALUES(NEWID(),'Duvan',3,8500,0)
END TRY
BEGIN CATCH
	If @@error <> 547
		RAISERROR (50001,-1,4,'dbo.heros')
	else
		RAISERROR ('(0) Error inesperado', 16,4)
END CATCH

Select * from dbo.Heros
ROLLBACK TRANSACTION
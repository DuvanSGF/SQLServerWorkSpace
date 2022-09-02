USE tempdb;
go
exec sp_helpfile
GO

--Cuento la cantidad de registros que han sido moficados
@@rowcount

--Utilizandola durante una transaccion
if  @@rowcount = 1

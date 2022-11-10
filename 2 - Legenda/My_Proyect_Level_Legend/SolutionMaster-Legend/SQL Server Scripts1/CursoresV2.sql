/*

--Ejercicio 1

Actualizar una tabla
-Creamos una tabla Nueva
CREATE TABLE HerosDetailData
(
	id int not null Primary Key identity(1,1),
	heroId int not null,
	name nvarchar(20) null,
	description nvarchar(100),
	status bit not null default 0
)

CURSOR FAST_FORWARD FOR --Anvanzamos no permite retroceder --Adelante y rapido - Tiene propiedad de Solo lectura
*/


--Declaro todas las variables de la iteracion
DECLARE @heroId int, @name nvarchar(100), @description nvarchar(100), @status bit

DECLARE miCursorHeroe CURSOR FOR

Select id, name, Concat('Name: ',Name,' - codeName: ',id,name) as description, status from Heros
Where status = 0

OPEN miCursorHeroe

--Leo el primer registro
FETCH NEXT FROM miCursorHeroe
INTO @heroId, @name,@description, @status

--Mientras FETCH_STATUS = 0, Quiere decir que no ha llegado el final de la tabla
WHILE @@FETCH_STATUS = 0
BEGIN

	--Inserto en la tabla HerosDetailData
	INSERT INTO HerosDetailData VALUES (@heroId,@name,@description,@status)

	--Actualizo en la tabla HerosDetail
	UPDATE Heros SET currentFlag = 0
	WHERE CURRENT OF miCursorHeroe

	--Pasamos al siguiente registro
	FETCH NEXT FROM miCursorHeroe
	INTO @heroId, @name,@description, @status

END

CLOSE miCursorHeroe
DEALLOCATE miCursorHeroe


--Select * from [dbo].[Heros]
--Select * from HerosDetailData
--TRUNCATE TABLE HerosDetailData
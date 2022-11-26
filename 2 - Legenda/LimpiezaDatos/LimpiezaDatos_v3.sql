-- =============================================
-- Author:		Ing. Duván Mejia Cortes
-- Create date: 19-10-2022
-- Description:	SQL Advanced - Limpieza de Datos v3
-- =============================================

-- Logica Core
DECLARE @i INT = 0
DECLARE @count Int = (Select count(*) from performance.DirtyData)
DECLARE @text Varchar(2000)

--Creamos una tabla temporal para guardar los registros
DECLARE @TableToClean Table(id int, Field VARCHAR(2000))

--Variables
DECLARE @Name VARCHAR(100)
DECLARE @cityId VARCHAR(100)
DECLARE @minutes VARCHAR(100)

DECLARE @NumberPattern VARCHAR(10) = '%[0-9]%'
DECLARE @StringPattern VARCHAR(10) = '%[a-z]%'

--Empezamos a recorrer la tabla
WHILE @i < @count
BEGIN
	
	Set @text = (Select text from performance.DirtyData
				ORDER BY id
				OFFSET @i rows
				FETCH NEXT 1 Rows only)

	Insert into @TableToClean(id,Field)
	Select ROW_NUMBER() OVER(ORDER BY (SELECT 1)), value from string_split(TRIM(@text), ',')
	WHERE RTRIM(value) <> '';

	--Establecemos el valor de las variables
	SET @Name = (Select TOP(1) field from @TableToClean
				Where id =1)

	SET @cityId = (Select TOP(1) field from @TableToClean
				Where id =2)

	SET @minutes = (Select TOP(1) field from @TableToClean
				Where id =3)


	--Eliminamos Espacios
	SET @Name = (SELECT TRIM(Replace(Replace(Replace(@Name,' ', '<>'), '><',''), '<>',' ')))

	--Eliminamos los numeros del nombre y de letras de los minutos
	WHILE PATINDEX(@NumberPattern, @Name) > 0
		SET @Name = STUFF(@Name,PATINDEX(@NumberPattern, @Name),1,'')

	WHILE PATINDEX(@StringPattern, @minutes) > 0
		SET @minutes = STUFF(@minutes,PATINDEX(@StringPattern, @minutes),1,'')

	SET @Name = TRIM(@Name)
	SET @cityId = TRIM(@cityId) 
	SET @minutes = TRIM(@minutes)

	--Insertamos
	INSERT INTO performance.Bands (Name,cityId,MinutesListened) Values(@Name,@cityId,@minutes)

	DELETE FROM @TableToClean	
	SET @i = @i + 1
END

--Comprobamos la información
--Antes
Select * From [performance].[DirtyData]
--Ahora
Select * From [performance].[Bands]

--TRUNCATE TABLE [performance].[Bands]

--Note: If you have any questions, let me know and Write me please. Att DuvanSGF

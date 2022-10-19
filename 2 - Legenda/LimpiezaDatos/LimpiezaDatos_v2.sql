-- =============================================
-- Author:		Ing. Duván Mejia Cortes
-- Create date: 19-10-2022
-- Description:	SQL Advanced - Limpieza de Datos v2
-- =============================================

-- 1. Insertamos algunos datos a la tabla
INSERT INTO performance.DirtyData (text) values('Batma78n,  1, 545h545'),('guns   and   55roses,2, 454154'),('Sl34ash ,    3,23232'),('The8 Beatl5es ,  4 ,Prueba1545755')
GO
--TRUNCATE TABLE performance.DirtyData

-- 2. Realizamos la comprobación 
Select * from performance.DirtyData


-- 3. Cambiamos al usuario Batman para crear la tabla y luego volvemos al usuario DBO

--Creamos la tabla Objetivo - Ejemplos
execute as user = 'Batman'

CREATE TABLE Bands(
	id int Primary key Identity(1,1) NOT NULL,
	Name nvarchar(100) NULL,
	cityId int NULL,
	MinutesListened int NULL)

revert
Select user

-- 4. Ahora sacaremos la información correspodiente - id - Name - cityId - MinutesListened
-- Tabla
Select * from performance.Bands



--Note: See next script LimpiezaDatos_v3.sql
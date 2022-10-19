-- =============================================
-- Author:		Ing. Duván Mejia Cortes
-- Create date: 19-10-2022
-- Description:	SQL Advanced - Limpieza de Datos
-- =============================================
-- 1. Login
-- 2. user for login
use MarvelUniverse
create user Batman for login batman
with default_schema = performance

-- 3. Creamos un schema
USE MarvelUniverse
GO
CREATE SCHEMA performance Authorization Batman
GO

--Damos permisos para crear tablas
GRANT CREATE TABLE TO Batman
GO

--Reviso el usuario Actual
Select user
-- Paso al usurio para crear la Tabla
execute as user = 'Batman'
--Creamos la tabla de Limpieza de Datos
CREATE TABLE DirtyData
(	id int primary key not null identity(1,1),
	text varchar(200) not null
)

--Para volver al usuario DBO
revert
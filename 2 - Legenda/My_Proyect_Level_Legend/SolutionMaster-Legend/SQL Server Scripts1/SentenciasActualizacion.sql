

--1. INSERT INTO en otra tabla 
Select * from [dbo].[Heros]

--Creamos la tabla para hacer cualquier Prueba
--Nota: No es una tabla normalizada- Es solo con fines didacticos asi que es dirty data
-- Dejame saber si quieres saber mas sobre ellos

--Drop table HerosDetail
CREATE TABLE HerosDetail(
	id int not null primary key identity(1,1),
	heroId int not null,
	name varchar(50) not null,
	status bit not null
	)
GO
--- Insertamos en el ejemplo
Insert into HerosDetail
Select id, name,status from dbo.Heros
Where status = 1

--Verificamos 
Select * from dbo.HerosDetail


--2.UPDATE INNER JOIN
--Aagregamo una nueva columna para alterar
ALTER TABLE HerosDetail
Add fight bit not null default(0)

UPDATE HerosDetail Set fight = 1
from HerosDetail A
Inner Join battles B on A.heroId = B.hero_id

--3.DELETE INNER JOIN
DELETE A 
from HerosDetail A
INNER JOIN  (
Select hero_id,SUM(Damage) as Damage from battles
Group by hero_id
Having SUM(Damage) < 10000000000000000) as B on A.heroId = B.hero_id

--4. SELECT ÏNTO - Crear la estructura de una tabla a  partir de otra
--No copia ni PK ni indices.
SELECT * INTO HerosDetailBackup
from dbo.HerosDetail
--where 1=0 Para solo obtener la estructura sin datos

--verificamos 
Select * from HerosDetailBackup

--Select Into (Para copiar tabla con campo IDENTITY)
-- Solo usar identity si el id en la tabla no existe
Select IDENTITY(INT,1,1) AS id, * INTO HerosBackup
from [dbo].[Heros]
Select * from HerosBackup


--CloneDatabase
DBCC CLONEDATABASE(MarvelUniverse, MarvelUniverseCopia)
--Queda como solo lectura.
--En propiedades --Opcions --Read only



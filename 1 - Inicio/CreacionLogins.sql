--Crear Login SQL Athentication
CREATE login [batman] With PASSWORD = 'batman123' MUST_CHANGE,
DEFAULT_DATABASE=master, DEFAULT_LANGUAGE=[Español],CHECK_EXPIRATION = ON

--CREATE User Windows authentication
CREATE login [DESKTOP-A6H79BB\thor] from Windows With Default_Database=master, Default_Language=[Español]

--Eliminar un login
drop login batman

--Creacion de usuarios
create user batman for login batman with DEFAULT_SCHEMA=dbo
--Eliminar usuarios
Drop user batman

--Con esto vario usuarios puieden acceder a la bd
alter database MarvelUniverse set multi_user


--Asignarle un usuario para utilizar la repctiva BD
CREATE USER MarvelUniverse for login marvel with default_schema=dbo

--A los usuarios no se les puede dar permisos de crear BD, solo a los logins
GRANT CREATE ANY DATABASE TO batman

--Parq uqe varios usrios puedan acceder
Create DATABASE TheBeatles
use TheBeatles
Alter database TheBeatles set multi_user

--Crear permiso pora poder creatr tablas
Alter Role db_owner ADD MEMBER user

--Conocer la estructura de la tablas
sp_help heros


--Renombrar una columna
EXEC sp_RENAME 'clientes.email', 'correo', 'COLUMN'

--Cambiar el tipo de dato
Alter Table name_table Alter Columna email varchar(10)

--	Estableciendo las llaves foraneas.
Alter table Heros
ADD CONSTRAINT FK_Heros_powerid FOREIGN KEY (powerid) REFERENCES power(Id)
--Establecer llaver primarias
ALTER TABLE power ADD CONSTRAINT FK_Hero_Id Primary Key (Id)

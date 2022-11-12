/*
DEFINICION, TIPOS Y USOS

- Un indice es la indexacion(Ordenamiento) de un campo especifico en una tabla, que se crea con
el prprosito principal de optimizar los tiempos de respuesta de nuestras consultas

- La implementacion de un indice solo debe realizarse cuando el retorno de registros de 
la consulta que queremos optimizar, demore un tiempo considerable y eso afecte la experiencia
de usuario. 

- Existen dos tipos de indice, Clusterd Y Non Clusterd. Ademas estos puedes ser de tipo UNique
	o Non Unique


--EJMPLO

CREATE CLUSTERED INDEX IX_MYindexe
ON Tabla(campo)
*/

--ejemplo
Select * from [Person].[Person]

INSERT INTO Person.personBackup
select * FROM [Person].[Person]

INSERT INTO Person.personBackupAll
select * FROM Person.personBackup


SELECT * INTO Person.personBackup
from [Person].[Person]

Select Count(*) from Person.personBackupAll


SELECT * INTO Person.personBackupAll
from Person.personBackup

--indexes
--Borramos cache
DBCC FREEPROCCACHE WITH No_INFOMSGS
DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS

Select * from Person.personBackup
wHERE LastName = 'Price'

--Esta es mucho mejor el performance
CREATE CLUSTERED INDEX IX_personBackup_LastName
ON Person.personBackup (LastName)

CREATE NONCLUSTERED INDEX IX_personBackup_LastName
ON Person.personBackup (LastName)







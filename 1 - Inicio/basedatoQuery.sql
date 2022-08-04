--Con esta consulta obtenemos el 50% de los datos a mostrar
Select top(50) Percent *
From Productos
Where existencia Between 200 and 400
Order by existencia asc

--Join con clausula Having y oreder By con alias
Select B.name,SUM(A.Damage) as Dañototal from Battles A
Join Heros B
On A.hero_id = B.id
Group By B.name
Having Sum(A.Damage) > 554222
Order By 2 ASC

--Creamos una Nueva BD con Datosy establecemos llaves primarias
Create table Battletransaction(
Id Int not null Primary key IDENTITY(1,1),
Amount smallmoney NOT NULL,
BattleId int Not Null,
DateOfTransaction smalldatetime NULL,
BattleDay dateime Null, CONSTRAINT defBattleday DEFAULT GETDATE(),
CONSTRAINT fk_battles FOREIGN KEY (BattleId) REFERENCES [dbo].[battles] (Id)
)

ALTER TABLE battles ADD CONSTRAINT FK_battles_id Primary Key (id) IDENTITY(1,1)

--Insertamos algunos Datos
Insert into battletransaction
VALUES('964,05', '1', '20220526'),('-654,05', '2', '20220526'),('852,03', '3', '20220527'),
('-102,09', '4', '20220528'),('954,05', '5', '20220601'),('-852,03', '6', '20220602'),
('854,05', '7', '20220602'),('921,06', '8', '20220603')

-- Realizo un pequeño Query - Tambien se puede hacer el UPDATE o el Delete
Select B.name as Poder, A.Name , A.Pelea, A.Cantidad, A.DineroBatalla
from (
Select	A.powerid as power, A.Name,
		Case  B.Status
		When 0 then 'Perdio'
		When 1 then 'Gano' end as Pelea,
Count(*) as Cantidad,
Sum(C.Amount) as DineroBatalla
from Heros A
join battles B on A.Id = B.hero_id
Join Battletransaction C on B.id = C.BattleId
Group by B.Status, A.name, A.powerid) as A
Join power B on  A.power = B.id
Where A.Pelea = 'Gano'
Order By A.DineroBatalla desc

Rollback tran
Rollback Transaction

-----------------------------------
-- constraints
--------------------------------------

-- Agragamos una nueva Columna y se agrag un constrait por default
Alter table Battletransaction
add battleday datetime

Alter table Battletransaction
add constraint defbattleday DEFAULT GETDATE() for battleday;

-- Aca agregamos una un constraint para validar un campo string.
ALter table hero with nocheck --por si la tabla ya tiene datos insertados
add constraint name check
(REPLACE(Hero, '.','') = Name or Name is null)

-- Aqui si se quiere crear de una vez
Create table tblTemp
( herosName varchar (20) null, CONSTRAINT ck_herosName check
(REPLACE(herosName,'.','') = herosName or herosName is Null))

--Eiminar un constraint
Alter table tableName
drop constrait pK_NameConstraint

--Devlolver las ultias identidades
Select @@IDENTITY
Select SCOPE_IDENTITY()
 --Especifica table
 Select IDENT_CURRENT('TableName')

 ---Imprimir el porcentaje de algo
 Select TOP 10 Percent , name  From Heros


 --Some Queries
 reate clustered index idx_power on [dbo].[power]([name])
Select * from [dbo].[power]

--Pk
alter table [dbo].[HeroTraining]
add constraint pk_herotraining PRIMARY KEY(id)

create nonclustered index idx_power on [dbo].[power]([name])
Select * from [dbo].[power] where name = 'Hot'


Drop index [idx_power] on [dbo].[power]
Select * from [dbo].[power] where name = 'Hot'

Select * from power A
inner join Heros B on A.id = B.powerid
SET STATISTICS IO ON
GO

Select c.name, B.DateOfTransaction, B.Amount,
sum(b.Amount) OVER(PARTITION BY c.id order by B.DateOfTransaction) as TotalAmount
from battles A
Inner loop Join Battletransaction B With (Nolock) On a.id = B.BattleId
Inner loop Join Heros C With(nolock) On A.hero_id = c.id
Where A.Status = 1
Select c.name, B.DateOfTransaction, B.Amount,
sum(b.Amount) OVER(PARTITION BY c.id order by B.DateOfTransaction) as TotalAmount
from battles A
Inner hash Join Battletransaction B With (Nolock) On a.id = B.BattleId
Inner hash Join Heros C With(nolock) On A.hero_id = c.id
Where A.Status = 1

--Mostrar todo el plan S
SET SHOWPLAN_ALL OFF
GO


Select c.name, B.DateOfTransaction, B.Amount,
sum(b.Amount) OVER(PARTITION BY c.id order by B.DateOfTransaction) as TotalAmount
from battles A
Inner loop Join Battletransaction B With (Nolock) On a.id = B.BattleId
Inner loop Join Heros C With(nolock) On A.hero_id = c.id
Where A.Status = 1
SET SHOWPLAN_ALL OFF
GO
--Buena practica no utilizar SQL Dinamico si no SQL parametrizado
DECLARE @param varchar(1000) = '1'
EXECUTE SYS.sp_executesql
@statement = N'SELECT * FROM [dbo].[HeroTraining] WHERE heroid = @HeroId',
@params = N'@HeroId varchar(1000)',
@HeroId = @param

-- Index
SELECT * from
SYS.dm_db_index_physical_stats(db_id('MarvelUniverse'),object_id('[dbo].[Heros]'), NULL,NULL,'DETAILED')


select T.*
into dbo.tbltemp
from [dbo].[Battletransaction] as T
cross join [dbo].[Battletransaction] as T2
Select * from [dbo].[tbltemp] where BattleId = 10
USE MarvelUniverse
Select * from sys.dm_db_missing_index_details
Where database_id = db_id()


--Cursor
declare @HeroId int
declare dmc CURSOR FOR
select hero_id
from [dbo].[battles]
Where hero_id between 1 and 5
Order BY hero_id ASC

open dmc
Fetch next from dmc into @HeroId
While @@FETCH_STATUS = 0
Begin
	Select * from [dbo].[Heros] where Id = @HeroId
	Fetch next from dmc into @HeroId
	End
close dmc
deallocate dmc
If exists (Select * from sys.objects where name = 'NumberOfTransaction')
	Drop FUNCTION NumberOfTransaction
GO
CREATE FUNCTION NumberOfTransaction(@HeroId int)
RETURNS int
AS
BEGIN
	DECLARE @NumberOfTransaction int
	SELECT @NumberOfTransaction = count(*) FROM battles
	Where hero_id = @HeroId
	Return @NumberOfTransaction
END
GO
Select Id , dbo.NumberOfTransaction(id) from Heros
go

SET STATISTICS IO OFF
GO

Select * from Heros with (Nolock)
GO
sELECT * FROM [dbo].[Battletransaction] A
iNNER LOOP jOIN BATTLES B on b.iD = a.battleid
Go

Select 'Duván is DBA At Softtek', 10*10 as Best


Select * from heros
Where (powerid in (1,2,3) and name Like 'b%') or Status = 1
GO
Select * from heros
Where (powerid in (1,2,3) or name Like 'b%') and Status = 1
Go
Select * from heros
Where powerid in (1,2,3) and (name Like 'b%' or Status = 1)


--Ejercicio Like
Select * from heros
Where  name Like 'b%'

--lEFT
Select count(*) from heros A
left outer Join [dbo].[battles]B with (Nolock) ON A.id = B.hero_id

Select count(*) from heros A
Right outer Join [dbo].[battles]B with (Nolock) ON A.id = B.hero_id

Select count(*) from heros A
Join [dbo].[battles]B with (Nolock) ON A.id = B.hero_id
Select count(*) from heros A
left Join [dbo].[battles]B with (Nolock) ON A.id = B.hero_id

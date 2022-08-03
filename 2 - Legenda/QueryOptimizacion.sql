create clustered index idx_power on [dbo].[power]([name])
Select * from [dbo].[power]

--Pk
alter table [dbo].[HeroTraining]
add constraint pk_herotraining PRIMARY KEY(id)

--Creando Clutering
create nonclustered index idx_power on [dbo].[power]([name])
Select * from [dbo].[power] where name = 'Hot'

Drop index [idx_power] on [dbo].[power]
Select * from [dbo].[power] where name = 'Hot'

Select * from power A
inner join Heros B on A.id = B.powerid

--Estableciendo estadicas
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

--Ejemplo de una fucnion 
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

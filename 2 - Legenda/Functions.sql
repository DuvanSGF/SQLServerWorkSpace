--Recursive
With Mytable as (
	Select id, name, 0 as PowerLevel  from Heros
	Where powerid is nULL
	union all
	Select E.id, E.name, Mytable.PowerLevel + 1  from Heros E
	Join Mytable on E.powerid = Mytable.id

)
Select top(10) * from Mytable
GO

--Funciones Transact SQl - Server
If exists (Select * from sys.objects where name = 'NumberOfTransaction')
	Drop FUNCTION NumberOfTransaction
GO

CREATE FUNCTION NumberOfTransaction(@HeroId int)
RETURNS int
AS
BEGIN
	DECLARE @NumberOfTransaction int
	SELECT @NumberOfTransaction = count(*) FROM battles
	Where id = @HeroId
	Return @NumberOfTransaction
END
GO
Select Id , NumberOfTransaction(id) from Heros

 -- or 1=1

--Sql Dinamico
declare @command as nvarchar(255), @param as nvarchar(50);
set @command = N'Select * from battles where hero_id = @HeroId'
Set @param = N'1'
execute sys.sp_executesql @statement = @command , @param= N'@HeroId int', @HeroId = @param;

--Secuencias
begin tran
CREATE SEQUENCE newSeq as BIGINT
START WITH 1
INCREMENT BY 1
MINVALUE 1
CACHE 50
select NEXT VALUE For newSeq as NextValue;
rollback

alter table battles
add NextNumber int
alter table battles
add CONSTRAINT DF_battles DEFAULT NEXT VALUE FOR newSeq for NextNumber

Begin Tran
Select * from battles
--Insert into battles (hero_id,Damage,DamageReceived,Status)VALUES('2', '80000', '87878', '1')
UPDATE battles
SET nextNumber = next value for newSeq
Select * from battles --WHERE hero_id = 2
Rollback tran


alter sequence newSeq
restart with 1


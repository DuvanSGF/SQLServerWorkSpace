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

--Busquedas

--Me retorna solo los datos con BattleDay = Null
Select * from Heros A With (Nolock)
Inner JOIN battles B With (Nolock) On A.id = B.hero_id
Inner JOIN Battletransaction C With (Nolock) On C.BattleId = B.id
Where ISNULL(c.Battleday,'') = ''

--Select * from [dbo].[Battletransaction] where Battleday is null


--Busqueda por nombres - CASE en el where
Declare @HeroName char(20) = Null
--set @HeroName = 'Batman'

Select * from Heros
Where name = (CASE WHEN isnull(@HeroName,'') <> '' THEN @HeroName
					ELSE name
					END
					
					
-----------
--BUSQUEDAS ENTRE BASES DE DATOS
-----------


					

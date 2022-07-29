
update [dbo].[power]
Set name = 'Invisible'
Where name = 'invisible'
GO

Select * from [dbo].[power]
GO
Select Name, Count(*) as Total  from [dbo].[power]
Group By name

Select Min(BattleId) as Min,Max(BattleId) as Max from [dbo].[Battletransaction]
--Select Max(BattleId) as Max from [dbo].[Battletransaction]

--Heroes que empiezan por B
Select * from Heros
Where name Like'b%'
 
 --Discriminación de datos
Select * 
from [dbo].[battles] A
Where hero_id in 
		(Select id from Heros Where name Like'b%')
		Order by hero_id

Select * 
from [dbo].[battles] A
Where hero_id = any 
		(Select id from Heros Where name Like'b%')
		Order by hero_id

--Contar las transacciones por Hero
Select P.Name,C.name, 
rank() over(partition By P.Name order By C.Name) as THERANK
from [dbo].[battles] A With(Nolock) 
Join [dbo].[Battletransaction] B With(Nolock)  on A.id = B.battleId
Join [dbo].[Heros] C With(Nolock)  on A.hero_id = C.id
Join [dbo].[power] P With(Nolock)  on C.powerid = P.id
--Group By A.hero_id,C.name,P.Name
Order By 3 asc

-- Encontrar que Batallas no han hceho transactions
With numbers as (
	Select top(select Max(BattleId) from [dbo].[tbltransaction] ) row_Number() Over(order by (Select Null)) as RowNumber
	from [dbo].[tbltransaction]
)
	--Select * from [dbo].[tbltransaction]
Select U.rowNumber FROM numbers U
left Join [dbo].[tbltransaction] T
on U .RowNumber =BattleId
Where T.BattleId Is null
Order By U.rowNumber
Go


--Prueba de Count sin necesidad de usar Inner Join
Select *, (Select count(*) from battles as B
				Where B.hero_id = H.Id) as CantidadBatallas
from [dbo].[Heros] H
Where H.id = any 
		(Select id from Heros Where name Like'b%')
		Order by H.id
GO


--Ejercicio que Incluye multiples Funciones
With numbers as (
	Select top(select Max(BattleId) from [dbo].[tbltransaction] ) row_Number() Over(order by (Select Null)) as RowNumber
	from [dbo].[tbltransaction] as U),
Transaction2022 as (Select * from [dbo].[Battletransaction]),
tblGap as (
	Select U.RowNumber,
	RowNumber - LAG(RowNumber) over (order By RowNumber) AS previousRowNumber,
	LEAD(RowNumber) over (order By RowNumber) - RowNumber as NextRowNumber,
	Case when RowNumber - LAG(RowNumber) over(order by RowNumber) = 1 then 0 else 1 end as GroupGap
	from numbers as U
Left Join Transaction2022 as T
on U.RowNumber = T.BattleId
Where T.BattleId is Null)
Select * from tblGap
GO
--Reviso de la 9 transaciones cual es la batalla meno y cual la mayor y el total de batallas
With numbers as (
	Select top(select Max(BattleId) from [dbo].[tbltransaction] ) row_Number() Over(order by (Select Null)) as RowNumber
	from [dbo].[tbltransaction] as U),
	Transaction2022 as (Select * from [dbo].[tbltransaction] Where BattleId is Null),
	tblgap as (
	Select U.RowNumber,
	RowNumber - LAG(RowNumber) over (order By RowNumber) AS previousRowNumber,
	LEAD(RowNumber) over (order By RowNumber) - RowNumber as NextRowNumber,
	Case when RowNumber - LAG(RowNumber) over(order by RowNumber) = 1 then 0 else 1 end as GroupGap
	from numbers as U
	Left Join Transaction2022 as T On U.RowNumber = T.BattleId),
	tblgroup as (
	Select *, sum(GroupGap) over (ORDER By RowNumber) as TheGroup
	from tblgap)
	Select Min(RowNumber) as StartingBattle, Max(RowNumber) AS EndingBattle,
	Max(RowNumber) - Min(RowNumber) + 1 AS NumberBatlles
	from tblgroup
	Group By TheGroup	
GO


DBCC FREEPROCCACHE WITH NO_INFOMSGS;

Select MAX(health) as Mayor, MIN(health) as menor from [dbo].[Heros]


Select * into HerosXSalud from [dbo].[Heros]
alter table HerosXSalud add rangeHealth varchar(20)

Select top 0 id, name, health into HerosXSalud
from [dbo].[Heros]
Where health is not null


Select * from HerosXSalud

drop table HerosXSalud


update HerosXSalud 
set rangeHealth = ?
Where id = ?
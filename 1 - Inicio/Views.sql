
--If exists(Select * from sys.views where name = 'ViewBattleherosdetail')
--	drop view dbo.ViewBattleherosdetail
--Go

--Forma de validar que una View este creada para luego eliminarla y crearla
-- Puede ser una forma de hacerle el alter a este View
If exists(Select * from INFORMATION_SCHEMA.VIEWS
Where [TABLE_NAME] = 'ViewBattleherosdetail' and [TABLE_SCHEMA] = 'dbo')
	drop view dbo.ViewBattleherosdetail
GO

-- Vista encriptada para que los usrios no vean desde donse se sacan los datos
CREATE VIEW ViewBattleherosdetail  WITH ENCRYPTION as

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
--Order By A.DineroBatalla desc
GO

/*Para crear un index la vista debe ser un selec Sencillo
y no debe contener group by , ni funciones, tampoco referencias
a tablas
*/
-

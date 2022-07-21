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
Id Int not null Primary key,
Amount smallmoney NOT NULL,
BattleId int Not Null,
DateOfTransaction smalldatetime NULL,
CONSTRAINT fk_battles FOREIGN KEY (BattleId) REFERENCES [dbo].[battles] (Id)
)

ALTER TABLE battles ADD CONSTRAINT FK_battles_id Primary Key (id)

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

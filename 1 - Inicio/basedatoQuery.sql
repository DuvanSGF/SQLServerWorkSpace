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


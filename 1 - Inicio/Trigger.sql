--Voy a crear un trigger sobre una la tabla para sabser cuando altermaos una vista
CREATE TRIGGER Tr_ViewBattleherosdetail
ON [dbo].[ViewBattleherosdetail]
INSTEAD OF DELETE
AS
  BEGIN
Select *, 'ViewBattleherosdetail' FROM deleted
    END

Begin tran
Select * from [dbo].[ViewBattleherosdetail] Where Cantidad = 1
Delete from ViewBattleherosdetail
Where Cantidad = 1
Select * from [dbo].[ViewBattleherosdetail] Where Cantidad = 1
Rollback tran

-- Ahora voy a crear un triger que elimine que capture los datos y
-- elimine datos de otra tabla
ALTER TRIGGER Tr_ViewBattleherosdetail
ON [dbo].[ViewBattleherosdetail]
INSTEAD OF update
AS
  BEGIN
  declare @amount as smallmoney
  Select @amount = DineroBatalla
  from inserted
  --Actualizamos el campo
  update  [dbo].[Battletransaction]
  Set amount = 1000
  Where Amount = @amount
    END

	Begin tran
Select * from [dbo].[ViewBattleherosdetail] Where Cantidad = 1

--Para desactivar un trigger
DISABLE TRIGGER [Tr_ViewBattleherosdetail] on TABLE_NAME







update ViewBattleherosdetail
SET Cantidad = 8
Where Cantidad = 1
Select * from [dbo].[ViewBattleherosdetail] Where Cantidad = 1
Rollback tran
go

Select * from [Battletransaction]

-- Tambien se puede hacer sobre una Columna

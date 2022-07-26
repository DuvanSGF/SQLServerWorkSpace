--Diferencia entre union y unio all
--Union no develuev valores repetidos mientras que el union all si
With cte as (
SELECT Sum(A.Data) as Suma FROM
(
Select 5 AS Data
Union
Select 10
Union all
Select 5
) AS A
)

SELECT Suma
into tblTempDuvan
from cte
GO

Select * from [dbo].[tblTempDuvan]

--Convert
Convert(varchar(10),2) -- Intento convertir un int (2) a varchar toma dos o mas valores

--Coalesce toma vario valores y los evaluas. almenos uno no debe ser nulo o si no genera error
declare @myFirstOption as varchar(20) --= 'Prueba'
declare @mysecondOption as varchar(20) --='Prueba2'
Select coalesce(@myFirstOption, @mysecondOption, 'No option') as myoption

-- Ejercicio con Merge Entendido Ok
Select * from [dbo].[tbltransaction] where BattleId = 1 --119
Select * from [dbo].[Battletransaction] where BattleId = 1  --109


ALTER TABLE [dbo].[Battletransaction]
drop column MERGECOLUMN


ALTER TABLE [dbo].[Battletransaction]
add  MergeColumn varchar(100)

BEGIN TRAN
MERGE INTO [dbo].[Battletransaction] as T
USING (Select BattleId, Sum(Amount) as Amount
From [dbo].[tbltransaction]
Group By BattleId) as C
ON T.BattleId = C.BattleId AND T.Amount = C.Amount
WHEN MATCHED THEN
	UPDATE SET MergeColumn  = 'Unica Batalla'
WHEN NOT MATCHED BY Source THEN
	UPDATE SET MergeColumn  = 'Mas de una Batalla'
OUTPUT Inserted.*;
Rollback Tran

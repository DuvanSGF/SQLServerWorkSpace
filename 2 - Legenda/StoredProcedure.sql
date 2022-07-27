--Formas de Busacr un sp
if exists(Select * from sys.procedure where name = 'NameSP')
--Other
If object_ID('NameEmployees','P') IS NOT NULL


--Ejercicio
-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 26-07-2022
-- Description:	Ejercicios con el try Catch
-- =============================================
/*
Realizar:
1- Devolver el total de dinero Ganado
2- Que batalla Gano mas dinero y con que campeon
3- Promedio de dinero ganado por el campeon con mas dinero ganado por batalla
4- Que campeon tiene mas victorias y cual tiene mas.
Todo esto debe ser devuelto solo teniendo el ID de la Batalla
*/


--Verificamos si existe para eliminarlo
If object_ID('SP_BattleTransaction', 'P') IS NOT NULL
Drop Procedure SP_BattleTransaction
GO

Create Procedure SP_BattleTransaction (

	@BattleId Int,
	@MessageResult varchar(Max) OUTPUT
)
AS

BEGIN
	SET NOCOUNT ON;
	DECLARE @OuputAmount Varchar(100)
    DECLARE @TotalAmount money

   DECLARE @OutputBatalla Varchar(100)


	--Verificamos si existe la Batlla
	If exists(Select * from [dbo].[Battletransaction] Where BattleId = @BattleId)
	BEGIN
	    --1
		SET @TotalAmount = (Select Sum(Amount) from [dbo].[Battletransaction] Where BattleId = @BattleId)
		SET @OuputAmount = ('La batalla #' + convert(varchar(20),@BattleId) +' tiene un total de ' + format(@TotalAmount,'C','Es-Co'))

		--2 Que batalla Gano mas dinero y con que campeon
		DECLARE @tblTemp as Table (Dinero money, Campeon varchar(50), Batalla int)
		INSERT INTO @tblTemp
		Select Dinero, Campeon, Batalla   FROM (
		Select top(1) Sum(Amount) as Dinero, C.name as Campeon,A.BattleId as Batalla from [dbo].[Battletransaction] A WITH (Nolock)
		INNER JOIN [dbo].[battles] B WITH (Nolock) ON A.BattleId = B.ID
		INNER JOIN [dbo].[Heros] C WITH (Nolock) ON B.hero_id = C.id
		Where B.Status = 1
		Group By A.BattleId, C.name
		Order By 1 DESC) AS temp
	   --Inserto Info en una nueva tabla
	--	Select * from @tblTemp
		--Obtengo la info
		SET @OutputBatalla = (SELECT 'La batalla que gano mas dinero fue la #' + Convert(Varchar(20),Batalla) + ' Con el campeón:'+ Campeon +' y el total del dinero fue' +format(dinero,'C','es-Co')from @tblTemp)
		--SELECT @OuputAmount
		--SELECT @OutputBatalla

		SET @MessageResult = (select  '-1. ' +@OuputAmount + ' -2.' + @OutputBatalla)

		RETURN 0
	END

	SET @MessageResult = 'Esta Batalla no existe'
END
GO

--Zona de ejecutar el SP
DECLARE @RC int
DECLARE @BattleId Int
DECLARE	@MessageResult varchar(MAX)
DECLARE @ReturnStatus int

-- TODO: Set parameter values here.
EXECUTE [dbo].[SP_BattleTransaction] 3, @MessageResult OUTPUT
SELECT @MessageResult, @ReturnStatus as Return_Status
--EXECUTE [dbo].[SP_BattleTransaction] 8, @AverageBalance OUTPUT
GO
---Terminar

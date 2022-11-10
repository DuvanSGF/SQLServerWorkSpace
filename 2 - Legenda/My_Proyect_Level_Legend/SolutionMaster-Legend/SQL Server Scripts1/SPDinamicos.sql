--SP DIANMICO

Use [MarvelUniverse]
GO

-- =============================================
-- Author:		Ing. Duvan Albeiro Mejia Cortes
-- Create date: 10-11-2022
-- Description:	Me trae informacion de los Heros ordenados segun el parametro
-- =============================================

ALTER PROC SP_Seleccion_Heros (
			@order char(1)
		)

AS
BEGIN
	SET NOCOUNT ON;

DECLARE @script nvarchar(Max)
DECLARE @orderby nvarchar(500)

SET @script = 'Select id, name from dbo.Heros'

SET @orderby = ( CASE WHEN @order = 'N' THEN ' ORDER BY name'
					  WHEN @order = 'I' THEN ' ORDER BY health'
			     END)

SET @script = @script + @orderby
EXECUTE SP_EXECUTESQL @script

END
GO

--Execute
--EXEC SP_Seleccion_Heros 'N'

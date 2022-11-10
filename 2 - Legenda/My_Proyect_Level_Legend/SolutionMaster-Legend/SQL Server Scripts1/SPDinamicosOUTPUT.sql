--SP DIANMICO

Use [MarvelUniverse]
GO

-- =============================================
-- Author:		Ing. Duvan Albeiro Mejia Cortes
-- Create date: 10-11-2022
-- Description:	SP Dinamico con parametro de OUTPUT
-- =============================================

ALTER PROC SP_Seleccion_Heros_Output (
			@order char(1),
			@output varchar(MAX) OUTPUT
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

SET @output = @script + @orderby
--EXECUTE SP_EXECUTESQL @script

END
GO

--Execute
DECLARE @output nvarchar(MAX) -- es el tipo requerido por SP_EXECUTE
EXEC SP_Seleccion_Heros_Output 'N',@output OUTPUT
EXECUTE SP_EXECUTESQL @output

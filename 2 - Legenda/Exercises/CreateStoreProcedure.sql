-- =============================================
-- Author:		In. Duván Albeiro Mejia Cortes
-- Create date: 23-05-2023
-- Description:	Study Creatind Store Procxedure With Diferent Structures and Concepts
-- ============================================= 

/*
[ @stmt= ] statement
Is a Unicode string that contains a Transact-SQL statement or batch. @stmt must be either a Unicode constant or a Unicode variable. 
More complex Unicode expressions, such as concatenating two strings with the + operator, are not allowed. 
Character constants are not allowed. If a Unicode constant is specified, it must be prefixed with an N. 
For example, the Unicode constant N'sp_who' is valid, but the character constant 'sp_who' is not. 
The size of the string is limited only by available database server memory. On 64-bit servers, 
the size of the string is limited to 2 GB, the maximum size of nvarchar(max).
*/



Alter PROCEDURE  SPGetHeoresByID
@ids varchar(100)
AS
declare @String NVarchar(100) = Null, @Parameters Nvarchar(100) = Null
SET NOCOUNT ON;
Begin

SET @String = N'Select * from Heros Where id = @HeroesIDs'
Set @Parameters = N'@HeroesIDs varchar(100)'

Exec sp_executesql @String,@Parameters, @HeroesIDs = @ids
End

EXEC SPGetHeoresByID '1'


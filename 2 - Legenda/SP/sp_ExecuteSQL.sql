-- =============================================
-- Author:		In. Duván Albeiro Mejia Cortes
-- Create date: 23-05-2023
-- Description:	SP_EXECUTESQL
-- ============================================= 

--Definition
/*
[ @stmt= ] statement
Is a Unicode string that contains a Transact-SQL statement or batch. @stmt must be either a Unicode constant or a Unicode variable. 
More complex Unicode expressions, such as concatenating two strings with the + operator, are not allowed. 
Character constants are not allowed. If a Unicode constant is specified, it must be prefixed with an N. 
For example, the Unicode constant N'sp_who' is valid, but the character constant 'sp_who' is not. 
The size of the string is limited only by available database server memory. On 64-bit servers, 
the size of the string is limited to 2 GB, the maximum size of nvarchar(max).
*/

--Exercise #1: Creating a Basic SP and understanding the concepts
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

--Exercise #2: Creating a SP with more ids entry and return a data

ALTER PROCEDURE SPGetHerosbyIds
(@ids varchar(2000))
AS
SET NOCOUNT ON; 
BEGIN
    declare @sql nvarchar(4000);
    SET @sql = N'Select * from Heros Where id in ('+ @ids +')'
    Exec SP_EXECUTESQL @sql

END

Exec SPGetHerosbyIds '1, 2'

--id	name	powerid	health	status	currentFlag
--1	Batman	1	50000	1	NULL
--2	Thor	2	60000	1	NULL

ALTER PROCEDURE SPGetHerosbyIdsv2
(@ids varchar(2000))
AS
SET NOCOUNT ON; 
BEGIN
    declare @sql nvarchar(4000);
    SET @sql = N'Select * from Heros Where id in ('''+ REPLACE(@ids,',',''',''') + ''')'
	--print @SQL
    Exec SP_EXECUTESQL @sql
                                          
END

Exec SPGetHerosbyIdsv2 '1,2'

--It's another way to do the same query


--Exercise #3 --DBO split -- Remeber You can create your Own Split y create my own  
Create PROCEDURE SPGetHerosbyIdsv3
(@ids varchar(2000))
AS
SET NOCOUNT ON; 
BEGIN
    declare @sql nvarchar(4000);
    SET @sql = N'Select * from Heros Where id in (Select * from dbo.split(@ids,','))'
	--print @SQL
    Exec SP_EXECUTESQL @sql                                       
END

Exec SPGetHerosbyIdsv3 '1,2'


--Exercise #3: SP with Try Catch and most advanced Structure
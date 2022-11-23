/*
	Author: Ing. Duván Albeiro Mejia Cortes
	Date: 21-11-2022
	Description: It's a personal proyect about Songs analitics using SP, Cursos and Transact-SQL (Most Advanced)
	Version: 01.23.11.2022
*/

-- 1- Create tables 4 tables 
USE HackTeam;  
GO

--Table 1
DROP TABLE IF EXISTS dbo.music2019_1;

CREATE TABLE music2019_1(
				id int primary key not null identity(1,1),
				song varchar(50) not null,
				minutesListened int null,
				yearLaunched int null,
				songDuration int null,
				likesSong int null,
				averatingSong int null,
				singerId int null,
				songTypeId int not null
				)
GO

--Table 2
DROP TABLE IF EXISTS dbo.music2019_2;

CREATE TABLE music2019_2(
				id int primary key not null identity(1,1),
				song varchar(50) not null,
				minutesListened int null,
				yearLaunched int null,
				songDuration int null,
				likesSong int null,
				averatingSong int null,
				singerId int null,
				songTypeId int not null
				)

--Table 3
DROP TABLE IF EXISTS dbo.music2020_1;

CREATE TABLE music2020_1(
				id int primary key not null identity(1,1),
				song varchar(50) not null,
				minutesListened int null,
				yearLaunched int null,
				songDuration int null,
				likesSong int null,
				averatingSong int null,
				singerId int null,
				songTypeId int not null
				)
GO

--Table 4
DROP TABLE IF EXISTS dbo.music2020_2;

CREATE TABLE music2020_2(
				id int primary key not null identity(1,1),
				song varchar(50) not null,
				minutesListened int null,
				yearLaunched int null,
				songDuration int null,
				likesSong int null,
				averatingSong int null,
				singerId int null,
				songTypeId int not null
				)

--Table 5
DROP TABLE IF EXISTS dbo.music2021_1;

CREATE TABLE music2021_1(
				id int primary key not null identity(1,1),
				song varchar(50) not null,
				minutesListened int null,
				yearLaunched int null,
				songDuration int null,
				likesSong int null,
				averatingSong int null,
				singerId int null,
				songTypeId int not null
				)
GO

--Table 6
DROP TABLE IF EXISTS dbo.music2021_2;

CREATE TABLE music2021_2(
				id int primary key not null identity(1,1),
				song varchar(50) not null,
				minutesListened int null,
				yearLaunched int null,
				songDuration int null,
				likesSong int null,
				averatingSong int null,
				singerId int null,
				songTypeId int not null
				)


--Table 7
DROP TABLE IF EXISTS dbo.music2022_1;

CREATE TABLE music2022_1(
				id int primary key not null identity(1,1),
				song varchar(50) not null,
				minutesListened int null,
				yearLaunched int null,
				songDuration int null,
				likesSong int null,
				averatingSong int null,
				singerId int null,
				songTypeId int not null
				)
GO

--Table 8
DROP TABLE IF EXISTS dbo.music2022_2;

CREATE TABLE music2022_2(
				id int primary key not null identity(1,1),
				song varchar(50) not null,
				minutesListened int null,
				yearLaunched int null,
				songDuration int null,
				likesSong int null,
				averatingSong int null,
				singerId int null,
				songTypeId int not null
				)

GO


--Insertamos los datos desde un csv



--IF OBJECT_ID('dbo.createTables', 'P') IS NOT NULL  
--   DROP PROCEDURE dbo.createTables;  
--GO  



--CREATE PROC createTables(@name varchar, 
--					     @year int, 
--					     @period int,
--						 @currentYear int,
--						 @currentPeriod int)
--AS
--BEGIN
--	SET NOCOUNT ON;

 
--WHILE @year <= @currentYear  
--BEGIN

--DECLARE @tablename varchar(100) = Concat('music',@year,@period)

-- create table Concat(MyNewTable,s)()
--	DEClARE @tablename table (
--	id int primary key identity(1,1),
--	songname varchar(100)
--	)
--	DECLARE @MyTableVar table(  
--    EmpID INT NOT NULL,  
--    OldVacationHours INT,  
--    NewVacationHours INT,  
--    ModifiedDate datetime);

----SELECT * FROM coins
--PRINT @year
--SET @year = @year + 1

--END


----WHILE (SELECT AVG(ListPrice) FROM Production.Product) < $300  
----BEGIN  
----   UPDATE Production.Product  
----      SET ListPrice = ListPrice * 2  
----   SELECT MAX(ListPrice) FROM Production.Product  
----   IF (SELECT MAX(ListPrice) FROM Production.Product) > $500  
----      BREAK  
----   ELSE  
----      CONTINUE  
----END  
----PRINT 'Too much for the market to bear';


--END

----EXEC createTables 'duvan',2018,4,2022,4


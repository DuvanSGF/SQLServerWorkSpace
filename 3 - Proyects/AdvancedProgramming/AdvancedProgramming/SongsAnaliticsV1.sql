/*
	Author: Ing. Duván Albeiro Mejia Cortes
	Date: 25-11-2022
	Description: It's a personal proyect about Songs analitics using SP, Cursos and Transact-SQL (Most Advanced)
	Version: 01.25.11.2022
	Copyright (c) 2022 Duván Mejía. All rights reserved.
*/

-- 1- Create tables 4 tables using Stored Procedure Dinamic Form
USE HackTeam;  
GO

IF OBJECT_ID('dbo.createTables', 'P') IS NOT NULL  
   DROP PROCEDURE dbo.createTables;  
GO  

CREATE PROC createTables(@tableName varchar(Max), 
					     @startYear int, 
					     @startPeriod int,
						 @finalYear int,
						 @finalPeriod int)
AS
BEGIN
	SET NOCOUNT ON;

DECLARE @initialPeriod int = @startPeriod 

WHILE @startYear <= @finalYear  
	BEGIN

	DECLARE @period int = 2 -- The year has 2 semesters or period in this case

	IF @startYear =  @finalYear SET @period = @finalPeriod;

		WHILE @initialPeriod <= @period  
			BEGIN
				DECLARE @cmd nvarchar(MAX) 
					SET @cmd =
								concat(
										'CREATE TABLE ',@tableName,@startYear,'_',@initialPeriod,' (',
																					'id int primary key not null identity(1,1),',
																					'song varchar(50) not null,',
																					'minutesListened int null,',
																					'yearLaunched int null,',
																					'songDuration int null,',
																					'likeSong int null,',
																					'averatingSong int null,',
																					'singerId int null)');

					EXECUTE sp_executesql @cmd

					SET @initialPeriod = @initialPeriod + 1
			END
	SET @startYear = @startYear + 1
	SET @initialPeriod = 1
	END
END

--EXEC createTables 'music',2019,2,2022,2
--See result tables Image



 
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



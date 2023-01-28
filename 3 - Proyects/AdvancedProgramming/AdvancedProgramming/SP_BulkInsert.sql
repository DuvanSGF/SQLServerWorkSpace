/*
	Author: Ing. Duván Albeiro Mejia Cortes
	Date: 25-11-2022
	Description: It's a personal proyect about Songs analitics using SP, Cursos and Transact-SQL (Most Advanced)
	Version: 01.25.11.2022
	Copyright (c) 2022 Duván Mejía. All rights reserved.
*/

BULK INSERT [dbo].[music2019_2]

FROM 
	'C:\Users\Public\Documents\Music.csv'

WITH (
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2 
)

sELECT * FROM [dbo].[music2019_2]
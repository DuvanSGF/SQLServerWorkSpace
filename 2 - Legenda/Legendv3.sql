-- =============================================
-- Author:		Ing. Duv�n Mejia
-- Create date: 2022-08-09
-- Description:	Exercise Advanced for SQL Server V3
-- =============================================
USE HackTeam;
GO

--Verifico si existen la tabla
drop table if exists scoretable;
GO

--Creacion de la tabla scoretable
create table scoretable(
 event_id int not null,
 participant_name varchar(25),
 score float
)
GO

-- Inserto los datos correspondientes a las transacciones
INSERT INTO [dbo].[scoretable] (event_id,participant_name,score)
values ('2187','Clemencia','9'),
	   ('2187','Clemencia','6.6'),
	   ('2187','Clemencia','8.6'),
	   ('2187','Susannah','8.8'),
	   ('2187','Susannah','10'),
	   ('2187','Susannah','8.2'),
	   ('2187','Sixta','7.4'),
	   ('2187','Sixta','9.8'),
	   ('2187','Sixta','6.2'),
	   ('2187','Otto','9.8'),
	   ('2187','Otto','7.2'),
	   ('2187','Otto','8.8'),
	   ('2187','Anita','8.4'),
	   ('2187','Anita','8.6'),
	   ('2187','Anita','6.6'),
	   ('2187','Arielle','6.8'),
	   ('2187','Arielle','8.4'),
	   ('2187','Arielle','7.6'),
	   ('2187','Nakita','6.6'),
	   ('2187','Nakita','7.6'),
	   ('2187','Nakita','9.8'),
	   ('4361','Kayla','8.8'),
	   ('4361','Kayla','6.8'),
	   ('4361','Kayla','8.8'),
	   ('4361','Brice','6.4'),
	   ('4361','Brice','7.8'),
	   ('4361','Brice','7.6'),
	   ('4361','Pura','9.8'),
	   ('4361','Pura','9.4'),
	   ('4361','Pura','7.6'),
	   ('4361','Elissa','9.6'),
	   ('4361','Elissa','7.8'),
	   ('4361','Elissa','7.4'),
	   ('4361','Florinda','8.6'),
	   ('4361','Florinda','8.8'),
	   ('4361','Florinda','7.4'),
	   ('4361','Eloise','6.6'),
	   ('4361','Eloise','7.6'),
	   ('4361','Eloise','7.6'),
	   ('4361','Rachele','7.4'),
	   ('4361','Rachele','9.2'),
	   ('4361','Rachele','6.8'),
	   ('4361','Helga','6.6'),
	   ('4361','Helga','9'),
	   ('4361','Helga','7.6'),
	   ('4361','Joya','9.6'),
	   ('4361','Joya','8.6'),
	   ('4361','Joya','8.8'),
	   ('3478','Art','8.4'),
	   ('3478','Art','8.2'),
	   ('3478','Art','8.2'),
	   ('3478','Charmaine','9.6'),
	   ('3478','Charmaine','7.4'),
	   ('3478','Charmaine','8'),
	   ('3478','Amal','8.6'),
	   ('3478','Amal','7.6'),
	   ('3478','Amal','7.8'),
	   ('3478','Mayola','6.4'),
	   ('3478','Mayola','6.8'),
	   ('3478','Mayola','7.2'),
	   ('3478','Karole','6.6'),
	   ('3478','Karole','8.2'),
	   ('3478','Karole','9.4'),
	   ('3478','Piedad','6.2'),
	   ('3478','Piedad','7.6'),
	   ('3478','Piedad','7.8'),
	   ('3478','Hiram','9.6'),
	   ('3478','Hiram','7.2'),
	   ('3478','Hiram','8.8'),
	   ('3478','Treasa','9.4'),
	   ('3478','Treasa','6.6'),
	   ('3478','Treasa','6.2'),
	   ('3478','Pa','6.8'),
	   ('3478','Pa','8.6'),
	   ('3478','Pa','7')
GO
--Consulto las tabla
Select * from [dbo].[scoretable]

-- =============================================
-- Author:		Ing. Duván Mejia
-- Create date: 2022-08-09
-- Description:	Exercise Advanced for SQL Server V1
-- =============================================
USE HackTeam;
GO

--Verifico si existen las tablas
drop table if exists transactions;
drop table if exists coins;
GO

--Creacion de la tabla Coins
create table coins(
 code varchar(4) not null primary Key,
 name varchar(64),
 algorithm varchar(128)
)
GO

--Creacion de la tabla de transacciones
create table transactions (
 coin_code varchar(4),
 dt varchar(19),
 volume decimal(11,6)
 constraint fk_code_coins FOREIGN KEY (coin_code) REFERENCES [dbo].[coins] (code)
)
GO

 -- Inserto los datos correspodientes a los Coins
INSERT INTO [dbo].[coins] (code,name,algorithm)
values ('BTC','Bitcoin','SHA-256'),('DOGE','Dogecoin','Scrypt'),('ETH','Etherium','Ethash'),('LTC','litecoin','Scrypt'),('XMR','Monero','RandomX')
GO

-- Inserto los datos correspondientes a las transacciones
INSERT INTO [dbo].[transactions] (coin_code,dt,volume)
values ('LTC','2021-04-05 04:30:30','422.830473'),
	   ('DOGE','2020-01-22 07:44:35','55.225905'),
	   ('BTC','2019-10-19 06:32:46','6906.520151'),
	   ('DOGE','2020-01-29 12:21:19','9370.519560'),
	   ('BTC','2020-04-05 12:38:54','4775.700964'),
	   ('DOGE','2019-12-16 13:41:53','8865.966189'),
	   ('BTC','2019-12-07 02:24:27','9086.928039'),
	   ('ETH','2020-04-21 21:27:43','7273.565939'),
	   ('DOGE','2020-08-25 19:09:10','8027.924009'),
	   ('ETH','2020-06-04 03:53:39','6736.423699'),
	   ('DOGE','2019-12-23 00:13:13','6704.032765'),
	   ('LTC','2021-04-01 23:13:14','3117.003666'),
	   ('XMR','2020-10-10 17:50:52','1989.514313'),
	   ('BTC','2020-10-09 13:56:39','9776.150048'),
	   ('DOGE','2021-03-11 18:57:57','4346.517803'),
	   ('BTC','2019-12-10 11:28:37','3287.686066'),
	   ('DOGE','2019-11-28 01:05:59','7108.628739'),
	   ('BTC','2020-07-16 18:26:49','971.325293'),
	   ('BTC','2020-04-22 03:32:11','2389.737999'),
	   ('LTC','2020-08-22 22:13:59','1079.398703')
GO
--Consulto las tablas
Select * from [dbo].[coins]
Select * from [dbo].[transactions]

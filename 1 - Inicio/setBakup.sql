USE [master]
GO
/****** Object:  Database [MarvelUniverse]    Script Date: 12/07/2022 12:36:11 p. m. ******/
CREATE DATABASE [MarvelUniverse]
 CONTAINMENT = NONE
 ON  PRIMARY
( NAME = N'MarvelUniverse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MarvelUniverse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON
( NAME = N'MarvelUniverse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MarvelUniverse_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MarvelUniverse] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MarvelUniverse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MarvelUniverse] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [MarvelUniverse] SET ANSI_NULLS OFF
GO
ALTER DATABASE [MarvelUniverse] SET ANSI_PADDING OFF
GO
ALTER DATABASE [MarvelUniverse] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [MarvelUniverse] SET ARITHABORT OFF
GO
ALTER DATABASE [MarvelUniverse] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [MarvelUniverse] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [MarvelUniverse] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [MarvelUniverse] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [MarvelUniverse] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [MarvelUniverse] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [MarvelUniverse] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [MarvelUniverse] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [MarvelUniverse] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [MarvelUniverse] SET  ENABLE_BROKER
GO
ALTER DATABASE [MarvelUniverse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [MarvelUniverse] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [MarvelUniverse] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [MarvelUniverse] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [MarvelUniverse] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [MarvelUniverse] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [MarvelUniverse] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [MarvelUniverse] SET RECOVERY FULL
GO
ALTER DATABASE [MarvelUniverse] SET  MULTI_USER
GO
ALTER DATABASE [MarvelUniverse] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [MarvelUniverse] SET DB_CHAINING OFF
GO
ALTER DATABASE [MarvelUniverse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [MarvelUniverse] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [MarvelUniverse] SET DELAYED_DURABILITY = DISABLED
GO
ALTER DATABASE [MarvelUniverse] SET ACCELERATED_DATABASE_RECOVERY = OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'MarvelUniverse', N'ON'
GO
ALTER DATABASE [MarvelUniverse] SET QUERY_STORE = OFF
GO
USE [MarvelUniverse]
GO
/****** Object:  User [MarvelUniverse]    Script Date: 12/07/2022 12:36:11 p. m. ******/
CREATE USER [MarvelUniverse] FOR LOGIN [batman] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [MarvelUniverse]
GO
/****** Object:  Table [dbo].[Heros]    Script Date: 12/07/2022 12:36:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Heros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[powerid] [int] NULL,
	[health] [int] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Heros] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Heros] ADD  CONSTRAINT [DF_Heros_status]  DEFAULT ((1)) FOR [status]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 Inactivo 1 - Activo ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Heros', @level2type=N'COLUMN',@level2name=N'status'
GO
USE [master]
GO
ALTER DATABASE [MarvelUniverse] SET  READ_WRITE
GO

--WithDiferencia
BACKUP DATABASE [AdventureWorks2012] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\AdventureWorks2012diff.diff' WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'AdventureWorks2012-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--FullBackup
BACKUP DATABASE [AdventureWorks2012] TO  DISK = N'C:\Backup\pruebaBackup.bak'
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2012-Full Database Backup',
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

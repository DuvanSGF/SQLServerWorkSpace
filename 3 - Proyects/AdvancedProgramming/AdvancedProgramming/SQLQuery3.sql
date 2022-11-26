
DECLARE @cmd nvarchar(MAX) 
DECLARE @year int = 2020
DECLARE @period int = 2
SET @cmd =
              concat(
                    'CREATE TABLE tblComplementoIterado',@year,'_',@period,' (',
																			 'id int primary key not null identity(1,1),',
																             'song varchar(50) not null,',
																			 'minutesListened int null,',
																			 'yearLaunched int null,',
																			 'songDuration int null,',
																			 'likeSong int null,',
																			 'averatingSong int null,',
																			 'singerId int null)');
     -- print @cmd;


EXECUTE sp_executesql @cmd

--EXEC sp_unprepare @cmd



3017782851



DECLARE @P1 INT;  
EXEC sp_prepare @P1 OUTPUT,   
    N'@P1 NVARCHAR(128), @P2 NVARCHAR(100),@P3 NVARCHAR(100)',  
    N'SELECT database_id, name FROM sys.databases WHERE name=@P1 AND state_desc = @P2 AND database_id = @P3';  
EXEC sp_execute @P1, N'tempdb', N'ONLIE', N'4';  
EXEC sp_unprepare @P1;

SELECT database_id,name ,state_desc FROM sys.databases
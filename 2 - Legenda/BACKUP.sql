-- Ejemplos de Backup
BACKUP DATABASE [HackTeamRestore] TO  DISK = N'C:\Backup\prueba.bak'
WITH NO_COMPRESSION, NOFORMAT, NOINIT,
NAME = N'HackTeamRestore-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,
STATS = 10
GO

BACKUP DATABASE [HackTeamRestore] TO  DISK = N'C:\Backup\prueba.bak'
WITH NO_COMPRESSION, NAME = N'HackTeamRestore-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,
STATS = 10
GO

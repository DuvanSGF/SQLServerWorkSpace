--Idioma de la sesion actual 
Select @@Language as Idioma

--Devuelve le tiempo de bloqueo de la sesion actual 
Select @@LOCK_TIMEOUT


-- Tambien podemos establecer un tiempo para el tiempo de bloqueo 
SET LOCK_TIMEOUT 2500;  
SELECT @@LOCK_TIMEOUT AS TiempoBloqueo;  
GO 

--Numero maximo de conexiones que tenemos en esta instancia, el n�mero devuelto no es necesariamente el n�mero configurado actualmente.
Select @@MAX_CONNECTIONS as MaximasConexiones
GO
--Si necesitamos realizar algunas configuraciones utilizamos este metodo
sp_configure
Go

--Devuelve el nivel de precisi�n usado por los tipos de datos decimales y num�ricos 
Select @@MAX_PRECISION as MaximaPresicion
GO


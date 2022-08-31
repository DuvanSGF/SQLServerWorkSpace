--Reiniciomos el Id identity a 1D cuando eliminos datos
DBCC CHECKIDENT ('NombreTabla', RESEED, 0)

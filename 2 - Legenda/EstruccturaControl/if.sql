--Ejercicio de If
declare @idbattle int
set @idbattle = 5
set @idhero = 2

if @idbattle = 5
BEGIN
set @idhero = 5
 Select * from battle where id = @idbattle
 print @idhero
  if exits(Select * from battle = 1)
  print 'Existe'
END
ELSE
BEGIN
  Print 'No se cumplio la condicion'
END

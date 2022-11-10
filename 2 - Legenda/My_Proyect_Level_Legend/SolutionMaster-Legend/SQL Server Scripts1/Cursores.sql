--DEFINICION

/*

- Es una estructura que permite recorrer un conjunto de registros de una tabla
segun una condicion y ejecutar sentencias T-SQL especificas para procesar datos


- Su uso puede aplicarse para actualizar grupos de registros, permitiendo recorrer uno a uno
los mismos

- Tambien puede utilizarse para realizar reportes complejos

*/

--Estructira basica

DECLARE miCursor CURSOR FOR
Select * from Heros

open miCursor

FETCH NEXT FROM miCursor -- Cargar en memoria el primer registro 

WHILE @@FETCH_STATUS = 0 -- Si  ha llegado el final es diferente de 0
	--Logica del cursor
CLOSE miCursor

DEALLOCATE miCursor  --Liberar de la memoria lo que ocupa un cursor





--Es importante conocer las buenas practicas de conocer
-- de la funcion with Nolock.
-- https://www.sqlshack.com/es/sugerencias-de-tabla-de-sql-server-con-nolock-las-mejores-practicas/

SELECT * FROM LockTestDemo WITH (NOLOCK)
SELECT * FROM LockTestDemo WITH (READUNCOMMITTED)

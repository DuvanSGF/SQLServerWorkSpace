
--BUSQUEDAS EN CAMPOS
--Ing. Duvan Mejia Cortes  -- Software Engineer


--CONSTAINS (Para busquedas mas precisas)

Select * from Person.Address A
Where Contains(A.AddressLine1,'avenue')


--CONTAINS/AND/AND NOT /OR
Select * from Person.Address A
Where CONTAINS(A.AddressLine1, 'avenue AND port AND NOT 34') -- You can combine whatever you want

--CONTAINS NEAR
Select * from Person.Address A
where contains(A.AddressLine1,'"5415 san" NEAR dr')

--Encontrar de acuerdo entre palabras -  5 Cantidad de palabras en medio 
Select * from Person.Address A
where contains(A.AddressLine1,'NEAR((21,centrale), 5)')


--FORMSOF INFLECTIONAL (Sustantivos)
--Buscar palabras como sustantivos 
Select * from Person.Address A
where contains(A.AddressLine1,'FORMSOF(INFLECTIONAL, "avenue")')


--FORMSOF INFLECTIONAL (Verbos)
--Buscar palabras como verbos
Select * from Person.Address A
where contains(A.AddressLine1,'FORMSOF(INFLECTIONAL, "venir")',LANGUAGE 3082)
--Localidad Esapña


--OBTENER TODOS LOS TIEMPOS VERBALES DE UN VERBO
Select display_term
from SYS.DM_FTS_PARSER('FORMSOF(INFLECTIONAL,trabajo)',3082,0,0)

--FREETEXT
--Me trae todos los registros que tengan todos los mismos registos. 
Select * from Person.Address A
Where FREETEXT(A.AddressLine1,'street')

Select * from Person.Address A
Where FREETEXT(A.AddressLine1,'"Vine Street"')


--Population de una tabla
ALTER FULLTEXT INDEX ON Person.Address START FULL POPULATION
ALTER FULLTEXT INDEX ON Person.Address START UPDATE POPULATION


/*
Ventajas

- Los resultados de busquedas son ecelentes
- El motor de busqueda admite muchos textos y variantes
- El tiempo de respuesta de la consulta es muy bueno. 
- Tiene la opcion de buscar por sustantivos y verbos.
- Permite el uso de AND, AND NOT, OR


Desventajas

- Se debe configurar cada tabla/campo donde deseamos buscar
- Implementar varios tipos de busqueda puede ser un tanto compleja. 
- Si el catalogo esta desactualizado, es posible que para determinada busqueda no funcione. 



*/







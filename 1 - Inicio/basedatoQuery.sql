--Con esta consulta obtenemos el 50% de los datos a mostrar
Select top(50) Percent *
From Productos
Where existencia Between 200 and 400
Order by existencia asc

--Join con clausula Having y oreder By con alias
Select B.name,SUM(A.Damage) as Dañototal from Battles A
Join Heros B
On A.hero_id = B.id
Group By B.name
Having Sum(A.Damage) > 554222
Order By 2 ASC

-- https://leetcode.com/problems/consecutive-numbers/

create table repeatNumber
(
id int primary key identity(1,1),
num int

)

Insert into repeatNumber values(5),(5),(5),(2),(2),(1),(2),(2)

Select * from repeatNumber

--Solution
go
--select num,Dense_Rank() over (order by num ) as repetidos from repeatNumber
With Temptable as (
Select id, 
LAG(num) over (Order by id) as NumeroPrev,
num as NumeroActual ,
LEAD(num) over (Order by id) as NumeroNext
from repeatNumber
)

Select NumeroActual from Temptable
Where (NumeroPrev = NumeroActual AND NumeroActual = NumeroNext)
Group By NumeroActual

-- =============================================
-- Author:		In. Duván Albeiro Mejia Cortes
-- Create date: 11-06-2023
-- Description:	601. Human Traffic of Stadium
-- ============================================= 

--https://leetcode.com/problems/human-traffic-of-stadium/description/



With Batman as (
SELECT 
	   *,
LAG(people) OVER (ORDER BY Day(id)) AS PreviousPeople1,
LAG(people,2) OVER (ORDER BY Day(id)) AS PreviousPeople2,
LEAD(people) OVER (ORDER BY Day(id)) AS NextPeople1,
LEAD(people,2) OVER (ORDER BY Day(id)) AS NextPeople2
from Stadium
),
Hola as (
Select id,visit_date,people
	  from Batman 
	  WHERE (people >= 100 and NextPeople1 >= 100 and NextPeople2 >= 100 )
	  or (people >= 100 and  NextPeople1 >= 100 and PreviousPeople1 >= 100 )
	  or (people >= 100 and  PreviousPeople1 >= 100 and PreviousPeople2 >= 100 )	  
)
Select id, visit_date, people from Hola
Order By visit_date asc


--Second Solution
select id  , visit_date  , people 
from
(
 select * , 

           lead(PeopleMoreThan100) over (order by id) lead1,

           lead(PeopleMoreThan100,2) over(order by id) lead2,

           lag(PeopleMoreThan100) over(order by id) lag1,

           lag(PeopleMoreThan100,2) over(order by id) lag2

    from

    (

        select id , visit_date  , people ,

               case when people>= 100

                    then 1

                    else 0

                    end as PeopleMoreThan100

        from stadium

    ) temp

)temp1

where (PeopleMoreThan100 = 1 and lead1 = 1 and lead2 = 1)

      or

      (PeopleMoreThan100 = 1 and lead1 = 1 and lag1 =1)

      or

      (PeopleMoreThan100 = 1 and lag1 = 1 and lag2 = 1)
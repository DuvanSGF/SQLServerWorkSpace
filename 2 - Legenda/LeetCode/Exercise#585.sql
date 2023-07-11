-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 26-05-2023
-- Description:	585. Investments in 2016
-- ============================================= 

--https://leetcode.com/problems/investments-in-2016/description/

With Prueba as (
Select tiv_2015,tiv_2016, Concat(lat,lon) as Place 
from Insurance
Where tiv_2015 in (
		Select tiv_2015
		from Insurance
		Group By tiv_2015
		having count(tiv_2015) > 1 )
		AND Concat(lat,lon) in (Select Concat(lat,lon) from Insurance Group By Concat(lat,lon) having count(Concat(lat,lon)) < 2)) 
Select Round(Sum(tiv_2016),2) as tiv_2016 from Prueba
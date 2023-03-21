--https://leetcode.com/problems/rising-temperature/

--Create table Weather
--(
--id int identity(1,1) not null,
--recordDate datetime, 
--temperature int

--)
--go

--Insert into Weather values (DATEADD(d,+4,GETDATE()),100),(DATEADD(d,-2,GETDATE()),25),(DATEADD(d,-1,GETDATE()),20),(GETDATE(),30),(DATEADD(d,+1,GETDATE()),35)
--GO

Select * from Weather
GO

With ComparisonWeather as(
Select *,
	LAG(temperature) over (order By recordDate) as PreviousTemperature,
	LEAD(temperature) over (order By recordDate) as NextTemperature,
	Day(recordDate) as Today,
	LAG(Day(recordDate)) over (order By recordDate) as PreviousDay,
	Day(recordDate) -1 as Yesterday,
	DATEADD(day, -1, recordDate) as  fecha
	from Weather
)
Select id from ComparisonWeather
Where temperature > PreviousTemperature and PreviousTemperature is not null 
and PreviousDay = Yesterday 
and PreviousDay is not null 
and NextTemperature is not null


select W1.id as Id
from Weather W1, Weather W2
where W2.recordDate = DATEADD(day, -1, W1.recordDate) 
and W1.temperature > W2.temperature

SELECT Today.id FROM Weather Today, Weather Yesterday
WHERE DATEDIFF(DAY, Today.recordDate, Yesterday.recordDate) = -1
AND Today.temperature > Yesterday.temperature





Order by recordDate

Select DATEADD(day, -1, W1.recordDate) 

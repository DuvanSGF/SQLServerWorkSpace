-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 18-05-2023
-- Description:	262. Trips and Users LeetCode - Hard
-- ============================================= 

/*
Note : It's not the only solution for this exercise
there other different ways, In a real Life, I can 
Create a better Query using Temp Table To clean the data,
But in leet code you can use your Imagination and your Logic.
REMEMBER you're a Rock!!
*/

--https://leetcode.com/problems/trips-and-users/
--262. Trips and Users

--CTE to Join All my separed queries
With Batman as (
Select A.request_at as [Day],  
ISNULL(TotalTable.CantidadCarrerasValidas,0) AS Total, 
ISNULL(TotalCanceled.CantidadCarrerasCanceladas,0) as Cancel,ISNULL(TotalBanned.CantidadCarrerasBaneadas,0) as Banned, 
ISNULL(TotalCanceledBanned.CantidadCarrerasBaneadasCanceladas,0) as BannedAndCanceled,
ISNULL(TotalDriverBanned.CantidadCarrerasBaneadasDriver,0) as CantidadCarrerasBaneadasDriver,
ISNULL(TotalBannedCanceledConductor.CantidadCarrerasBaneadas,0) AS TotalBannedCanceledConductorD
from trips A
LEFT JOIN 
(
--Total Request
Select A.request_at as Fecha, Cast(Count(A.request_aT) as decimal(7,2)) as CantidadCarrerasValidas from trips A 
Inner join users B On A.client_id = B.users_id
Group BY A.request_aT
) TotalTable On A.request_at = TotalTable.Fecha
LEFT JOIN
(
--Total User Cancelled Request
Select A.request_at as Fecha, Cast(Count(A.request_aT) as decimal(7,2)) as CantidadCarrerasCanceladas from trips A 
Inner join users B On A.client_id = B.users_id
Where A.status Like '%cancelled%'
Group BY A.request_aT
) TotalCanceled on A.request_at = TotalCanceled.Fecha
LEFT JOIN 
(
--Total User Banned
Select A.request_at as Fecha, Cast(Count(A.request_aT) as decimal(7,2)) as CantidadCarrerasBaneadas from trips A 
left join users B On A.client_id = B.users_id
Where B.banned Like '%Yes%'
Group BY A.request_aT
) TotalBanned on A.request_at = TotalBanned.Fecha
LEFT JOIN 
(
--Total UserBanned and Canceled
Select A.request_at as Fecha, Cast(Count(A.request_aT) as decimal(7,2)) as CantidadCarrerasBaneadasCanceladas from trips A 
Inner join users B On A.client_id = B.users_id
Where B.banned Like '%Y%' AND A.status Like '%cancelled%'
Group BY A.request_aT
) TotalCanceledBanned on A.request_at = TotalCanceledBanned.Fecha
LEFT JOIN 
(
--Total Driver Banned
Select A.request_at as Fecha, Cast(Count(A.request_aT) as decimal(7,2)) as CantidadCarrerasBaneadasDriver from trips A 
Inner join users B On A.driver_id = B.users_id
Where B.banned Like '%Y%'
Group BY A.request_aT
) TotalDriverBanned on A.request_at = TotalDriverBanned.Fecha
LEFT JOIN 
(
--Total Driver Banned and Canceled   
Select A.request_at as Fecha, Cast(Count(A.request_aT) as decimal(7,2)) as CantidadCarrerasBaneadas from trips A 
Inner join users B On A.driver_id = B.users_id
Where B.banned Like '%Y%' AND A.status Like '%cancelled%'
Group BY A.request_aT
) AS TotalBannedCanceledConductor on A.request_at = TotalBannedCanceledConductor.Fecha
)
--Final Table with specific Operations
Select Day, ROUND(Cast((Cancel - (BannedAndCanceled+TotalBannedCanceledConductorD)) / (Total-Banned) as float),2) as [Cancellation Rate] from Batman 
Where Day  BETWEEN '2013-10-01' AND '2013-10-03' and (Total-(Banned+CantidadCarrerasBaneadasDriver)) > 0 
Group By day, Total,Cancel,Banned,BannedAndCanceled,CantidadCarrerasBaneadasDriver,TotalBannedCanceledConductorD


--Smile, God loves you!!
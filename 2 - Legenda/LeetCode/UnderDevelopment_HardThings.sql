-- =============================================
-- Author:		Ing. Duván Albeiro Mejia Cortes
-- Create date: 09-08-2023
-- Description:	1179. Reformat Department Table
-- Level:   Medium
-- =============================================

--https://leetcode.com/problems/monthly-transactions-i/

/* Write your T-SQL query statement below */



--Primera Parte 
SELECT 
	CONCAT(DATEPART(year,trans_date), '-',DATEPART(month,trans_date)) AS [month]
	,country
	,Count(trans_date) AS [trans_count] 
	,sum(amount) 
FROM Transactions
GROUP BY CONCAT(DATEPART(year,trans_date), '-',DATEPART(month,trans_date)),country
ORDER BY CONCAT(DATEPART(year,trans_date), '-',DATEPART(month,trans_date)) ASC

--Segunda Parte 
	SELECT 
		CONCAT(DATEPART(year,A.trans_date), '-',DATEPART(month,A.trans_date)) AS [month]
		,country
		,(CASE [state]
			WHEN 'approved' THEN 1 
			ELSE 0
			END) AS approved_count
	   , [approved_total_amount] = iif(state <> 'declined',SUM(amount),0) 
FROM Transactions A
--Where A.State = 'approved'
GROUP BY CONCAT(DATEPART(year,trans_date), '-',DATEPART(month,trans_date)),country,state

DECLARE @a INT = 45, @b INT = 40;
SELECT [Result] = IIF( @a > @b, 'TRUE', 'FALSE' );







--Solution 1
SELECT 
	CONCAT(DATEPART(year,T.trans_date), '-',FORMAT(T.trans_date,'MM')) AS [month] --SELECT FORMAT(SYSUTCDATETIME(),'MM') as fecha;
	,T.country
	,COUNT(T.trans_date) AS [trans_count]
	,DT.approved_count
	,SUM(T.amount) AS [trans_total_amount]
	,DT.approved_total_amount
FROM Transactions T
INNER JOIN 
	(
	    SELECT 
			 CONCAT(DATEPART(year,A.trans_date), '-',FORMAT(A.trans_date,'MM')) AS [month]
		    ,country
			,SUM(CASE [state]
					WHEN 'approved' THEN 1 
					ELSE 0
					END) AS approved_count
			,SUM(amount) AS approved_total_amount
		FROM Transactions A
	--	WHERE A.State = 'approved'
		GROUP BY CONCAT(DATEPART(year,A.trans_date), '-',FORMAT(A.trans_date,'MM')),country
	) DT
	ON CONCAT(DATEPART(year,T.trans_date), '-',FORMAT(T.trans_date,'MM')) = DT.month and T.country = DT.country 
GROUP BY CONCAT(DATEPART(year,T.trans_date), '-',FORMAT(T.trans_date,'MM')),T.country,DT.approved_count,DT.approved_total_amount
ORDER BY CONCAT(DATEPART(year,T.trans_date), '-',FORMAT(T.trans_date,'MM')) ASC

--SELECT YEAR(0), MONTH(0), DAY(0);
--SELECT CONVERT(VARCHAR(5),GETDATE(),103) Fecha;
--SELECT CONCAT(MONTH(GETDATE()), '/', Day(GetDate())) as Fecha
--SELECT FORMAT(SYSUTCDATETIME(),'MM') as fecha;



CREATE TABLE Transactions
(
id int , 
country varchar(50),
state varchar(50),
amount int,
trans_date date
)

INSERT INTO Transactions VALUES (121,'US','approved',1000,'2018-12-18'),(122,'US','declined',2000,'2018-12-19'),(123,'US','approved',2000,'2019-01-01'),(124,'DE','approved',2000,'2018-01-01')
BEGIN TRAN
UPDATE  Transactions
SET state = 'approved'
where id in ( 121,123,124)
COMMIT

Select * from Transactions
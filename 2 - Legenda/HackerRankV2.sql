-- =============================================
-- Author:		Ing. Duván Mejia
-- Create date: 2022-08-09
-- Description:	Exercise Advanced for SQL Server V2
-- =============================================

--Forma de hacerlo nivel Jr SQL Developer
--Imprimir valor total de las transacciones de los coins por trimestre

with Q1 as (
Select  B.algorithm, Sum(A.volume) as Q1 from [transactions] A
join [coins] B With(Nolock) on A.coin_code = B.code
where A.dt Between '20200101' and '20200331'
group by  B.algorithm
),
Q2 as (
Select B.algorithm, Sum(A.volume) as Q2 from [transactions] A
join [coins] B With(Nolock) on A.coin_code = B.code
where A.dt Between '20200401' and '20200631'
group by  B.algorithm
),
Q3 as (
Select B.algorithm, Sum(A.volume) as Q3 from [transactions] A
join [coins] B With(Nolock) on A.coin_code = B.code
where A.dt Between '20200701' and '20200931'
group by B.algorithm
),
Q4 as (
Select B.algorithm, Sum(A.volume) as Q4 from [transactions] A
join [coins] B With(Nolock) on A.coin_code = B.code
where A.dt Between '20201001' and '20201231'
group by B.algorithm
)
Select algorithm, Q1,Q2,Q3,Q4 from
(
Select A.algorithm,ISNULL(B.Q1,0.000000) AS Q1,ISNULL(C.Q2,0.000000) as Q2, ISNULL(D.Q3,0.000000) as Q3, ISNULL(E.Q4,0.000000) as Q4 FROM [coins] A
left Join Q1 B With(Nolock) On A.algorithm = B.algorithm
left join Q2 C With(Nolock) On A.algorithm = C.algorithm
left join Q3 D With(Nolock) On A.algorithm = D.algorithm
Left join Q4 E With(Nolock) On A.algorithm = E.algorithm
Group By A.algorithm, Q1,C.Q2,D.Q3,E.Q4
) as tblTransaction
ORDER by algorithm


-- Segunda Forma de Hacerlo Nivel Sr SQL developer

WITH quarterly_volume as (

SELECT 
        algorithm,
        SUM(volume) as volume,
        datepart(quarter,dt) as quarters
        
FROM    coins c
JOIN    transactions t ON t.coin_code = c.code
WHERE   datepart(year,dt) = 2020
GROUP BY algorithm, datepart(quarter,dt)

)

Select algorithm, transactions_Q1,transactions_Q2,transactions_Q3,transactions_Q4 from
(
Select A.algorithm,B.volume AS transactions_Q1,C.volume as transactions_Q2, D.volume as transactions_Q3,E.volume as transactions_Q4 FROM [coins] A
left Join quarterly_volume B With(Nolock) On A.algorithm = B.algorithm AND B.quarters = 1  
left join quarterly_volume C With(Nolock) On A.algorithm = C.algorithm AND C.quarters = 2  
left join quarterly_volume D With(Nolock) On A.algorithm = D.algorithm AND D.quarters = 3  
Left join quarterly_volume E With(Nolock) On A.algorithm = E.algorithm AND E.quarters = 4  
Group By A.algorithm, B.volume,C.volume,D.volume,E.volume
) as tblTransaction
ORDER by algorithm
-- =============================================
-- Author:		Ing. Duván Mejia
-- Create date: 2022-08-09
-- Description:	Exercise Advanced for SQL Server V2
-- =============================================
USE HackTeam;
GO

--Imprimir valor total de las transacciones de los coins por trimestre

with Q1 as (
Select  B.algorithm, Sum(A.volume) as Q1 from [dbo].[transactions] A
join [dbo].[coins] B With(Nolock) on A.coin_code = B.code
where A.dt Between '20200101' and '20200331'
group by  B.algorithm
),
Q2 as (
Select B.algorithm, Sum(A.volume) as Q2 from [dbo].[transactions] A
join [dbo].[coins] B With(Nolock) on A.coin_code = B.code
where A.dt Between '20200401' and '20200631'
group by  B.algorithm
),
Q3 as (
Select B.algorithm, Sum(A.volume) as Q3 from [dbo].[transactions] A
join [dbo].[coins] B With(Nolock) on A.coin_code = B.code
where A.dt Between '20200701' and '20200931'
group by B.algorithm
),
Q4 as (
Select B.algorithm, Sum(A.volume) as Q4 from [dbo].[transactions] A
join [dbo].[coins] B With(Nolock) on A.coin_code = B.code
where A.dt Between '20201001' and '20201231'
group by B.algorithm
)

Select algorithm, Q1,Q2,Q3,Q4 from
(
Select A.algorithm,ISNULL(B.Q1,0.000000) AS Q1,ISNULL(C.Q2,0.000000) as Q2, ISNULL(D.Q3,0.000000) as Q3, ISNULL(E.Q4,0.000000) as Q4 FROM [dbo].[coins] A
left Join Q1 B With(Nolock) On A.algorithm = B.algorithm
left join Q2 C With(Nolock) On A.algorithm = C.algorithm
left join Q3 D With(Nolock) On A.algorithm = D.algorithm
Left join Q4 E With(Nolock) On A.algorithm = E.algorithm
Group By A.algorithm, Q1,C.Q2,D.Q3,E.Q4
) as tblTransaction
ORDER by algorithm

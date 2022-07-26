--Diferencia entre union y unio all
--Union no develuev valores repetidos mientras que el union all si
With cte as (
SELECT Sum(A.Data) as Suma FROM
(
Select 5 AS Data
Union
Select 10
Union all
Select 5
) AS A
)

SELECT Suma
into tblTempDuvan
from cte
GO

Select * from [dbo].[tblTempDuvan]

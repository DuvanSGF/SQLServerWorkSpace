--Ejercicio
Select coin_code, Sum(volume) as sumaPesos, (sum(volume)*100/(Select SUM(volume) from [dbo].[transactions])) as porcentaje
from [dbo].[transactions]
GROup by coin_code

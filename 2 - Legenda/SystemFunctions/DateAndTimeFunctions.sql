SELECT DATEPART(year, GETDATE()) as A�oActual  
    ,DATEPART(month, GETDATE()) as MesActual 
    ,DATEPART(day, GETDATE()) as DiaActual 
    ,DATEPART(dayofyear, GETDATE())  as DiaActualA�o
    ,DATEPART(weekday, GETDATE())as DiaActualSemana;

--Dia Actual
SELECT DATEPART(day, GETDATE()) as DiaActual,day(GETDATE()) as ActualDay 

-- Fecha y hora actula del sistema 
Select GETDATE() as FechaSistema

-- Fecha y hora actula del sistema Universal os
Select GETUTCDATE() as FechaSistema


-- =============================================
-- Author:		Ing. Duván Mejia Cortes
-- Create date: 27-04-2023
-- Description:	Insert Adavanced
-- =============================================
--We can make different Way to do a Insert
--1 Insert to Temp Table or specific table with this
Select name, powerId
into MyTable --Temp
from Hero
Where 1 = 1 -- If you want to Copy all informatio

-- 2. Insert With Specific values
--There two ways to do this exercise
Insert into Hero
Values ('Batman', 1)
--or
Insert Hero
Values ('Batman', 1)

--Insert into With Select
Insert Hero
Select name, powerid from HeroCopy

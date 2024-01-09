-- =============================================
-- Author:	    Ing. Duván Albeiro Mejia Cortes
-- Create date: 09-01-2024
-- Description: Unfinished Parts [Tesla SQL Interview Question]
-- Level:       Easy
-- Url:         https://datalemur.com/questions/tesla-unfinished-parts
-- ============================================= 


/* Write your T-SQL query statement below */
SELECT part, assembly_step 
FROM parts_assembly
WHERE finish_date IS NULL
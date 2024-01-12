-- =============================================
-- Author:	 Ing. Duván Albeiro Mejia Cortes
-- Create date: 12-01-2024
-- Description: Duplicate Job Listings [Linkedin SQL Interview Question]
-- Level:       Easy
-- Url:         https://datalemur.com/questions/duplicate-job-listings
-- ============================================= 


/* Write your T-SQL query statement below */
With cte as (
Select company_id, Count(title) as titleName
from job_listings
Group By company_id, title
Having COUNT(title) > 1
) 
Select COUNT(*) from cte
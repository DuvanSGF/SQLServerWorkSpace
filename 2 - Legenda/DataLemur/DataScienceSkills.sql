-- =============================================
-- Author:	    Ing. Duván Albeiro Mejia Cortes
-- Create date: 09-01-2024
-- Description: Data Science Skills [LinkedIn SQL Interview Question]
-- Level:       Easy
-- Url:         https://datalemur.com/questions/matching-skills
-- ============================================= 


/* Write your T-SQL query statement below */
SELECT candidate_id
FROM candidates
Where skill = 'Python' and skill = 'Tableau' or skill = 'PostgreSQL'    

-- Another Full Solution
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;

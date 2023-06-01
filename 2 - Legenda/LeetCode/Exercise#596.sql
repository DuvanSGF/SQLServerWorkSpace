-- =============================================
-- Author:		In. Duván Albeiro Mejia Cortes
-- Create date: 31-05-2023
-- Description:	596. Classes More Than 5 Students
-- ============================================= 

--https://leetcode.com/problems/classes-more-than-5-students/description/
Select class from Courses
group by class
Having Count(class) > 4
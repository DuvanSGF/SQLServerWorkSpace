-- =============================================
-- Author:	    Ing. Duván Albeiro Mejia Cortes
-- Create date: 25-01-2024
-- Description: Second Day Confirmation [TikTok SQL Interview Question]
-- Level:       Easy
-- Url:         https://datalemur.com/questions/second-day-confirmation
-- ============================================= 

/* Write your T-SQL query statement below */
-- First Part : Creating tables and inserting data
--Table Emails
--CREATE TABLE dbo.Emails
--(
--email_id INT, 
--user_id INT,
--signup_date DATETIME 
--)

----Insert data
--INSERT INTO dbo.Emails VALUES (121, 119, '06/14/2022 00:00:00'), (433, 920, '07/09/2022 00:00:00')

--Consulting
SELECT * FROM dbo.Emails

----Table Texts
--CREATE TABLE dbo.Texts(
--text_id INT IDENTITY(1,1) PRIMARY KEY, 
--email_id INT, 
--signup_action VARCHAR(50),
--action_date DATETIME 
--)

----Insert data
--INSERT INTO dbo.Texts VALUES (121, 'Confirmed', '06/14/2022 00:00:00'),(433, 'Not confirmed', '07/09/2022 00:00:00'),(433, 'Confirmed', '07/10/2022 00:00:00')


--Consulting
SELECT * FROM dbo.Texts


-- 2 Second Part: Solving Problem 

SELECT A.user_id FROM dbo.Emails A
INNER JOIN dbo.Texts B 
	ON A.email_id = B.email_id
WHERE A.signup_date = DATEADD(DAY,-1,B.action_date) --OR  B.action_date = DATEADD(DAY,1,A.signup_date)
AND B.signup_action = 'Confirmed'
 








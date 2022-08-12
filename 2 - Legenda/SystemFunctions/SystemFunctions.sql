SELECT GroupName, Name, DepartmentID  
FROM OPENDATASOURCE('MSOLEDBSQL', 'Server=Seattle1;Database=AdventureWorks2016;TrustServerCertificate=Yes;Trusted_Connection=Yes;').HumanResources.Department  
ORDER BY GroupName, Name;



EXEC SeattleSales.master.dbo.xp_msver  

UPDATE OPENQUERY (OracleSvr, 'SELECT name FROM joe.titles WHERE id = 101')   
SET name = 'ADifferentName';


SELECT a.*
FROM OPENROWSET('SQLNCLI', 'Server=DESKTOPA6H79BB;Trusted_Connection=yes;',
     'SELECT TOP 10 GroupName, Name
     FROM AdventureWorks2012.HumanResources.Department') AS a;



SELECT a.*
   FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0',
                   'C:\SAMPLES\Northwind.mdb';
                   'admin';
                   'password',
                   Customers) AS a;

SELECT d.*
FROM OPENROWSET('SQLNCLI', 'Server=Seattle1;Trusted_Connection=yes;',
                            Department) AS d;



SELECT HAS_DBACCESS('AdventureWorks2012') as Acceso;  

Select ORIGINAL_DB_NAME () NombreBD

--Si es miembro 
-- Test membership in db_owner and print appropriate message.  
IF IS_MEMBER ('db_owner') = 1  
   PRINT 'Current user is a member of the db_owner role'  
ELSE IF IS_MEMBER ('db_owner') = 0  
   PRINT 'Current user is NOT a member of the db_owner role'  
ELSE IF IS_MEMBER ('db_owner') IS NULL  
   PRINT 'ERROR: Invalid group / role specified';  
GO  




  
-- Execute SELECT if user is a member of ADVWORKS\Shipping.  
IF IS_MEMBER ('ADVWORKS\Shipping') = 1  
   SELECT 'User ' + USER + ' is a member of ADVWORKS\Shipping.';   
GO


SELECT STUFF('abcdef', 2, 3, 'ijklmn');  
GO


Select LTRIM('  Hola Mundo') as SinEspaciosIniciales

--Nchar
SELECT NCHAR(1998) as NcharField;  

--Patindex
SELECT position = PATINDEX('%er%', 'Quiero ser el mejor');

--Quote
SELECT QUOTENAME('abc[]def') as Quote;

--Repalce
SELECT REPLACE('compadre compro coco', 'co','ma') as FnReplace

--Replicate
SELECT REPLICATE('COCO ', 3) as fnReplicate

--Reverse
SELECT REVERSE('ELCARO') AS bestBD

Select @@IDLE

SELECT @@IDLE * CAST(@@TIMETICKS AS float) AS 'Idle microseconds',  
   GETDATE() AS 'as of'; 
   


SELECT @@IO_BUSY * CAST(@@TIMETICKS AS float) as Tiempoensqlmicroseconds
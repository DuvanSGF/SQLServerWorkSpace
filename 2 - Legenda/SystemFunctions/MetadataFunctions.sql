--File_Id
SELECT FILE_ID('AdventureWorksLT2012_Data')AS 'File ID'

--FileName
SELECT FILE_NAME(1) AS Archivo1, FILE_NAME(2) AS Archivo2;  
GO

-- FileGroupID
SELECT FILEGROUP_ID('PRIMARY') AS [Filegroup ID];  
GO

-- FileGroupName
SELECT FILEGROUP_NAME(1) AS [Filegroup Name];  
GO

--Filegroupproerty
SELECT FILEGROUPPROPERTY('PRIMARY', 'IsDefault') AS 'Default Filegroup';  
GO

--Fileproperty
SELECT FILEPROPERTY('AdventureWorksLT2012_Data', 'IsPrimaryFile')AS [Primary File];  
GO

--Fn
SELECT objtype, objname, name, value  
FROM fn_listextendedproperty(default, default, default, default, default, default, default);  
GO


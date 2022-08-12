-- drop EmployeeDemo_whyid if it already exists
if OBJECT_ID('HumanResources.EmployeeDemo_whyid') is not null
drop table HumanResources.EmployeeDemo_whyid; 
 
-- Select statement for a list of employees with hierarchyid values
select isnull(OrganizationLevel,0) OrganizationLevel   
,
case
   when OrganizationNode is not null then OrganizationNode
   else
hierarchyid::GetRoot()
end emp_OrganizationNode
,
case 
   when OrganizationNode is not null  then OrganizationNode.ToString()
   else  '/'
end NodeString
,FirstName + ' ' + LastName [Name]
,[JobTitle] Title
,'Sex: ' + [Employee].[Gender] [Gender] 
,OrganizationNode.GetAncestor(1) ancestor_OrganizationNode
into HumanResources.EmployeeDemo_whyid
from HumanResources.Employee
inner join Person.Person
on Employee.BusinessEntityID = Person.BusinessEntityID
 
-- list of employees in breadth-first order
-- from HumanResources.EmployeeDemo_whyid
select EmployeeDemo_whyid.*
from HumanResources.EmployeeDemo_whyid
order by OrganizationLevel, NodeString




DECLARE @Manager hierarchyid  

SELECT @Manager = NodeString FROM HumanResources.EmployeeDemo_whyid


SELECT * FROM HumanResources.EmployeeDemo_whyid
WHERE ancestor_OrganizationNode.IsDescendantOf(@Manager) = 1  

SELECT ancestor_OrganizationNode.ToString() AS Text_OrgNode,   
ancestor_OrganizationNode.GetLevel() AS EmpLevel, *  
FROM HumanResources.EmployeeDemo_whyid;



-- drop EmployeeDemo_whyid_wman_names if it already exists
if OBJECT_ID('HumanResources.EmployeeDemo_whyid_wman_names') is not null
drop table HumanResources.EmployeeDemo_whyid_wman_names 
go
 
-- list of employees with manager names
select EmployeeDemo_whyid.*, ancestor_names.ancestor_Name
into HumanResources.EmployeeDemo_whyid_wman_names
from HumanResources.EmployeeDemo_whyid
left join
(
-- distinct non-null ancestor_OrganizationNode with Name
select distinct_ancestor_OrganizationNodes.ancestor_OrganizationNode, Name ancestor_Name
from
(
-- distinct non-null ancestor_OrganizationNode; this set is for manager nodes
-- from HumanResources.EmployeeDemo_whyid
select distinct ancestor_OrganizationNode 
from  HumanResources.EmployeeDemo_whyid 
where ancestor_OrganizationNode is not null
) distinct_ancestor_OrganizationNodes
inner join
(
-- distinct non-null ancestor_OrganizationNode; this set is for employee nodes
-- from HumanResources.EmployeeDemo_whyid
select emp_OrganizationNode, Name
from  HumanResources.EmployeeDemo_whyid 
) OrganizationNode_with_Names
on distinct_ancestor_OrganizationNodes.ancestor_OrganizationNode 
   = OrganizationNode_with_Names.emp_OrganizationNode
) ancestor_names
on EmployeeDemo_whyid.ancestor_OrganizationNode = ancestor_names.ancestor_OrganizationNode
 
-- display a depth-first list of employees with manager names
select * 
from HumanResources.EmployeeDemo_whyid_wman_names 
order by emp_OrganizationNode

select EmployeeDemo_whyid_wman_names.*
from HumanResources.EmployeeDemo_whyid_wman_names
where OrganizationLevel in (0,1)
order by emp_OrganizationNode


--- 
SELECT GroupName, Name, DepartmentID  
FROM OPENDATASOURCE('MSOLEDBSQL', 'Server=Seattle1;Database=AdventureWorks2019;TrustServerCertificate=Yes;Trusted_Connection=Yes;').HumanResources.Department
ORDER BY GroupName, Name;
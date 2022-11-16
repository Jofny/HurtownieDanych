--Zad4
SELECT 
      [OrganizationKey]
      ,[DepartmentGroupKey]
      ,sum([Amount]) as amount
  FROM [dbo].[FactFinance]
  group by cube( [OrganizationKey],[DepartmentGroupKey])
  order by  [OrganizationKey]
--Zad3
SELECT 
      [OrganizationKey]
      ,[DepartmentGroupKey]
      ,sum([Amount]) as amount
  FROM [dbo].[FactFinance]
  group by rollup( [OrganizationKey],[DepartmentGroupKey])
  order by  [OrganizationKey]
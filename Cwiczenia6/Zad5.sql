--Zad5
  with amount_2011 as
 (
 select [OrganizationKey]
		,sum([Amount]) as SumAmount
 from [dbo].[FactFinance]
 where year(date) = 2011
 group by [OrganizationKey]
 )
SELECT 
      a.[OrganizationKey]
	  ,a.SumAmount
	  ,o.OrganizationName
	  ,PERCENT_RANK() over(order by SumAmount) as 'Percent'
  from amount_2011 a
  join [dbo].[DimOrganization] o on a.[OrganizationKey] = o.[OrganizationKey]
  order by a.[OrganizationKey]
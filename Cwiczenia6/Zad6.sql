--Zad6
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
	  ,percent_rank() over(order by SumAmount) as 'Percent'
	  ,stdev(SumAmount) over(order by a.[OrganizationKey]) as Std
  from amount_2011 a
  join [dbo].[DimOrganization] o on a.[OrganizationKey] = o.[OrganizationKey]
  order by a.[OrganizationKey]
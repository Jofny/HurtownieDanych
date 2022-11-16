use AdventureWorksDW2019;

--Zad1
with daily_sales as 
(
SELECT
	[OrderDate] 
	,sum([SalesAmount]) as Sales
  FROM [dbo].[FactInternetSales]
  group by [OrderDate]
)

select
	[OrderDate]
	,Sales
	,avg(Sales) over (order by [OrderDate] rows between 3 preceding and current row ) as Avg_sales
from daily_sales
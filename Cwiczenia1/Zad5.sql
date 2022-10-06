/****** Script for SelectTopNRows command from SSMS  ******/
with cte as(
SELECT od.[order_details_id]
      ,od.[order_id]
      ,od.[pizza_id]
	  ,o.date as order_date
	  ,left(o.time,2) as order_hour
  FROM [cwiczenia1].[dbo].[order_details] as od
  JOIN orders as o on o.order_id = od.order_id
  WHERE o.date LIKE '2015-01-01')

select order_hour, count(*) as amount from cte group by order_hour order by order_hour
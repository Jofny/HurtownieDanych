/****** Script for SelectTopNRows command from SSMS  ******/
with cte as(
SELECT od.[order_details_id]
      ,od.[order_id]
      ,od.[pizza_id]
	  ,o.date as order_date
  FROM [cwiczenia1].[dbo].[order_details] as od
  JOIN orders as o on o.order_id = od.order_id
  WHERE o.date LIKE '2015-02-%')

  select STRING_AGG(order_id, ', '), order_date
  from cte
  WHERE pizza_id NOT LIKE 'hawaiian%'
  group by order_date
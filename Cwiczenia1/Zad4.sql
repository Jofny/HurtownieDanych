/****** Script for SelectTopNRows command from SSMS  ******/
with cte1 as(
SELECT od.[order_details_id]
      ,od.[order_id]
      ,od.[pizza_id]
      ,od.[quantity]
	  ,p.price * od.quantity total_price
	  ,o.date as order_date
	  ,month(o.date) as order_month
  FROM [cwiczenia1].[dbo].[order_details] as od
  JOIN orders as o on o.order_id = od.order_id
  JOIN pizzas as p on p.pizza_id = od.pizza_id),

  cte2 as(
  select avg(total_price) as average_month_total_price, order_month
  from cte1
  group by order_month)



  SELECT cte1.order_id
		,cte1.total_price
		,average_month_total_price
		,cte1.order_date
  FROM cte1 
  JOIN cte2 on cte2.order_month = cte1.order_month
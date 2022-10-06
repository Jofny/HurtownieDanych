/****** Script for SelectTopNRows command from SSMS  ******/
with cte as(
SELECT od.[order_details_id]
      ,od.[order_id]
      ,od.[pizza_id]
      ,od.[quantity]
	  ,p.price * od.quantity total_price
	  ,o.date as order_date
  FROM [cwiczenia1].[dbo].[order_details] as od
  JOIN orders as o on o.order_id = od.order_id
  JOIN pizzas as p on p.pizza_id = od.pizza_id
  WHERE o.date = '2015-02-18')

  select avg(total_price) as average_total_price, order_date
  from cte
  group by order_date
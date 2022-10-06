/****** Script for SelectTopNRows command from SSMS  ******/
with cte as(
SELECT pt.name as pizza_name
	  ,pt.category as category
  FROM [cwiczenia1].[dbo].[order_details] as od
  JOIN orders as o on o.order_id = od.order_id
  JOIN pizzas as p on p.pizza_id = od.pizza_id
  JOIN pizza_types as pt on pt.pizza_type_id = p.pizza_type_id
  WHERE o.date LIKE '2015-01-%')


select pizza_name, category, count(*) as sold from cte group by pizza_name, category order by sold desc
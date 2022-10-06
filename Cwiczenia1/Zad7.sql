with cte as(
SELECT p.size as size
  FROM [cwiczenia1].[dbo].[order_details] as od
  JOIN orders as o on o.order_id = od.order_id
  JOIN pizzas as p on p.pizza_id = od.pizza_id
  WHERE o.date BETWEEN '2015-02-01' AND '2015-03-31')


select size, count(*) as sold from cte group by size order by sold desc
-- Morgan Stippa 2/17/15
-- Lab 5

-- 1. Show the cities of agents booking an order for a	customer whose	id is 'c002'. Use	
--   joins; no	subqueries.	
 select city
 from agents, orders
 where orders.aid = agents.aid
	and cid = 'c002';

-- 2. Show the ids of products ordered through any agent who makes at least one order for 
--    for a customer in Dallas, sorted by pid from higest to lowest. Use joins
select pid
from  orders o, customers c
where c.cid = o.cid
	and c.city = 'Dallas'
order by pid desc;

-- 3. Show the names of customers who have never placed an order. Use	a subquery
select name
from customers
where cid not in (select cid
		  from orders
		  );





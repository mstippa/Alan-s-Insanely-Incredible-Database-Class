-- Morgan Stippa 2/17/15
-- Lab 5

-- 1. Show the cities of agents booking an order for a	customer whose	id is 'c002'. Use	
--   joins; no	subqueries.	
select city
from agents inner join orders on agents.aid = orders.aid
where cid = 'c002';	

-- 2. Show the ids of products ordered through any agent who makes at least one order for 
--    for a customer in Dallas, sorted by pid from higest to lowest. Use joins
select pid
from orders inner join customers on orders.cid = customers.cid
where customers.city = 'Dallas'
order by pid desc;

-- 3. Show the names of customers who have never placed an order. Use	a subquery
select name
from customers
where cid not in (select cid
		  from orders
		  );

-- 4. Show the names of customers who have never placed an order. Use an outer join
select name
from customers full outer join orders on customers.cid = orders.cid
where orders.cid is null;		  

-- 5. Show the	names of customers who	placed	at least one order through an agent in	their	
--    own city,	along with those agent(s') names
select customers.name, agents.name
from customers left outer join agents on customers.city = agents.city
where agents.name is not null;





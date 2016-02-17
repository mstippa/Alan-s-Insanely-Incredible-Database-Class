-- Morgan Stippa 2/17/15
-- Lab 5

-- 1. Show the cities of agents booking an order for a	customer whose	id is 'c002'. Use	
 --   joins; no	subqueries.	
 select city
 from agents, orders
 where orders.aid = agents.aid
	and cid = 'c002';

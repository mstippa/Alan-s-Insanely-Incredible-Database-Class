-- Morgan Stippa 2/10/15
-- Lab 4

-- 1. Gets the cities of agents booking an order for a customer whose cid is 'c002'
select city
from agents
where aid in (select aid
	      from orders
	      where cid = 'c002'
	      );



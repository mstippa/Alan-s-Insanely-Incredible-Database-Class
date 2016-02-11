-- Morgan Stippa 2/10/15
-- Lab 4

-- 1. Gets the cities of agents booking an order for a customer whose cid is 'c002'
select city
from agents
where aid in (select aid
	      from orders
	      where cid = 'c002'
	      );


-- 2. Gets the ids of products ordered	through	any agent who takes at	least one order	from a	
--    customer in Dallas, sorted by pid from highest to lowest.
select pid
from products
where pid in (select pid
	      from orders
	      where cid in (select cid
                            from customers
                            where city = 'Dallas'
                           )); 
			
	










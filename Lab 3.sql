-- Morgan Stippa 2/2/15
-- Lab 3

-- 1. lists the order number and dollars of all orders
select ordnum, totalusd
from orders;

-- 2. Lists the name and city of the agents Smith
select name, city
from agents
where name = 'Smith';

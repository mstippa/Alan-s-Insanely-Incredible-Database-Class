-- Morgan Stippa 2/2/15
-- Lab 3

-- 1. lists the order number and dollars of all orders
select ordnum, totalUSD
from orders;

-- 2. Lists the name and city of the agents Smith
select name, city
from agents
where name = 'Smith';

-- 3. Lists the pid, name, and priceUSD of products with quantity more than 208,000
select pid, name, priceUSD
from products
where (quantity > 208000);

-- 4. Lists the names and cities of customers in Dallas
select name, city
from customers
where city = 'Dallas';






-- Morgan Stippa 2/24/16
-- Lab 6

-- 1. Display the name	and city of customers	who live in an city that makes	the most
--    different kinds of products. (There are two cities that make the most different	
--    products.	Return	the name and city of customers	from either one	of those.)	
select name, city
from customers
where city in (select city
	       from products
	       group by city
	       having count(name) >= 0
	       order by count(name) desc
	       limit 1
	      ); 

-- 2. Display the names of products whose priceUSD is	strictly above	the average priceUSD,	
--    in reverse-alphabetical order
select name
from products
where priceUSD > (select avg(priceUSD)
		  from products
		  ); 

-- 3. Display the customer name, pid ordered, and the	total for all orders, sorted by total	
--    from high	to low.	
select customers.name, products.pid, orders.totalUSD
from orders inner join customers on orders.cid = customers.cid
            inner join products on orders.pid = products.pid
order by totalUSD desc;

-- 4. Display all customer names (in alphabetical order) and their total ordered, and	
--    nothing more. Use coalesce to avoid showing NULLs.
select customers.name, sum(totalUSD)
from orders inner join customers on orders.cid = customers.cid
group by customers.cid
order by customers.name asc;

-- 5. Display the names of all customers who bought products from agents based in Tokyo
--    along with the names of the products they ordered, and	the names of the agents who	
--    sold it to them
select customers.name, products.name, agents.name
from orders inner join customers on orders.cid = customers.cid
	    inner join products on orders.pid = products.pid
	    inner join agents on orders.aid = agents.aid
where agents.city = 'Tokyo'	    

-- 6. Write a query to	check the accuracy of	the dollars column in the Orders table. This	
--    means calculating Orders.totalUSD from data in other tables and	comparing those	
--    values to	the values in Orders.totalUSD.  Display all rows in Orders where	
--    Orders.totalUSD is incorrect, if	any

	    









	      
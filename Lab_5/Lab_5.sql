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










	      
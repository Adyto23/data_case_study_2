use sakila;

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.

select cat.name, (cat.category_id ), count(f.film_id)
FROM sakila.category cat
JOIN sakila.film_category f using(category_id)
group by category_id;

-- Display the total amount rung up by each staff member in August of 2005.

select s.staff_id, s.first_name, s.last_name, sum(p.amount) as totalamount
FROM sakila.staff s 
INNER JOIN sakila.payment as p ON s.staff_id = p.staff_id
WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY s.staff_id;



-- Which actor has appeared in the most films?
select  a.actor_id, a.first_name, a.last_name, count(f.film_id) as TotalMovies
from sakila.actor as a 
INNER JOIN sakila.film_actor as f ON a.actor_id = f.actor_id
group by actor_id 
order by TotalMovies desc LIMIT 1;

-- Most active customer (the customer that has rented the most number of films)

SELECT cust.customer_id, cust.first_name,cust.last_name, count(*) as Total_Rentals
FROM rental as r
INNER JOIN customer AS cust on r.customer_id = cust.customer_id
GROUP BY cust.customer_id
ORDER BY Total_Rentals DESC LIMIT 1;

-- Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address,a.district
FROM sakila.staff as s
JOIN sakila.address as a
ON  s.address_id = a.address_id;

-- List each film and the number of actors who are listed for that film.

SELECT f.title, f.film_id,count(a.actor_id)
FROM sakila.film as f
JOIN sakila.film_actor as a
using(film_id)
group by film_id;

-- Using the tables payment and customer and the JOIN command, 
 -- list the total paid by each customer. 
-- List the customers alphabetically by last name.
SELECT c.customer_id, c.first_name, c.last_name, sum(amount)
FROM sakila.payment as p
JOIN sakila.customer as c
using(customer_id)
group by customer_id;

-- List number of films per category.
select cat.name, (cat.category_id ), count(f.film_id)
FROM sakila.category cat
JOIN sakila.film_category f using(category_id)
group by category_id;

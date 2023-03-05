use sakila;

-- Write a query to display for each store its store ID, city, and country.

SELECT s.store_id, c.city,co.country, address
FROM sakila.store as s
RIGHT JOIN address as a using (address_id)
INNER JOIN sakila.city as c using (city_id)
INNER JOIN sakila.country as co using (country_id)
where s.address_id=a.address_id;


-- Write a query to display how much business, in dollars, each store brought in.

SELECT store_id, sum(amount)
FROM sakila.payment as p
inner JOIN sakila.staff as st using (staff_id)
inner JOIN address as a using (address_id)
INNER JOIN sakila.city as c using (city_id)
INNER JOIN sakila.country as co using (country_id)
group by staff_id, country_id;
-- cant find the right way to narrow down with country 
SELECT address, SUM(amount) as 'total business' 
from payment p 
JOIN(		
	SELECT address, rental_id FROM rental r 
		JOIN( 
		SELECT address, inventory_id FROM inventory i
			JOIN (
				SELECT s.store_id as store_id, a.address FROM store s 
				JOIN address a ON a.address_id = s.address_id) b
				ON i.store_id = b.store_id
				) c ON c.inventory_id = r.inventory_id)
                d ON d.rental_id = p.rental_id GROUP BY address;

-- Which film categories are longest?

select distinct(c.name), max(length)
FROM film as f
INNER JOIN film_category  ON f.film_id=film_category.film_id
INNER JOIN category as c ON c.category_id=film_category.category_id
group by c.name order by max(length) desc limit 6;

-- Display the most frequently rented movies in descending order.

SELECT f.title, COUNT(f.title) as rentals from film f 
JOIN 
	(SELECT r.rental_id, i.film_id FROM rental r 
    JOIN 
    inventory i ON i.inventory_id = r.inventory_id) a
    ON a.film_id = f.film_id GROUP BY f.title ORDER BY rentals DESC limit 10;


-- List the top five genres in gross revenue in descending order.
-- (**Hint**: you may need to use the following tables: 
-- category, film_category, inventory, payment, and rental.)

  select  d.category_id, ca.name, sum(d.revenue) as catrevenue from category ca
join
 (select  c.inventory_id, c.revenue , c.rental_id, c.film_id , fic.category_id from film_category fic
 join
 (select inv.inventory_id, b.revenue , b.rental_id, inv.film_id from inventory inv
 join 
(SELECT r.inventory_id, a.revenue , a.rental_id from rental r 
			JOIN 
				(SELECT p.rental_id, p.amount as revenue FROM payment p) a 
				ON a.rental_id = r.rental_id)  b ON b.inventory_id = inv.inventory_id) c
                ON c.film_id = fic.film_id) d ON d.category_id = ca.category_id group by  d.category_id ORDER BY catrevenue DESC limit 5;


-- Is "Academy Dinosaur" available for rent from Store 1?

select distinct(a.inventory_id), a.title, a.store_id from rental as r 
join
(select distinct(title), store_id, i.inventory_id from film as f 
join inventory as i on  f.film_id=i.film_id
having title='ACADEMY DINOSAUR'and store_id=1) a on r.inventory_id=a.inventory_id;


-- Get all pairs of actors that worked together.

select  c.actor1, c.fn1, c.ln1, c.actor2, c.fn2, c.ln2, fc.film_id from film_actor as fc
join
(select distinct(b.actor_id) as actor1, b.first_name as fn1, b.last_name as ln1, a2.actor_id as actor2, a2.first_name as fn2, a2.last_name as ln2 from actor as a2
join 
(select a1.actor_id, a1.first_name, a1.last_name from actor as a1 )b
having b.actor_id<>a2.actor_id) c where c.actor1=fc.actor_id;

-- Get all pairs of customers that have rented the same film more than 3 times.



-- For each film, list actor that has acted in more films.
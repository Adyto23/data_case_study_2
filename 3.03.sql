use sakila;

-- How many copies of the film Hunchback Impossible exist in the inventory system?

select film_id , title from film as f where title='Hunchback Impossible';

sELECT film_id, COUNT(inventory_id) AS copy
FROM inventory
WHERE film_id IN
   (SELECT film_id
   FROM film
   WHERE title = 'Hunchback Impossible')
GROUP BY film_id;

-- List all films whose length is longer than the average of all the films.

select avg(length) from film;
      
SELECT title, film_id, length
FROM film
WHERE length > (SELECT avg(length) AS average
FROM film);

-- Use subqueries to display all actors who appear in the film Alone Trip.

SELECT first_name, last_name 
FROM sakila.actor
WHERE actor_id IN(select actor_id from film_actor
where film_id = (SELECT film_id
fROM film
WHERE title = 'Alone Trip'));
   

-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT film_id, title
FROM sakila.film
WHERE film_id IN
(select film_id from film_category 
where category_id =
(select category_id from category where name = 'family'));

-- Get name and email from custcustomeromers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
select customer_id, first_name, last_name , email from customer
where address_id in
(select address_id from address
where city_id in (select city_id from city
where country_id=(select country_id from country where country='canada')));


SELECT first_name, last_name, email
FROM country c
JOIN city ci
USING(country_id)
JOIN address
USING(city_id)
JOIN customer
USING(address_id)
WHERE COUNTRY = 'Canada';

-- Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

select distinct(actor_id), count(film_id) from film_actor group by actor_id order by count(film_id) desc limit 1;   

select film_id,title from film as f
where f.film_id in
(select fc.film_id from film_actor as fc where actor_id=(select distinct(actor_id) from film_actor group by actor_id order by count(film_id) desc limit 1));
-- Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments

select film_id, title from film
where film_id in
(select film_id from inventory
where inventory_id in 
(select inventory_id from rental 
where customer_id=
(select distinct(customer_id) from payment group by customer_id order by sum(amount) desc limit 1)));   

-- Customers who spent more than the average payments.

select avg(amount) from payment;


select distinct(customer_id) ,avg(amount) as avarege from payment 
group by customer_id
having avg(amount) > (select avg(amount) from payment); 

SELECT payment.customer_id
    FROM payment
    GROUP BY payment.customer_id
    HAVING AVG(payment.amount) > (
        SELECT AVG(amount)
        FROM payment)


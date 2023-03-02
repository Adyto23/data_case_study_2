use sakila;

##firstquestion

select * from actor where first_name='Scarlett';

select * from  rental;

SELECT COUNT(rental_date IS NULL) AS available, COUNT(return_date - (return_date IS NULL)) AS rented
FROM sakila.rental;

select min(rental_duration) as min_duration, max(rental_duration) as max_duration  from film;

select avg(rental_duration) as avg_duration ,
avg(rental_duration)-avg(rental_duration) % 1  as hours, 
avg(rental_duration) % 1 * '60' as minutes  from film;

select count(DISTINCT last_name) from sakila.actor;

## select DATEDIFF(day, max(rental_date), (DISTINCT last_update) 
##as daysinceopen from rental.sakila, staff;

SELECT * FROM film WHERE title LIKE '%ARMAGEDDON%';

select * from film where title like '%APOLLO';

SELECT * FROM film ORDER BY length DESC;  

SELECT * FROM film WHERE special_features LIKE '%Behind the Scenes%';

##678 are a bit out of my league to understand what the author wanted 




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



select * from actor;

## lab 

##678 are a bit out of my league to understand what the author wanted 

##lab2
##1
SELECT MAX(a.first_name), a.last_name,COUNT(DISTINCT a.last_name)
FROM actor AS a
GROUP BY a.last_name;
##q2
SELECT last_name, COUNT(last_name) AS number_of_times_repeated
FROM actor
GROUP BY last_name
HAVING number_of_times_repeated > 1;
##q3



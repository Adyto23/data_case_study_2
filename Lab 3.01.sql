use sakila;
-- Drop column picture from staff.

select * from staff;

ALTER TABLE staff
DROP COLUMN picture;

select * from staff;

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from staff;

insert into staff (staff_id,first_name,last_name,address_id,email,store_id, staff.active, username,staff.password,last_update)
values
(3, 'CHARLOTTE', 'HUNTER', 134, "CHARLOTTE.HUNTER@sakilacustomer.org",2,1,"CHARLOTTE",null,CURRENT_TIMESTAMP);

select * from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

insert into rental(rental_id,rental_date,inventory_id,customer_id,return_date,staff_id,last_update)
values
(16050,CURRENT_TIMESTAMP,1,130,null,1,CURRENT_TIMESTAMP);



create database bank_demo;

use bank_demo;

drop table if exists district_demo;

create table if not exists district_demo
(
district_id int,
district_name varchar(50), 
region_name varchar(50), 
population int,
average_salary float
);

select * from district_demo; 

insert into district_demo (district_id,district_name,region_name,population,average_salary)
values
(1, 'h1.m', 'praha', 12345, 159);

select * from loan;

insert into loan
value (8000,8000000,930705,96396,12,8033.0,'C');

select * from loan where account_id = 8000000;

DELETE FROM account WHERE account_id=11382;

select * from account WHERE account_id=11382;

use bank_demo;

ALTER TABLE district_demo
ADD location VARCHAR(30);

SET SQL_SAFE_UPDATES=0;

UPDATE district_demo set location =
  CASE
  WHEN district_id > 3 THEN 'north' 
  when district_id > 0 or district_id < 4 then 'south'
  else 'unknown'
  END;
  
select * from district_demo;
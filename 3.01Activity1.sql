use bank;
-- Get the number of clients by district, returning district name.

select b.A1 as disid1, b.A2 as disname from bank.district b
join 
(select distinct(district_id) as disid1, count(client_id) as countid from bank.client group by district_id) a
where b.disid1 = a.disid1;

select * from bank.client
join district
on district_id=A1;

select distinct(district_id) as disid1, count(client_id) from bank.client group by district_id;

-- Are there districts with no clients? 
-- Move all clients from Strakonice to a new district with district_id = 100. 
-- Check again. 
-- Hint: In case you have some doubts, you can check here how to use the update statement.

select distinct(district_id), count(client_id) as cid from client group by district_id having cid=null or cid<"1";

select * from district where a2='Strakonice';

UPDATE bank.client
SET district_id='100'
WHERE district_id=’20’;

select * from district where a2='Strakonice';

select count(a1) from district;

-- How would you spot clients with wrong or missing district_id?

-- Return clients to Strakonice.

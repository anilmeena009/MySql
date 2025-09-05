-- view (vitual table)-->table data store physically.
use sakila;
create view temp as(
select first_name ,count(*) from actor where actor_id>10
group by first_name order by count(*) desc);


select * from temp;
select * from actor;
create view temp2 as(select first_name,last_name from actor);
select * from temp2;
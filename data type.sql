use regex1;
-- data types-->int (4 byte) 2**32
create table yash1(id int);
insert into yash1 value(-10);
select * from yash1;

create table yash2(id int unsigned);
insert into yash2 value(10);
select * from yash2;

-- tiny int (1 byte)
-- small int (2 byte ) mediumbyte(3 byte)
-- big int(2**64)
-- create table yash3(id bigirt unsigned );
-- insert into yash3 value(10);
-- select * from yash3;
drop table yash1;
create table yash1(id char(10));
insert into yash1 value('abc');
insert into yash1 value('abc     ');  -- char ,last white space truncate
insert into yash1 value('ab   c');
select name,char_length(name) from yash1;

drop table yash1;
create table yash1(id varchar(10));
insert into yash1 value('abc');
insert into yash1 value('abc          '); -- trucate upto the size of columns
select * from yash1;

drop table yash1;
create table yash1(dob date );
insert into yash1 value(curdate());
insert into yash1 value (2026-02-30);
insert into yash1 value (2022-01-15);
insert into yash1 value(now());
select * from yash1;

drop table yash1;
create table yash1(dob timestamp );
insert into yash1 value(now());
select * from yash1;

drop table yash1;
create table yash1(dob time,dob1 date ); -- datetime  use 8byte
insert into yash1 value(now(),now());
select * from yash1;

drop table yash1;
create table yash1(dob timestamp );  -- timestamp typcally use 4byte
insert into yash1 value(now());
select * from yash1;

drop table yash1;
create table yash1(salary float );
insert into yash1 value(10.2),(10.545645);
select * from yash1;

drop table yash1;
create table yash1(salary double );
insert into yash1 value(10.2),(10.545645);
select * from yash1;

drop table yash1;
create table yash1(salary double(5,2) );
insert into yash1 value(10.2),(10.545645);
insert into yash1 value(10.2),(102.54);
insert into yash1 value (1541.0215); -- error here
insert into yash1 value(152.5452);
insert into yash1 value (15.24455);
select * from yash1;
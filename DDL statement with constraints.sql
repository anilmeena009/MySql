-- DDL statement with constraints
-- constraint-> Rule apply to table-->acurate-->Invalid restrict

-- not null cinstraint
use regex1;
create table test1(id int,salary int not null);
insert into test1 value(10,900);

insert into test1 value(11,null);  -- error here
insert into test1 value(null,1800);  -- null is insert here bcz constraint is applied on salary.
select * from test1;

-- default
use regex1;
create table test2(id int default 0,salary int not null);
insert into test2 value(10,900);
 
insert into test2 (salary) value(1800); 

select * from test2;


-- unique
use regex1;
create table test3(id int ,salary int default 100 unique);
insert into test3 value(10,900);
 insert into test3 value(11,900); -- error here
insert into test3 (id) value(1999991); 
insert into test3 (id) value(20012); -- error here

select * from test3;

-- Primary ->Each tables are stored a primary key 
create table test4(id int primary key,salary int );
insert into test4 value(10,900);
insert into test4 value(10,1000); -- error here
 insert into test4(id) value(null);


-- f.key
-- drop table course1;
create table course1(course_id int primary key,cnmae varchar(20));
insert into course1 value(10,'DSA'),(11,'Python');
-- drop table studentinfo;
create table studentinfo(sid int primary key,sname varchar(20),
course_id int,foreign key (course_id) references course1(course_id));
insert into studentinfo value(1,'tushar',10);
insert into studentinfo value(2,'aman',11);
insert into studentinfo value(3,'anil',13); -- erro here 

drop table test5;
create table test5 (tid int ,t2id int, t1name varchar(20),t2name varchar(20),primary key(tid,t2id));
insert into test5(tid,t2id,t1name,t2name)
value(20,30,'python','dsa'),(1,2,'');





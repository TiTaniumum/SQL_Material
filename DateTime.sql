create database if not exists myDB;
use myDB;

drop table if exists test;
create table test(
 my_date date,
 my_time time,
 my_datetime datetime
);

insert into test values
(current_date(), current_time(), now());
select* from test;

insert into test values
(current_date()+1, current_time()+1, now()+1);
select*from test;

insert into test value
(null, current_time()+1, now());
select * from test;

drop table test;
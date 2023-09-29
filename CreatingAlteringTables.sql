DROP DATABASE IF EXISTS myDB;
CREATE DATABASE myDB;
USE myDB;

alter database myDB read only = 1; 
alter database myDB read only = 0; 

drop table if exists employees;
create table employees(
	employee_id int,
    first_name varchar(50), 
    second_name varchar(50),
    hourly_pay decimal(5,2),
    hire_date date
);
rename table employees to workers;
rename table workers to employees;

alter table employees rename column second_name to last_name;
alter table employees add phone_number varchar(15);
alter table employees rename column phone_number to email;
alter table employees modify column email varchar(100);
alter table employees modify email varchar(100) after last_name;
alter table employees modify email varchar(100) first;
alter table employees modify email varchar(100) after hire_date;
alter table employees drop column email;
select * from employees;
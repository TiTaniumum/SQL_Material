create database if not exists myDB;
use myDB;

drop table if exists products;
create table if not exists products(
	product_id int,
    product_name varchar(25) unique,
    price decimal(4,2) 
);
select* from products;

alter table products add constraint unique(product_name);

insert into products values
(1,"soda",5),
(2,"milk",10),
(3,"fried chicken", 20),
(4,"ice cream", 4),
(5,"mead", 13);
select* from products;

alter table products modify price decimal(4,2) not null;

-- insert into products values (6,"cookie",null);  -- not acceptable since price cannot be null
insert into products values (6,"cookie",0);

create table if not exists employees(
	employee_id int,
    first_name varchar(50),
    last_name varchar(50),
    hourly_pay decimal(5,2),
    hire_date date,
    constraint chk_hourly_pay check(hourly_pay >= 10.00)
);

alter table employees 
add constraint chk_hourly_pay check(hourly_pay >= 10.00);
select * from employees;

-- it won't work becouse 9 is under 10.00 and check is violated
-- insert into employees values (8,"Sheldon", "Plankton",9,current_date());

insert into employees values (8,"Sheldon", "Plankton",10,current_date());
delete from employees where employee_id = 8 limit 1;

alter table employees drop constraint chk_hourly_pay;
insert into employees values (8,"Sheldon", "Plankton",9,current_date());
select*from employees;
-- it will not work becouse table contains rows with hourly pay under 10.00
alter table employees add constraint chk_hourly_pay check(hourly_pay>=10.00);

-- so we shoul either delete or update data that's violating the check
update employees set 
hourly_pay = 10.00
where hourly_pay <10.00;

delete from employees where hourly_pay < 10.00;
alter table employees add constraint chk_hourly_pay check(hourly_pay>=10.00);

select*from employees;
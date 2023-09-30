-- pagination
select* from employees
limit 3;

select* from employees 
order by last_name desc limit 1;

select* from employees
order by employee_id limit 2,3;

create table income(
income_name varchar(25),
amount decimal(9,2)
);

insert into income values
('orders', 1000000.00),
('merchandise', 50000.00),
('services', 125000.00);

select * from income;

create table expences(
expence_name varchar(25),
amount decimal(9,2)
);

insert into expences values
('wages', -250000.00),
('tax', -50000.00),
('repairs', -15000.00);

select * from expences;

-- union operator 

select * from income
union 
select * from expences;

select sum(amount) as sum from income
union 
select sum(amount) from expences;

-- -----------------------

select * from employees;
select * from customers;


-- union should have the same amount of columns
select first_name, last_name from employees
union -- union by it's self doesn't allow duplicates
select first_name, last_name from customers;

insert into customers(first_name, last_name) values
('Sheldon','Plankton');

select first_name, last_name from employees
union all -- shows duplicates
select first_name, last_name from customers;
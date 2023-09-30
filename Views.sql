-- views

select * from employees;

create view employee_attendance as 
select first_name, last_name 
from employees;

select * from employee_attendance;

select * from employee_attendance 
order by first_name;

select * from customers;

alter table customers add column email varchar(50);

update customers 
set email = "jKukich@gmail.com"
where customer_id = 1;

update customers 
set email = 'FKaleb@gmail.com'
where customer_id = 2;

update customers
set email= "MLourance@gmail.com"
where customer_id = 3;

update customers
set email = 'HNorris@gmail.com'
where customer_id = 4;

update customers
set email = 'MSmith@gmail.com'
where customer_id = 5;

create view customer_emails as 
select email from customers;

alter view customer_emails as select email from customers where email is not null;

select * from customer_emails;

insert into customers(first_name, last_name, email) values
('Kukich','Umir','kUmir@gmail.com');
select * from customers;

select * from customer_emails;

create view income_expences as 
select sum(amount) from income
union
select sum(amount) from expences;

select * from income_expences;

alter view income_expences as 
select sum(amount) as 'sum of income and expences' from income
union 
select sum(amount) from expences;

select * from income_expences;
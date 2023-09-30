use myDB;

alter table customers
add referral_id int;
select* from customers;

update customers
set referral_id = 2 
where customer_id = 4;

select* from customers as a 
inner join customers as b
on a.referral_id = b.customer_id;

select a.customer_id, a.first_name,a.last_name, b.first_name, b.last_name from customers as a 
inner join customers as b
on a.customer_id = b.referral_id;

select a.customer_id, concat(a.first_name,' ', a.last_name) as full_name,
					  concat(b.first_name,' ', b.last_name) as "referred by" 
from customers as a 
left join customers as b
on a.customer_id = b.referral_id;


select * from employees;
alter table employees add superviser_id int;

alter table employees rename column superviser_id to supervisor_id;

update employees
set supervisor_id = 5
where employee_id = 2;

update employees
set supervisor_id = 5
where employee_id = 3;

update employees
set supervisor_id = 5
where employee_id = 4;

update employees
set supervisor_id = 5
where employee_id = 6;

update employees
set supervisor_id = 1
where employee_id = 5;

select a.first_name, a.last_name, concat(b.first_name, ' ', b.last_name) as 'reports to' from employees as a
inner join employees as b 
on a.supervisor_id = b.employee_id;
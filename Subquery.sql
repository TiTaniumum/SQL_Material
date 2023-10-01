select concat(a.first_name, ' ', a.last_name) as supervisor, concat(b.first_name, ' ', b.last_name) as employee from employees as a 
inner join employees as b
on a.employee_id = b.supervisor_id;

select * from employees;

select first_name, last_name, hourly_pay, (select avg(hourly_pay) from employees) as average_pay from employees;

select first_name, last_name from customers
where customer_id not in (select distinct customer_id from transactions where customer_id is not null);
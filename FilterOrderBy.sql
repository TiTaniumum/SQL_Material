select*from employees;

select* from employees
where first_name like 'g%';

select*from employees
where hire_date like '2023%';

select * from employees
where last_name like '%a';

select * from employees
where first_name like '%a';

select * from employees
where job like '_ook';

select* from employees
where hire_date like '__23-__-__';

select* from employees
where job like '_a%';

select * from employees
order by last_name;

select * from employees
order by last_name desc; 

select * from employees
order by last_name asc;

select * from employees
order by hire_date;

select* from transactions
order by amount, customer_id;

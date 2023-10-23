-- 1.Create schema
-- 2.triggers
-- 3.insert into
-- 4.restore database

use myDB;
go

-- 1)

CREATE SCHEMA Shop
Create table test_table(id int primary key identity(1,1), some_number int, some_string varchar(50))
go

select SCHEMA_NAME();
go
select * from test_table;
go
select * from Shop.test_table;
go
drop table Shop.test_table;
go
drop schema Shop;
go

select * from sys.schemas;
go

-- 2)

--DML - INSERT UPDATE DELETE
--DDL - CREATE ALTER DROP LOGON


create trigger test_trigger
on employees
for insert,update
as raiserror('trigger!', 0 , 1)
   return;
go

select* from employees;
go
insert into Employees(first_name, last_name, hourly_pay, job, hire_date, supervisor_id) values
 ('Nicolay', 'Artemov', 30.00, 'CEO', '2022-01-01' , null);
 go

drop trigger test_trigger;

delete from employees
where id in(8,9);

create trigger select_after_insert_update
on employees
for insert
as select * from employees;
go

drop trigger  select_after_insert_update;
go

set IDENTITY_INSERT employees on;
go
insert into employees(id, first_name) values
(7, 'Karl');
go
set IDENTITY_INSERT employees off;
go
delete from employees 
where id in(7,10);
go

create trigger select_inserted_values
on employees
after insert
as select * from inserted;
go 

create trigger ID_Correction
on employees
after insert
as 
begin
	delete from employees where id in (select id from inserted);
	set identity_insert employees on;
	declare @last_id int;
	select @last_id = max(id) from employees;
	insert into employees(id, first_name, last_name, hourly_pay, salary, job, hire_date, supervisor_id)
	select row_number() over(order by id) + @last_id, first_name, last_name, hourly_pay, salary, job, hire_date,supervisor_id
	from inserted 
	set identity_insert employees off;
end
go

select * from employees;
go

delete from employees
where id in (7,8);
go

insert into Employees(first_name, last_name, hourly_pay, job, hire_date, supervisor_id) values
 ('Nicolay', 'Artemov', 30.00, 'CEO', '2022-01-01' , null);
 go

insert into Employees(first_name, last_name, hourly_pay, job, hire_date, supervisor_id) values
 ('Vladimer', 'Putin', 0.0, 'Govnuk', '2000-01-01' , null);
go

create procedure test_procedure
as select * from employees;
go

exec test_procedure;
go
drop procedure test_procedure;
go

disable trigger ID_Correction 
on employees;

enable trigger ID_Correction
on employees;
go

create trigger save_deleted
on employees
for delete
as begin
	drop table if exists employees_deleted;
	select * into employees_deleted
	from DELETED
end
go

drop trigger save_deleted;
go

select * from employees;
go
delete from employees
where id = 6;
go

select * from employees_deleted;

select first_name, last_name, hourly_pay, job, hire_date, supervisor_id into employees from employees_deleted;

insert into employees(first_name,last_name, hourly_pay, salary, job, hire_date, supervisor_id) 
select first_name, last_name,hourly_pay,salary,job,hire_date,supervisor_id from employees_deleted;

select * from employees;

-- when making new table using 'select into' clause there should be names of columns if funcitons are used
select concat(first_name, ' ' , last_name) as full_name into full_names_customers from customers;
go

select concat(first_name,' ', last_name) from customers;
go

select * from full_names_customers;
go

drop table full_names_customers;
go

-- 4)


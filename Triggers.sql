-- triggers

use myDB;
go

drop table if exists employees;
go

create table employees(
	id int primary key identity(1,1) not null,
	first_name varchar(50),
	last_name varchar(50),
	hourly_pay decimal(5,2),
	salary decimal(10,2),
	job varchar(25),
	hire_date date,
	supervisor_id int 
	constraint fk_supervisor_id foreign key(supervisor_id) references employees(id)
);
go

insert into employees(first_name, last_name, hourly_pay, job, hire_date, supervisor_id) values
('Eugene', 'Krabs', 25.50, 'manager', '2023-01-02', null),
('Squdward','Tetacles', 15.00, 'cashier', '2023-01-03', 5),
('Spongebob','Squarepants',12.50,'cook','2023-01-04',5),
('Patrick', 'Star', 12.50, 'cook','2023-01-05',5),
('Sandy','Cheeks', 17.25, 'asst. manager', '2023-01-06',1),
('Sheldon','Plankton', 10.00, 'janitor','2023-01-07',5);
go


update employees
set salary = hourly_pay *2080;
go

select* from employees;
go
--MySQL syntax:
--Create trigger before_hourly_pay_update
--before update on employees
--for each row 
--set new.salary = (new.hourly_pay *2080);

-- show triggers;
drop trigger if exists after_hourly_pay_update;
go
create trigger after_hourly_pay_update
on employees
after insert, update
as
	update employees
	set salary = hourly_pay *2080
	where id in (select id from inserted);
go

update employees
set hourly_pay = 50.00
where id = 1;
go

select* from employees;
go

update employees
set hourly_pay = hourly_pay+1
where id != 1;
go
select * from employees;
go

update employees
set hourly_pay = hourly_pay-1
where id!= 1;
go
select* from employees;
go

-- TO DO: continue tomorrow
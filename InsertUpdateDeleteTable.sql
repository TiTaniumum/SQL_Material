-- if this database does not exist it will be created
create database if not exists myDB;
use myDB;
-- if employees table does not exist it will be created
create table if not exists employees(
	eployee_id int,
    first_name varchar(50),
    last_name varchar(50),
    hourly_pay decimal(5,2),
    hire_date date
);

-- inserting values into table
insert into employees values
 (1, "Bob","Grills",20.50,"2023-01-02"),
 (2, "Mitch", "Bonat", 30, "2022-11-20"),
 (3, "Gara", "Bura", 21.24, "2023-02-24"),
 (4, "Crous", "Grimp", 11.1, "2019-03-15");
 -- insering values with missing columns 
 insert into employees (employee_id, first_name, last_name) values
 (5,"Misha","Karpov");
 
 -- query data from table
 
 select * from employees;
 select first_name, last_name from employees;
 select * from employees where employee_id = 2;
 select first_name from employees where first_name = "Gara";
 select * from employees where hourly_pay >= 20;
 select * from employees where hire_date <= "2023-01-01";
 select * from employees where employee_id != 1;
 
 insert into employees (employee_id, first_name, last_name) values
 (6, "Karl","Mourse"),
 (7, "Grisha","Lourence");
 
 select * from employees where hire_date is null;
 select * from employees where hourly_pay is null;
 select * from employees where hire_date is not null;
 
 set sql_safe_updates = 0; -- allaws to update data in tables 
 
 update employees set
 hourly_pay = 10.1,
 hire_date = "2018-10-28" 
 where employee_id = 5
 limit 1000; -- if sql_safe_updates is true, limit should be written
 
 update employees set
 hire_date = null
 where hire_date = "2023-01-02";
 
 update employees set 
 hire_date = "2023-01-02"
 where first_name = "Bob";
 
 delete from employees 
 where employee_id = 1;
 
 set autocommit = off;
 commit;
 select* from employees;
 delete from employees;
 rollback;
 select*from employees;
 set AUTOCOMMIT = ON;
 
 
 set autocommit = off;
 delete from employees where employee_id = 2 limit 1;
 delete from employees where employee_id = 3 limit 1;
 delete from employees where employee_id = 4 limit 1;
 insert into employees values (1, "Bob","Grills",20.50,"2023-01-02");
 select*from employees;
 select*from employees order by employee_id;
 commit;
 set autocommit = on;
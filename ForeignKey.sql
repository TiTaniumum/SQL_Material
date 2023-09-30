use myDB;

create table customers(
	costomer_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50)
);

select* from customers;

insert into customers(first_name,last_name) values
('Jakob','Kukich'),('Forbs','Kaleb'),('Muray','Lourance');

-- adding new column 
alter table transactions
add customer_id int;
select * from transactions;
-- did this 4 times to fill the column
update transactions
set customer_id = 3
where transaction_id = 4;

-- deleted transaction with faulty id
delete from transactions where transaction_id = 1000;

-- switched auto increment from 1000 to 5
alter table transactions auto_increment = 5;

-- checked if next id will be 5 or 6. turns out 5
insert into transactions(amount, customer_id) values
(1.00, 2);

-- faulty name 
alter table customers 
rename column costomer_id to customer_id;

-- turns out you can't add a fk unless column contains id's that doesn't exist in the primary key table
insert into customers(first_name, last_name) values
('Hrogar','Norris'),
('Mitch', 'Smith');

-- added foreign key 
alter table transactions 
add constraint fk_customer_id 
foreign key(customer_id) references customers(customer_id);

select * from customers;
select * from transactions;

-- droping foreign key for the sake of repeating
alter table transactions 
drop foreign key fk_customer_id;

-- remaking transactions with foreign key
drop table transactions;

create table transactions(
	transaction_id int primary key auto_increment,
    amount decimal(5,2),
    customer_id int,
    constraint fk_customer_id
    foreign key(customer_id) references customers(customer_id)
);
alter table transactions auto_increment = 1;
delete from transactions;
insert into transactions(amount, customer_id) values
(13, 1),
(1.24, 3),
(2.43, 2),
(3.53,4),
(3.53,5);
select * from transactions;

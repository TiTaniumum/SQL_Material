create database if not exists myDB;
use myDB;

create table if not exists products(
	product_id int,
    product_name varchar(25),
    product_price decimal(4,2) not null
);

insert into products values
(7,"straw", 0.00),
(8,"napkin", 0.00),
(9,"plastick fork", 0.00),
(10,"plastick spoon", 0.00);

select * from products;
delete from products where product_id >= 7;

create table if not exists products(
	product_id int,
    product_name varchar(25),
    product_price decimal(4,2) not null default 0
);

alter table products
alter price set default 0;
select* from products;

insert into products(product_id, product_name) values
(7,"straw"),
(8,"napkin"),
(9,"plastick fork"),
(10,"plastick spoon");

create table transactions(
	transation_id int,
    amount decimal(5,2),
    transaction_date datetime default now()
);
select* from transactions;

alter table transactions 
rename column transation_id to transaction_id;

insert into transactions(transaction_id, amount) values
(1, 4.99),
(2, 3.39);

select* from transactions;
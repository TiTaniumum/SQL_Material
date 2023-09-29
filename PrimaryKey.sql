-- Primary key;

create database if not exists myDB;
use myDB;

drop table if exists transactions;
create table transactions(
	transaction_id int primary key,
    amount decimal(5,2)
);
select * from transactions;

alter table transactions
add constraint primary_key_transaction_id primary key(transaction_id);
-- no more primary key can be defined
-- add constraint primary_key_transaction_id primary key(amount);

insert into transactions(transaction_id, amount) values
(3,4.46),
(4,5.30);

/*
insert into transactions(transaction_id, amount) values
(null, 10), -- cannot be null
(4, 10); -- cannot have the same id
*/

select amount from transactions where transaction_id = 2;
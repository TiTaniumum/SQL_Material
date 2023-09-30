select * from transactions;

set AUTOCOMMIT = off;
commit;
drop table if exists transactions;
create table transactions(
	transaction_id int primary key auto_increment,
    amount decimal(5,2)
);
select * from transactions;
insert into transactions(amount) values
(5.89);
alter table transactions auto_increment = 1000;
rollback;
set autocommit  = on;
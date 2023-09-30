use myDB;
insert into transactions(amount, customer_id) values
(1, 1),
(2.3,4);

insert into transactions(amount, customer_id) values
(12.3,null),
(2.4,null),
(4.54, null);
select * from transactions;

select * from transactions inner join customers
on transactions.transaction_id = customers.customer_id;

select transaction_id, amount, first_name, last_name 
from transactions inner join customers
on transactions.customer_id = customers.customer_id;

select transaction_id, amount, first_name, last_name 
from transactions left join customers
on transactions.customer_id = customers.customer_id;

select transaction_id, amount, first_name, last_name
from transactions right join customers
on customers.customer_id = transactions.transaction_id;
--RollUp

use myDb;
go

select count(id) as amount_of_orders, customer_id from transactions
group by customer_id with rollup;
go
--on delete set null

select* from transactions;
select* from customers;
go

alter table transactions drop constraint fk_customer_id;
go

alter table transactions add constraint fk_customer_id
foreign key(customer_id) references customers(id)
on delete set null;
go

--on delete cascade

alter table transactions drop constraint fk_customer_id;
go

alter table transactions
add constraint fk_customer_id
foreign key(customer_id) 
references customers(id)
on delete cascade;
go
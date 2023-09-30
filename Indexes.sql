show indexes from customers;
create index idx_last_name on customers(last_name);

select * from customers 
where last_name like "k%";

create index idx_last_name_first_name on customers(last_name, first_name);

alter table customers drop index idx_last_name;
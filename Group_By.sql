use myDB;
go 

create index last_name_idx on customers(last_name);
go

--MySQL syntax
--alter table customers drop index last_name_idx;
--go

--ms SQL Syntax
drop index customers.last_name_idx;
go

select * from sys.indexes
where name like 'last_name%';
go

create index last_name_first_name_idx on customers(last_name, first_name);
go;

select sum(amount) as amount_sum from transactions;
go

select sum(amount) as amount_sum, order_date from transactions
group by order_date;
go

select max(amount) as amount_max, order_date from transactions
group by order_date;
go

select min(amount) as amount_min, order_date from transactions
group by order_date;
go

select avg(amount) as amount_avg, order_date from transactions
group by order_date;
go

select count(amount) as amount_count, order_date from transactions
group by order_date;
go

select count(order_date) as order_date_count, order_date from transactions
group by order_date;
go

--This works too
select count(order_date) as order_date_count from transactions
group by order_date;
go

select sum(amount) as amount_sum_by_customer, customer_id from transactions
group by customer_id;
go 

select max(amount) as amount_max_per_customer,  customer_id from transactions
group by customer_id;
go

select min(amount) as amount_min_per_customer, customer_id from transactions
group by customer_id;
go

select avg(amount) as amount_avg, customer_id from transactions
group by customer_id;
go

select count(amount) as amount_avg, customer_id from transactions
group by customer_id;
go


-- instead of using 'WHERE' you should use 'HAVING'
-- so this won't work:
select count(amount) as amount_count, customer_id from transactions
group by customer_id 
where count(amount) < 4;
go

-- and this will work:
select count(amount)as amount_count, customer_id from transactions
group by customer_id
having count(amount) < 4 and customer_id is not null;
go

select approx_count_distinct(amount), order_date from transactions
group by order_date;
go


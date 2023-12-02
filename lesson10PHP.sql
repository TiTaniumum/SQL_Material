use SHOP;

create view count_proucts as select count(*) from product;
rename table count_proucts to count_products;
select * from count_products;

select * from product;

create view count_in_categories as 
select count(*), category_id from product
group by category_id;

select * from count_in_categories;

create view average_cost as 
select avg(price) from product;

select* from average_cost;

create view most_expensive as
select * from product
order by price desc limit 1;

select * from most_expensive;

create view most_count_product_in_category as
select c.name, count(*) from product p 
join category c 
on p.category_id = c.id 
group by category_id desc limit 1;

select * from most_count_product_in_category;

create view category_most_expensive as
select c.name, max(price) as price from product as p
join category as c
on p.category_id = c.id
group by category_id
order by price desc limit 1;

select * from category_most_expensive;

create view difference_max_min as
select max-min from (select min(price) as min from product) as minTable,
(select max(price) as max from  product) as maxTable;

select * from difference_max_min;

create view total_sum_price as
select sum(price) from product;

select * from total_sum_price;

select* from product;

create table product_change_history(
id int primary key auto_increment not null,
old_name varchar(32), old_price int, old_category_id int,
new_name varchar(32), new_price int, new_category_id int
);

alter table product_change_history add column date datetime	default now();

create trigger product_update_trigger before update on product
for each row 
insert into product_change_history(old_name, old_price, old_category_id, new_name, new_price, new_category_id) values
(old.name, old.price,old.category_id, new.name, new.price, new.category_id);

update product
set price = 2050
where id = 1;

select * from product_change_history;

create table product_insertion_history(
id int primary key auto_increment not null,
action varchar(10) default "added",
item_id int,
date datetime default now()
);

-- drop trigger product_insertion_trigger;
create trigger product_insertion_trigger after insert on product
for each row 
insert into product_insertion_history(item_id) values (new.id);

delete from product where name like "sorpa";

select * from product;
insert into product(name, price,category_id) values
("sorpa", 5, 5);

select * from product_insertion_history;


delimiter //
create function average_price() returns float
begin 
	declare average float;
    SELECT avg(price) from product into average;
	return average;
end//
delimiter ;

select average_price();
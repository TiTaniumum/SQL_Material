create database Shop;
use Shop;


create table Product (
	id int not null primary key auto_increment,
    name varchar(32),
    price int
);

insert into Product(name, price) values
("milk", 2000),
("chocolate", 40),
("Chees",500),
("Grizly",560),
("Makarons",340),
("Nuggets", 250),
("Souce Sichuan", 40000),
("Ketchup", 23),
("Mayo", 10),
("Picoly", 100);

select * from product;

select * from product where price < 1000;

select * from product where price between 500 and 2000;

select * from product where name like "a%";

select * from product order by price asc;

update product 
set price = 1500
where id = 8;

create table category (
	id int not null primary key auto_increment,
    name varchar(32)
);

insert into category(name) values ("milk_product"),
("candy"),
("souce"),
("food");

select * from category;

select* from category order by name asc;

select * from category order by id desc;

alter table product add column category_id int;
alter table product add constraint fk_category_id foreign key(category_id) references category(id);

update product 
set category_id = 1
where name in ("milk", "Chees");

update product 
set category_id = 2
where name = "chocolate";

update product
set category_id = 3
where name in ("Souce Sichuan","Ketchup","Mayo");

update product
set category_id = 4 
where category_id is null;

select * from product join 
category on category_id = category.id;
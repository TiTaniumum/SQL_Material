insert into category(name) values 
("drinks"),
("meat"),
("other");

insert into category(name) values
("cars"),
("swords");

select * from category;

insert into product(name, price, category_id)values 
("coca-cola", 400, 5),
("Fanta", 350, 5),
("Sprite", 450, 5),
("Kvas", 405, 5),
("water", 150, 5),
("Gorilla", 500,5),
("Nuca-Cola", 1000, 5),
("Horse", 1500, 6),
("Beef", 1400, 6),
("Chicken", 1050, 6),
("shvabra", 300, 7),
("Metelka", 400, 7),
("keglya", 5, 7),
("Kyonegseg", 2000000, 8),
("Lambargini", 5000000, 8),
("Dodge Challanger", 999999, 8),
("Mustang", 6666666, 8),
("Long Sword", 5000, 9),
("Falshion", 35000,9),
("Sablya", 4500, 9),
("Rapira", 10000, 9);

use shop;
select * from product;
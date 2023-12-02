create database gameshop;
use gameshop;

create table games(
id int primary key auto_increment not null,
name varchar(50) not null,
description text,
price int not null default 0,
publish_date datetime default now()
);

insert into games(name, description, price, publish_date) values
("Avatar", "Ultra mega Planet with blue mans", 29457, '1997-12-18'),
("Mario", "Classic game! Must play!", 43859, '2004-05-09'),
("Mecha fight", "Mechas will fight with you!", 53984, '1985-09-30'),
("Ultra pascal", "this game is for programmers", 39853, '2018-07-16'),
("Kazakh Berkutchi", "Berkutchi will show you how to controll eagle", 87485, '1981-05-28'),
("Darksiders","4 machines of apocalipsise",9843, '1999-08-26'),
("Dragon age","You want to live in fantasay warld? buy it.",85983, '1989-03-05'),
("Lord of the rings","GITGOOD BRUH",3895, '1987-09-28'),
("Danger ahead","be ware of your futer",8357, '2015-04-27'),
("Pasyans","you already have it installed",32785, '1971-11-15'),
("Kazaki","be war leader your self!",83827, '1979-07-27'),
("War Craft Reforged","They remastered the good old game so you could have nastalgia",23685, '1973-04-27'),
("Skyrim","Well no comments. Absolute legend.",34985, '2022-11-19'),
("Deep Rock Galactic","ROCK AND STONE MINER",100, '2021-07-01'),
("Fallout 4","Play it first time and You'd want to replay with mods.",28937, '1980-06-29');

create table game_janras(
id int primary key auto_increment not null,
name varchar(32) not null
);

insert into game_janras(name) values
("Action"), -- 1
("Strategic"), -- 2
("Horror"), -- 3
("Fantasy"), -- 4
("Hardcore"), -- 5
("Platformer"), -- 6
("2D"), -- 7
("FPS"),-- 8
("Survival"), -- 9
("Mecha"), -- 10
("Puzzle"), -- 11
("Slasher"), -- 12
("Historical"), -- 13
("Cards"), -- 14
("Casino"), -- 15
("RPG"); -- 16

create table game_janra_relations(
id int primary key auto_increment not null,
id_game int not null,
id_janra int not null,
constraint fk_id_game foreign key(id_game) references games(id),
constraint fk_id_janra foreign key(id_janra) references game_janras(id)
);

insert into game_janra_relations(id_game, id_janra) values
(1,1),
(1,2),
(2,6),
(2,7),
(3,10),
(3,1),
(3,8),
(4,11),
(5, 13),
(6,4),
(6,12),
(6,1),
(7,4),
(7,1),
(7,2),
(7,12),
(8,1),
(8,4),
(8,12),
(8,16),
(7,16),
(9,8),
(9,1),
(10,11),
(11, 13),
(11,2),
(12,2),
(12,16),
(12,4),
(13,1),
(13,3),
(13,4),
(13,5),
(13,9),
(13,12),
(13,16),
(14,1),
(14,3),
(14,6),
(14,8),
(14,9),
(15,1),
(15,8),
(15,9);

create table customers(
id int primary key auto_increment not null,
firstname varchar(32) not null,
lastname varchar(32) not null,
birthdate datetime,
address varchar(32),
phonenumber varchar(13),
email varchar(32)
);

insert into customers(firstname, lastname, birthdate, address,phonenumber, email) values 
("Grisha","Yakubovich","1961-04-05","Tarasa 4 kv1",null,"ktoya@mail.ru"),
("Alan","Petrikov","1982-09-08",null,"77777777777","Simon@gmail.com"),
("Mitch","Niculin","1990-05-18",null,null,"naker@gmail.com"),
("Patric","Star","1973-12-07","Kirova 10 kv50","77754503842","liveunderrock@gmail.com"),
("Ivan","Karelin","1962-09-01","Moscovskaya 32 kv3",null,"Grozniy@mail.ru"),
("Keanu","Reeves","1985-10-15","Zheltocksan 9 kv300","76507342124","NiceGuy@gmail.com"),
("Maxim","Galcin","1955-10-06",null,"77023590001","NuricTiGde@mail.ru"),
("Nurlan","Gamash","1995-08-29","Respublica 1 kv1",null,"NuricTiGde@mail.ru"),
("Nicole","Sanders","2000-08-10","Abaya 12 kv24","77772342323","Nicolas@gmail.com"),
("Sara","Bakrush","1956-11-08",null,"77757757575","Buka@gmail.com"),
("Lubov","Vacheslavna","1969-09-07","dist 123 kv42",null,"Ludi@mail.ru"),
("Torik","Zigmundson","1992-09-06","dist 321 kv15","77324459384","Dwarf@gmail.com"),
("Schvarz","Nager","1955-01-29",null,null,"Schv@gmail.com"),
("Kouger","Pows","1958-10-17","Malinkina 2 kv14","77779876543","Citty@gmail.com"),
("String","ToStringov","1991-09-29",null,null,"str@gmail.com");

create table bank_account(
id int primary key auto_increment not null,
bank_name varchar(32) not null,
IBAN varchar(34) unique not null,
id_customer int not null,
constraint fk_id_customer foreign key(id_customer) references customers(id),
constraint unique_id_customer unique(id_customer)
);
-- one to one: bank_account -> customers; customers -> bank_account
insert into bank_account(bank_name, IBAN, id_customer) values
("Halyk","KZ11222233333344444444",1),
("Halyk","KZ24398359384985739485",2),
("Kaspi","KZ48759745028750824806",3),
("Halyk","KZ13216579813549845321",4),
("Halyk","KZ10238478570819248750",5),
("Kaspi","KZ14985723844750813740",6),
("Kaspi","KZ12095871038746023826",7),
("Kaspi","KZ12304871028570138487",8),
("Kaspi","KZ12837084371508345734",9),
("Kaspi","KZ132047128573487502485",10),
("Halyk","KZ100129837401054837501",11),
("Kaspi","KZ103284708197340571893",12),
("Halyk","KZ108932748901734851038",13),
("Kaspi","KZ108374017289754039875",14),
("Halyk","KZ108947519837485701013",15);
-- if want to make many to one:
-- ("Kaspi","KZ894720385702384758578",3),
-- ("Halyk","KZ574872084730582304857",7),
-- ("Kaspi","KZ108475892379508273045",9),
-- ("Kaspi","KZ293487589310058490145",4);


create table deals(
id int primary key auto_increment not null,
id_deal int not null,
id_customer int not null,
id_game int not null,
id_bank_account int not null,
date datetime default now(),
constraint fk_id_customer_deals foreign key(id_customer) references customers(id),
constraint fk_id_game_deals foreign key(id_game) references games(id),
constraint fk_id_bank_account foreign key(id_bank_account) references bank_account(id)
);

insert into deals(id_deal, id_customer,id_game, id_bank_account, date) values
(1,1,6,1, "2016-05-09"),
(1,1,3,1, "2016-10-28"),
(1,1,2,1, "2021-09-26"),
(2,2,4,2, "2015-03-08"),
(2,2,11,2, "2019-07-18"),
(3,3,15,3, "2019-01-24"),
(4,4,9,4, "2015-05-29"),
(4,4,13,4, "2021-09-27"),
(4,4,4,4, "2017-11-23"),
(4,4,6,4, "2020-11-16"),
(4,4,7,4, "2021-04-22"),
(5,5,8,5, "2015-10-08"),
(5,5,10,5, "2021-09-16"),
(6,6,14,6, "2018-03-03"),
(7,7,1,7, "2020-02-13"),
(7,7,1,7, "2015-05-24"),
(7,7,5,7, "2017-02-03"),
(8,8,12,8, "2018-12-30"),
(9,9,5,9, "2023-04-28"),
(10,10,3,10, "2017-10-05"),
(10,10,15,10, "2018-08-23"),
(10,10,13,10, "2022-11-20"),
(11,11,9,11, "2020-06-08"),
(11,11,14,11, "2015-01-05"),
(12,12,13,12, "2022-06-16"),
(13,13,13,13, "2018-11-01"),
(14,14,14,14, "2019-12-11"),
(15,15,15,15, "2019-06-22"),
(16,3,5,3, "2021-12-25"),
(17,7,4,7, "2020-09-28");

-- селекты для проверок

select* from customers;

with EveryDeal as (
select concat(firstname," ", lastname) as FullName, count(d.id_game) as GameCountPerDeal from customers c
join deals d on c.id = d.id_customer
group by d.id_deal, FullName
)
select * from EveryDeal
union
select count(*),count(*) from EveryDeal;


-- тут идет статистика за каждую покупку, с возможностью того что один и тот же покупатель сделал несколько покупок
with EveryDeal as (
select concat(firstname," ", lastname) as FullName, count(d.id_game) as GameCountPerDeal, sum(g.price) as TotalAmount from customers c
join deals d on c.id = d.id_customer
join games g on g.id = d.id_game
group by d.id_deal, FullName
)
select * from EveryDeal
union
select count(*),count(*), count(*) from EveryDeal;


-- тут идет подсчет общего колличество игр купленных одним покупателем:
with DealStatisticPerCustomer as (
select concat(firstname," ", lastname) as FullName, count(d.id_game) as GameCountPerDeal, sum(g.price) as TotalAmount from customers c
join deals d on c.id = d.id_customer
join games g on g.id = d.id_game
group by d.id_customer
)
select * from DealStatisticPerCustomer
union
select count(*),count(*), count(*) from DealStatisticPerCustomer;

-- просто больше данных
select concat(firstname," ", lastname) as FullName, 
       count(d.id_game) as GameCountPerDeal, 
       sum(g.price) as TotalAmount, 
       ba.bank_name, 
       ba.IBAN,
       date(d.date) as date
from customers c
join deals d on c.id = d.id_customer
join games g on g.id = d.id_game
join bank_account ba on d.id_bank_account = ba.id
group by d.id_deal, FullName;


-- для усложнения добавил колличество жанров
-- горжусь этим запросом )))
with GameJanrasCount as (
						select id_game,
							   count(*) as JanrasCount,
                               group_concat(name separator ', ') as GameJanras
                        from game_janra_relations gjr
						join game_janras gj on gjr.id_janra = gj.id
						group by id_game
						) 
select concat(firstname," ", lastname) as FullName, 
       count(d.id_game) as GameCountPerDeal, 
       sum(g.price) as TotalAmount, 
       ba.bank_name, 
       ba.IBAN,
       group_concat(g.name separator ',') as GamesBought,
       sum(gjc.JanrasCount) as JanrasCount,
       group_concat(gjc.GameJanras separator ' || ') as GameJanras,
       date(d.date) as date
from customers c
join deals d on c.id = d.id_customer
join games g on g.id = d.id_game
join bank_account ba on d.id_bank_account = ba.id
join GameJanrasCount gjc on d.id_game = gjc.id_game
group by d.id_deal, FullName;
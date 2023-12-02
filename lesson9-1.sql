use sdp212;

CREATE TABLE user_groups (
	id int primary key auto_increment,
    name varchar(32) not null,
    group_index int default 20
);

insert into user_groups(name, group_index) values ("Administrator", 100);

select* from user_groups;

alter table users_groups rename user_groups;

alter table user_groups change column group_index rules int;

alter table user_groups modify column rules int not null default 20;

alter table user_groups modify rules int not null default 20;

alter table users add constraint fk_group_id foreign key(groupid) references user_groups(id);

insert into user_groups(name, rules) values ("Moder", 70), ("User",20);
select * from user_groups;

--stored procedure

use myDB;
go

create procedure get_customers
as 
	select* from customers
go

execute get_customers;
go

drop procedure get_customers;
go

create procedure find_customer 
		@id int
as 
	select* from customers
	where id = @id;
go

exec find_customer 1;
go
drop procedure find_customer;
go

create procedure find_customer
		@first_name varchar(50),
		@last_name varchar(50)
as
	select * from customers
	where @first_name = first_name and @last_name = last_name;
go

exec find_customer 'Maxim', 'Kurilkin';

drop procedure find_customer;
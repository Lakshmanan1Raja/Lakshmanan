--create table guests(name varchar(20),phone int,city varchar(20),pro_flg varchar(20))
--insert into guests values('rajesh',783738,'blr',' ')
--insert into guests values('bala',8939,'chn',' ')
--insert into guests values('aruh',892393,'del',' ')
--create table customer1(c_id int,c_nm varchar(20),c_phone int,c_city varchar(20))
--create table call(c_id int identity(1,1),c_nm varchar(20),city varchar(20),phone int)

select * from guests
select * from customer1
select * from call
--insert into customer1 values(4,'rajesh',783738,'blr')

create proc spguest_callcenter 
as
begin

delete g from guests g 
where concat(g.name,g.phone,g.city) in (select concat(c_nm,c.c_phone,c.c_city) from customer1 c)

insert  into call (c_nm,city,phone)select name,city,phone from guests
where concat(name,phone,city) not in
(select concat(c_nm,c_phone,c_city) from customer1)

update guests set pro_flg='y'
where concat(name,phone,city) in 
(select concat(c_nm,phone,city) from call)
end

exec spguest_callcenter
use product

create table tableproduct(product_id  int,
name varchar(20),price float,quantity int)
insert into tableproduct values (1,'Laptop',2340,100),(2,'desktop',3467,20)

select * from tableproduct
 drop table tableproduct
-- set the quantity as 200 --
begin transaction tranname
update tableproduct set quantity = 300 where product_id=1
insert into tableproduct values (3,'mobile',3434,100)
commit
rollback transaction tranname

begin transaction tranname

update tableproduct set quantity = 300 where product_id=3
rollback transaction tranname
 
create table tableproduct1(product_id  int,
name varchar(20),price float,quantity int)

insert into tableproduct1 values (1,'Laptop',2340,100),(2,'desktop',3467,20)

select * from tableproduct1
begin transaction transaname
update tableproduct1 set quantity=300 where product_id=1
commit
 rollback transaction transaname
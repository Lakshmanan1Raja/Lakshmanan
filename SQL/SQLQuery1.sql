use groupby

create table store(item_id int identity(1,1)primary key,itemname varchar(20),cost int)
insert into store values('Potato',20),('Banana',10),('Cabbage',50),('Mango',60)
select * from store

case
 when itemname in('potato' and 'cabbage')=20   then 'Vegetables' 
 when  itemname in ('Banana' and 'Mango')  then 'Fruits'
 end as testcost
 

 create table tblenum
 (id int identity(1,1),name varchar(10))
 insert into tblenum values('raju'),('john'),('allen')
 insert into tblenum (id,name)values(4,'jacob')
 select * from tblenum
 drop table tblenum
 truncate table tblenum;
 insert into tblenum (id,name)values(3,'prem')
 set identity_insert tblenum off
  insert into tblenum values('bharad'),('anand')
  delete from tblenum where NAME='anand'

  DBCC CHECKIDENT(TBLENUM,RESEED,5)
select itemname,cost,

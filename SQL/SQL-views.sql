create view empsal
as
select * from emp

 select * from empsal

 create view vw_empsal
as
select empno,ename,job,salary,deptnumber from empdup

select * from vw_empsal
select * from empdup


update vw_empsal 
set salary=10000
where ename='james'


 --- update--

update empsal 
set sal=10000
where ename='james'

delete from empsal
where sal=10000

insert into empsal(empno,ename,job,mgr,hiredate,sal,comm,deptno) values(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30)

--schema binding

---can we create a view with another viw
-- syntax
create view  vwemp
as
select * from emp

select * from vwemp

create view wvemp
as
select * from vwemp

select * from wvemp

create table producttable (id int identity(1,1),P_Name varchar(20),unit_price int)
alter table producttable add constraint pk_ptable primary key(id)
insert into producttable values('Drawing sketchs',20),('Pens',14),('Pencils',11),('Clips',10)
create table pro_qty(productid int primary key,quantity_sold int,foreign key(productid) references producttable(id))

insert into pro_qty values(6,18),(3,23),(4,21),(2,12),(1,13),(3,12),(4,13),(1,11),(2,12),(1,14)

select * from producttable
select * from pro_qty


select pt.P_Name,sum(pq.quantity_sold*pt.unit_price)amountofsale,count(*) as totalsale
from producttable pt
 join pro_qty pq
on pt.id=pq.productid
group by pt.P_Name


create view vwproductsold
with schemabinding
as
select p.P_Name,sum(isnull((q.quantity_sold*p.unit_price),0)) as amountofsale,
COUNT_BIG(*) as totaltransactions
from dbo.producttable p
join dbo.pro_qty Q
on p.id=q.productid
group by p.P_Name


select * from vwproductsold

insert into vwproductsold values(7,'sketchs',332,1)

update vwproductsold 
set totaltransactions=3
where P_Name='pencils'

create unique clustered index vw_productsale on vwproductsold (p_name)

drop index vw_productsale on vwproductsold 


	create table workers(id int identity(1,1),w_name varchar(20),salary int,gender varchar(10),departmentid int)

	insert into workers values('john',5000,'male',3),('MIKEY',null,'male',2),('Pam',6000,'female',1),('todd',4800,'male',4),('sara',3200,'female',1),('ben',4800,'male',3)

	select * from workers

	create view vw_workers
	as
	select id,w_name,salary,gender,departmentid from workers

	select * from vw_workers

	-- trying to pass the parameter on a view---

	create view vw_workerdetails(@gender varchar(10))
	as
	select id,w_name,salary,gender,departmentid from workers 
	where gender=@gender
	--otherwise --
	select id,w_name,gender,departmentid from workers 
	where gender='male'


	-- we cannot pass the parameter in the views---
-- we hvae to create a functions for the parametr passing-

create function fn_workersgender(@gender varchar(10))
returns table
as
return
(
select id,w_name,gender,departmentid
from workers
where gender=@gender
)

select * from fn_workersgender('female').

-- limitations--
---1. we cannot pass the parameters to a view. table valued functions are excelent replacement for paramaterized views
--2. rules and  defaults cannot be associated with values 
---3. the orderby clause is invalid in the views unless we use top n clause 
---4.views cannot be based on temptables 



--encryption--
--the process of protecting information 
--Encryption is the method by which information is converted into secret code that hides the information's true meaning
create view viewnameemo
with encryption
as
select * from emp

select * from viewname

exec sp_helptext viewnameemo

delete from viewname
where sal=1100

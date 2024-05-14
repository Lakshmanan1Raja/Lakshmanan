

select * from emp
select * from dept

create table empsalary(sal_id int identity(1,1) primary key,salary int,empno int foreign key references emp(empno),dept_no int)

insert into empsalary values(800,7369,20),(1600,7499,30),(1250,7521,30),(2975,7566,20),(1250,7654,30),(2850,7698,30)
,(2450,7782,10),(3000,7788,20),(5000,7839,10),(1500,7844,30),(1100,7876,20),(950,7900,30),(3000,7902,20),(1300,7934,10)

select * from empsalary

select e.ename,es.salary,e.deptno
from emp e
inner join empsalary es on e.empno=es.empno
where dept_no=20

if exists (select 1 from sys.objects where name='sp_parameter1' and type='p')
drop procedure sp_parameter1 
go

create procedure sp_parameter1(@empid int)
as
begin 
 set nocount on

 select e.empno,e.ename,e.sal,d.deptno,d.dname
 from emp e
 inner join dept d 
 on e.deptno=d.deptno
 where e.empno=@empid
 set nocount off
 end

exec sp_parameter1 7369

if exists (select 1 from sys.objects where name='sp_parameter2' and type='p')
drop procedure sp_parameter2 
go

create or alter procedure sp_parameter2(@deptid int)
as
set nocount on
 begin
 select e.empno,e.ename,es.salary,d.deptno,d.dname
 from emp e
 inner join empsalary es on e.empno=es.empno
 inner join dept d on d.deptno=e.deptno
 where d.deptno=@deptid

set nocount off
end
go

exec sp_parameter2 20

--- third storedprocedure --

if exists (select 1 from sys.objects where name='sp_parameter3' and type='p')
drop procedure sp_parameter3 
go

create or alter procedure sp_parameter3(@empid int)
as
begin
  set nocount on

  declare @deptid int

  select @deptid=e.deptno
  from emp e
  inner join empsalary es on e.empno=es.empno
  inner join dept d on d.deptno=e.deptno
  where e.empno=@empid

  select e.empno,e.ename,es.salary,d.deptno,d.dname
  from emp e
  inner join empsalary es on e.empno=es.empno
  inner join dept d on d.deptno=e.deptno
  where e.empno=@empid

  exec sp_parameter1 @empid

  exec sp_parameter2 @deptid

  set nocount off
  end 
  go 


  select * from emp

  exec sp_parameter3 7788


  drop proc sp_deptno

  create proc sp_deptno (@empno int , @deptno int out )
as
begin 
select @deptno=deptno,*  from EMP
where empno =@empno 
end 
declare @dept int 
exec sp_deptno 7499,@dept out 
select @dept as deptno





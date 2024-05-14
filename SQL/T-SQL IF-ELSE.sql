



Table A
Id	dt_falg	nb_flag	ws_flag
 1	Best	Rest	Rest
2	Rest	Rest	Best
3	Best	Best	Rest


create table tablea(id int,dt_flag varchar(10),nb_flag varchar(10),ws_flg varchar(10))
insert into tablea values(1,'Best','Rest','Rest'),(2,'Rest','Rest','Best'),(3,'Best','Best','Rest')

select * from tablea

select id,'dt' as lob 
from tablea
union
select id,'nb' as lob 
from tablea
union
select id,'ws' as lob 
from tablea

select id,left(lob,2)lob,flag
from
(select id,dt_flag,nb_flag,ws_flg from tablea )aa
unpivot

( flag for lob in(dt_flag,nb_flag,ws_flg)) aa

create table tableb(id int,lob varchar(5),flag varchar(5))
insert into tableb values(1,'dt','best'),(1,'nb','Rest'),(1,'ws','Rest'),(2,'dt','Rest'),(2,'nb','Rest'),(2,'ws','Best'),(3,'dt','Best'),(3,'nb','Best'),
(3,'ws','Rest')
select * from tableb

select id, dt,nb,ws
from
(
 select id,lob,flag from tableb
) A
pivot
(
 max(flag)FOR lob IN (dt,nb,ws)
 )as pivote

 select * from tablea

--- while loop--


declare @var int
set @var=1
while (@var<=10)
begin
print @var
set @var=@var+1
end

----write a procedure to increment the salary of the  employee based on his salary,if the salary is > thsn 3000 increment by 1500,
--if the salary is > 2000 increment by 1000,if the salary is > 1000 increment by 500, else no increment.

declare @sal int,@tot_sal int
set @sal=3000

if (@sal>3000)
 begin
    set @tot_sal=@sal+1500
end
if (@sal>2000)
begin
  set @tot_sal=@sal+1000
end
else if(@sal>1000)
begin
 set @tot_sal=@sal+500
end

else 
  print 'No Increment'

  select * from emp
declare cur_sal cursor 
 for(select sal from emp)
declare @salary int,@tot_salary int
open cur_sal
fetch next from cur_sal into @salary
while @@FETCH_STATUS=0
begin
if (@salary>3000)
     begin
            set @tot_salary=@salary+1500
     end 
 if (@salary>2000 )
     begin
           set @tot_salary=@salary+1000
     end
 if(@salary>1000 )
      begin
           set @tot_salary=@salary+500
     end

else 
    begin
        print 'No Increment'
     end
fetch next from cur_sal into @salary
end

close cur_sal
deallocate cur_sal

select * from emp
--- cursors ---

declare @empid int;
declare @name varchar(10);
declare @sal1 int;
declare emp_cur cursor for 
select empno,ename,sal from emp
where deptno=20
open emp_cur
fetch next from emp_cur into @empid,@name,@sal1
         while @@FETCH_STATUS=0
         begin 
                print @name;
	             print @sal1;
         end
fetch from emp_cur into @empid,@name,@sal1
close emp_cur
deallocate emp_cur



--write a procedure to print a total salary with respect to department


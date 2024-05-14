
select * from emp where sal in (select distinct top 5 sal from emp order by sal desc )

select top 5 sal from emp order by sal desc

-- using dense rank()--

select * from 
( select ename,job,sal,DENSE_RANK()over(order by sal desc)as topsalary from emp) aa
where topsalary=5

select min(sal) from  (select top 5 sal from emp order by sal desc) as top5


select ename,job,sal,deptno,ROW_NUMBER() over (order by deptno)rownumber from emp

select empno,ename,job,sal,deptno,RANK()over(partition by deptno order by empno desc)ranks from emp
order by deptno

select empno,ename,job,sal,deptno,RANK()over( order by sal desc)ranks from emp
order by ranks

select * from emp

select empno,ename,job,sal,deptno,DENSE_RANK()over( partition by deptno order by sal desc)ranks from emp order by deptno,ranks asc

select *,ntile(3)over(order by sal desc)ranks 
from emp
order by ranks


select *,ntile(2)over(partition by deptno order by sal desc)ranks 
from emp
order by deptno,ranks
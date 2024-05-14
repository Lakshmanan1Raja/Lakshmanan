create database groupby
use groupby
drop table tbleemployee
create table tbleemployee(id int identity(1,1)not null primary key,name varchar(20),gender varchar(10),salary float,city varchar(20),)
insert into tbleemployee values('TOM','MALE',4000,'LONDON'),('PAM','FEMALE',3000,'NEW YORK'),('JOHN','MALE',3500,'LONDON'),('SAM','MALE',4500,'LONDON'),('TODD','MALE',2800,'SYDNEY'),
('BEN','MALE',7000,'NEW YORK'),('SARA','FEMALE',4800,'SYDNEY'),('VALARIE','FEMALE',5500,'NEW YORK'),('JAMES','MALE',6500,'LONDON'),('RUSSELL','MALE',8800,'LONDON')
SELECT * FROM tbleemployee
SELECT CITY,SUM(SALARY) AS TOTALSALARY FROM tbleemployee 
GROUP BY city 

SELECT SUM(SALARY) AS TOTALSALARY FROM tbleemployee
SELECT MIN(SALARY)AS MINSALARY FROM tbleemployee
SELECT MAX(SALARY)AS MAXSALARY From tbleemployee

select * from tbleemployee  ORDER BY salary

select SUBSTRING('microsoft',2,5)as string
select top 1 salary
 from 
 (salary distinct top 1 salary
 from tbleemployee order by salary desc) 

 select min(salary) from (select top 5 salary from tbleemployee order by salary desc) as top5


 select * from
    (select DENSE_RANK()over
(partition by salary order by salary desc)arr_sal from tbleemployee)aa where arr_sal=1

select gender,city,sum(salary) as totalsalary,count(id)totalemployees from tbleemployee group by gender,city
-- to find only the male --
select gender,city,sum(salary) as totalsalary,count(id)totalemployees 
 from tbleemployee
 where gender='male'
 group by gender,city
 --- using having --
 select gender,city,sum(salary) as totalsalary,count(id)totalemployees 
 from tbleemployee
 group by gender,city
 Having gender='male'

  select gender,city,sum(salary) as totalsalary,count(id)totalemployees 
 from tbleemployee
 group by gender,city
 Having sum(salary)>5000



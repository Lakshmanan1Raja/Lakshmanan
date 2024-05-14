create table Tab1(A INT ,B INT)
DROP TABLE T1T

INSERT INTO Tab1 VALUES(1,2),(1,1),(2,2),(3,NULL),(NULL,NULL)
CREATE TABLE T2T(C INT,D INT)
INSERT INTO T2T VALUES (1,1),(2,2),(1,1),(NULL,NULL),(NULL,NULL)


SELECT * FROM Tab1
SELECT * FROM T2T

SELECT c1.A,b1.D,c1.B,B1.C
FROM Tab1 C1 JOIN T2T B1 
ON c1.A=b1.d and c1.B=b1.C




SELECT c1.A,b1.D,c1.B,B1.C
FROM Tab1 C1 
inner JOIN T2T B1 
ON  c1.a=b1.C

SELECT c1.A,b1.D
FROM Tab1 C1 
inner JOIN T2T B1 
ON  c1.B=b1.C



SELECT DATEADD(DAY,1,EOMONTH(GETDATE(),-1))
--Certainly, here are 20 questions related to date functions in SQL:
SELECT DATEADD(DAY,DATEDIFF(DAY,0,GETDATE()),0)
--How can you retrieve the current date in SQL?
select cast(getdate() as date) as currentdate
--Write a query to calculate the difference in days between two given dates.
select datediff(day,datepart(day,'12-2-2023'),getdate())
select DATEDIFF(day,hiredate,getdate()) from emp
--What SQL function is used to extract the year from a date?
select DATEPART(year,getdate())
--Write a query to find the day of the week for a specific date.
select DATEPART(WEEKDAY,getdate())
--How would you determine the number of days remaining in the current month?
select datediff(day,'2023-02-22','2023-3-20')
--Write a query to add a specific number of months to a given date.
select DATEADD(month,2,getdate())
--What function can you use to get the last day of a specific month for a given date?
select EOMONTH('2023-02-23')lastdayofgivendate
--How can you calculate the age of a person based on their date of birth?
select *,DATEDIFF(year,hiredate,getdate())service_period
from emp
--Write a query to find the first day of the current year.
select DATEFROMPARTS(year(getdate()),1,1)first_day_of_the_current_year
select CAST(dateadd(year,datediff(year,0,eomonth(getdate())),0) AS date)first_day_of_the_current_year
select  DATEADD(YEAR,DATEDIFF(YEAR,0,EOMONTH(GETDATE())),0)
SELECT CAST(DATEADD(YEAR,DATEDIFF(YEAR,0,GETDATE()),0) AS DATE)
--How would you retrieve the month from a date and display its name?
 select datename(month,datepart(month,hiredate)) from emp
 select DATENAME(month,hiredate)as months from emp

--Write a query to find the number of days between today and a date one year from now.
 select datediff(day,getdate(),DATEADD(year,1,getdate())) days_difference
--What function can you use to get the current date and time?'
 select getdate()

--How can you calculate the difference in minutes between two timestamps?

create table timetable(timing1 time,timing2 time)
insert into timetable (timing1,timing2)
 VALUES('10:50:00','12:30:00'),
 ('12:30:00','13:52:00'),
('05:45:00','09:00:00');

select * from timetable
select*,datediff(SECOND,timing1,timing2),datediff(SECOND,timing1,timing2)/3600 hr,
datediff(SECOND,timing1,timing2)%3600,
(datediff(SECOND,timing1,timing2)%3600)/60 mn,
(datediff(SECOND,timing1,timing2)%3600)%60 mn from timetable


select*,concat(datediff(SECOND,timing1,timing2)/3600 ,' Hours ',
(datediff(SECOND,timing1,timing2)%3600)/60,' Minutes ',
(datediff(SECOND,timing1,timing2)%3600)%60,' seconds ')difference_between_hours from timetable


--Write a query to extract the time portion from a datetime column.
  create table datetimes(id int, dated datetime)
  insert into datetimes values(1,getdate()),(2,'2023-04-23 10:50:00'),(3,'2023-05-30 13:52:00')

  select * from datetimes

  select convert(time,dated)time_portion from datetimes
--What SQL function can be used to find the first day of the next quarter from the current date?
select dateadd(quarter,datediff(quarter,0,getdate())+1,0)

-- last day of next quarter--
select eomonth(dateadd(quarter,datediff(quarter,0,getdate())+1,0))
--next quarters second months last day ---

select eomonth(dateadd(quarter,datediff(quarter,0,getdate())+1,0),1)
--next quarters THIRD months last day ---

SELECT EOMONTH(DATEADD(MONTH,2,DATEADD(QUARTER,DATEDIFF(QUARTER,0,GETDATE())+1,0)))




SELECT DATEADD(QUARTER, 1, DATEADD(QQ, DATEDIFF(QQ, 0, GETDATE()) + 1, 0)) AS FirstDayOfNextQuarter;

--How would you retrieve the current UTC date and time?

SELECT GETUTCDATE()


--Write a query to calculate the age in months of a child who was born prematurely.
DECLARE @BORNDATE DATE='2023-07-29'
SELECT DATEDIFF(MONTH,@BORNDATE,GETDATE())AGE_IN_MONTHS

--What function can you use to format a datetime value as a string with a specific format?

--How can you determine if a given year is a leap year in SQL?
--Write a query to find the number of weekdays (excluding weekends) between two dates.

DECLARE @STARTING_DATE DATE=DATEADD(DAY,1,EOMONTH(GETDATE(),-1))
DECLARE @END_DATE DATE=cast(EOMONTH(GETDATE())as datetime)

DECLARE @Countofday int
     
	  select @Countofday=
	  ( datediff(Day,'2023-08-01','2023-08-31')+1)
			- ( datediff(WEEK,'2023-01-23',getdate())*2)
			- case when   DATEPART(WEEK,'2023-08-01')=1 then 1 else 0 end
			-case when   DATEPART(WEEK,'2023-08-31')=7 then 1 else 0 end;
		select @Countofday as weekdayscount;;

DECLARE @STARTING_DATE DATE = DATEADD(DAY, 1, EOMONTH(GETDATE(), -1));
DECLARE @END_DATE DATE = CAST(EOMONTH(GETDATE()) AS DATETIME) ;

WITH DateCTE AS (
    SELECT @STARTING_DATE AS CurrentDate
    UNION ALL
    SELECT DATEADD(DAY, 1, CurrentDate)
    FROM DateCTE
    WHERE CurrentDate < @END_DATE
)
SELECT
    SUM(CASE WHEN DATEPART(WEEKDAY, CurrentDate) NOT IN (1, 7) THEN 1 ELSE 0 END) AS WorkingDaysCount,
    SUM(CASE WHEN DATEPART(WEEKDAY, CurrentDate) IN (1, 7) THEN 1 ELSE 0 END) AS NonWorkingDaysCount
FROM DateCTE










CREATE TABLE TB1(ID INT,CODE VARCHAR(5))
CREATE TABLE TB2(ID INT,CODE VARCHAR(5))
INSERT INTO TB1 VALUES(1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E'),(6,'F')

INSERT INTO TB2 VALUES(1,'KN'),(3,'ZZ'),(4,'BC'),(6,'MN')

SELECT * FROM TB1
SELECT * FROM TB2

SELECT A.ID,B.CODE
FROM TB1 A 
LEFT JOIN TB2 B
ON A.ID=B.ID

SELECT TB1.ID,
 CASE 
  WHEN TB2.ID=TB1.ID THEN TB2.CODE
  ELSE TB1.CODE 
  END AS CODE
FROM TB1  
LEFT JOIN TB2 
ON TB1.ID=TB2.ID

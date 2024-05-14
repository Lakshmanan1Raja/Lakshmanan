USE assignment


----1.	What is the order of Execution in SQL query?

--FROM
--WHERE
--GROUP BY 
--HAVING
--SELECT
--ORDER BY

--2.	Suppose we have 2 Tables with 10 rows each, 
--so what will be the maximum and minimum number of rows we get after joining these two tables.


CREATE TABLE TBLE1(ID INT IDENTITY(1,1),NAME VARCHAR(10));
INSERT INTO TBLE1 VALUES('A'),('B'),('C'),('D'),('E'),('F'),('A'),('E'),('R'),('W')
CREATE TABLE TBLE2(I_ID INT IDENTITY(1,1),NAME VARCHAR(10));
INSERT INTO TBLE1 VALUES('A'),('B'),('C'),('D'),('E'),('F'),('A'),('E'),('R'),('W')

select * from tble1
select * from tble2

select t1.id,t1.name,t2.i_id,t2.name
from tble1 t1 inner join tble2 t2
on t1.id=t2.i_id



--3.	Write a SQL query to extract the id’s who haven’t transacted in the month of ‘jan’.

Id	Month	amt
1	jan  	23
1	Feb 	3
1	March	14
2	jan	    23
3	jan	     4
4	March  	5
5	jan	    12
2	April	34
3	April	2
4	Feb	    1
5	jan	    20

CREATE TABLE TRANSACT(ID INT, MONTHS VARCHAR(20), AMOUNT INT)
INSERT INTO TRANSACT VALUES(1,'JAN',23),(1,'FEB',3),(1,'MARCH',14),(2,'JAN',23),
(3,'JAN',4),(4,'MARCH',5),(5,'JAN',12),(2,'APRIL',34),(3,'APRIL',2),(4,'FEB',1),(5,'JAN',20)

SELECT * FROM  TRANSACT

SELECT DISTINCT ID FROM TRANSACT WHERE ID NOT IN (SELECT ID FROM TRANSACT WHERE MONTHS='JAN')
SELECT ID ,MONTHS FROM TRANSACT WHERE MONTHS!= 'JAN'

--- SALES REPORT ---

INSERT INTO STORE VALUES(362,'HARAHAN','5151CITRUS BLVD','HARAHAN','LA'),(6220,'GLASTONBURY','115 PUTNAM BLVD','GLASTONBURY','LM'),
(2844,'MAPLE GROVE','GROVE CIRCLE','MAPLE GROVE','CT'),(485,'LOWES OF FT. OGLETHORPE','2215 BATTLEFIELD PKWY','FORT OGLETHORPE','GA')



create table sales_table(Retailer int,store int,SKU int,week int,year int,units int,Dollors int)

insert into sales_table values(101,727,599506,16,2021,3,545),
(102,2686,1004823827,19,2021,2,43.94),
(101,6173,681059,18,2021,10,65.55),
(101,2578,1002878652,21,2021,2,16.4),
(102,1419,625356,19,2021,0,55),
(101,727,599506,16,2021,3,545)

create table SKU(SKU int,SKU_DESCRIPTION nvarchar(200),Category nvarchar(200),subcategory nvarchar(200))
insert into sku values(1000168869,'RED QUAD ADVANCEDFO','CAULKS','SOLVENT'),
(1000169079,'BEIGE QUAD ADVANCED','CAULKS','SOLVENT'),
(1348292,'SERTA QUEEN HYBRID10-IN MATTRESS','Hybrid',NULL),
(1000169445,'RED QUAD ADVANCED FO','CAULKS','SOLVENT'),
(319762,'4-IN PRO SPPUPSPRY W 15-FT QTRNOZ','SPRAYS','PRO-S')

select * from store
select * from sales_table
select * from sku
select * from Fiscal_Yr_Wk

--4.	Write a query to get top 4 highest selling states.

--5.	Print the number of Stores having sales less than 50 in each week for Year 2021.
select * from sales_table
where year=2021 and dollors<=50 

--6.	Write a query to get Store, Store Name, SKU, 
--Category and total dollars and Avg units for each.

select s.store_id,s.store_name,sk.sku,sk.category,st.dollors,avg(st.units)aver
from store s inner join sales_table st on s.store_id=st.store
inner join sku sk on sk.sku=st.sku 
where sk.sku=1000168869
group by s.store_id,s.store_name,sk.sku,sk.category,st.dollors

--7.From Fiscal_Yr_Wk table get Month, Year from Week_ending_Dt. Give alias to each column.
select month(week_ending_dt) monthno,year(week_ending_dt)year
from fiscal_yr_wk.

--8.	Write a query to get total number of
--units and sales (SALES TABLE) of each store (pull only top 10), in year 2020?


select sum(st.units),sum(st.dollors)
from sales_table st join Fiscal_Yr_Wk fy on st.
where year()

-------28-june-2023---

CREATE TABLE STUDENT_1(STUDENT_NAME VARCHAR(10),TOTAL_MARKS INT,YEAR int)
insert into STUDENT_1 values('Rahul',90,2010),
insert into STUDENT_1 values('Sanjay',80,2010),
('Mohan',70,2010),('Rahul',90,2011),
('Sanjay',85,2011),('mohan',65,2011),('rahul',80,2012),
('Sanjay',80,2012),('Mohan',90,2012)

select * from STUDENT_1

select S1.STUDENT_NAME,S1.TOTAL_MARKS, MAX(S1.YEAR)AS CURRENTYEAR,(SELECT S2.TOTAL_MARKS
from STUDENT_1 S1 WHERE S1.STUDENT_NAME=S2.STUDENT_NAME AND S1.YEAR=S2.YEAR)+1)AS PREVIOUSMARKS FROM STUDENT_1 S2
GROUP BY S1.STUDENT_NAME,S1.TOTAL_MARKS

SELECT S1.STUDENT_NAME,S1.TOTAL_MARKS,S1.YEAR,MAX( S1.YEAR)AS CURRENTYEAR ,(SELECT S2.TOTAL_MARKS FROM STUDENT_1 S2 
WHERE S2.STUDENT_NAME=S1.STUDENT_NAME AND S2.YEAR=MAX(S1.YEAR)+1)AS PREVIOUSYEAR
FROM STUDENT_1 S1
GROUP BY S1.STUDENT_NAME,S1.TOTAL_MARKS


select
    len('ASSERTIVEBUSINESS')
    -  len(
        replace(replace(replace(replace(replace(
            lower('ASSERTIVEBUSINESS'), 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', '')
    ) as vowel_count
 




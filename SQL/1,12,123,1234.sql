create table busseattable(bus_id int,total_seats int,sold_seats int)
insert into busseattable values(1234,200,200),(1235,150,140),(1236,100,120),(1237,300,300),(1238,120,100)

SELECT * FROM busseattable

SELECT *,
  CASE 
       WHEN total_seats=sold_seats THEN 'SEATS ARE FULL '
	   WHEN total_seats>sold_seats AND (total_seats-sold_seats)<=10  THEN 'Hurry Up ! Limitted seats'
	   when total_seats<sold_seats then 'over booked'
	   WHEN total_seats>sold_seats THEN 'Seats are Available'
	   END AS Booking_status

	   FROM busseattable

update busseattable
set sold_seats=118
where bus_id=1238


--- find the occurances in this table----

create table find_G(col1 char(2),col2 char(2),col3 char(2),col4 char(2),col5 char(2),col6 char(2))
insert into find_G values('G','R','B','G','R','R')
SELECT * FROM find_G
insert into find_G values('R','G','B','G','G','R')
insert into find_G values('G','B','G','G','R','G')
insert into find_G values('G','R','G','B','G','R')
insert into find_G values('R','G','G','G','R','R')
insert into find_G values('G','R','B','G','R','R')

SELECT 
	SUM (CASE 
	WHEN COL1='G' THEN 1  ELSE 0 END ) AS COL1,
	SUM (CASE 
	WHEN col2='G' THEN 1  ELSE 0 END ) AS COL2,
	SUM (CASE 
	WHEN col3='G' THEN 1  ELSE 0 END )COL3,
	SUM (CASE 
	WHEN col4='G' THEN 1  ELSE 0 END )COL4,
	SUM (CASE 
	WHEN col5='G' THEN 1  ELSE 0 END )COL5,
	SUM (CASE 
	WHEN col6='G' THEN 1  ELSE 0 END ) AS COL6
    from find_G

select
	SUM(CASE 
	WHEN COL1='G' THEN 1  ELSE 0 END +
	CASE 
	WHEN col2='G' THEN 1  ELSE 0 END+
	CASE 
	WHEN col3='G' THEN 1  ELSE 0 END+
	CASE 
	WHEN col4='G' THEN 1  ELSE 0 END+
	CASE 
	WHEN col5='G' THEN 1  ELSE 0 END+
	CASE 
	WHEN col6='G' THEN 1  ELSE 0 END)as total_g
	FROM find_G


	SELECT 
    SUM(CASE WHEN COL1 = 'G' THEN 1 ELSE 0 END) AS COL1_G,
    SUM(CASE WHEN COL2 = 'G' THEN 1 ELSE 0 END) AS COL2_G,
    SUM(CASE WHEN COL3 = 'G' THEN 1 ELSE 0 END) AS COL3_G,
    SUM(CASE WHEN COL4 = 'G' THEN 1 ELSE 0 END) AS COL4_G,
    SUM(CASE WHEN COL5 = 'G' THEN 1 ELSE 0 END) AS COL5_G,
    SUM(CASE WHEN COL6 = 'G' THEN 1 ELSE 0 END) AS COL6_G,
    SUM(CASE WHEN COL1 = 'R' THEN 1 ELSE 0 END) AS COL1_R,
    SUM(CASE WHEN COL2 = 'R' THEN 1 ELSE 0 END) AS COL2_R,
    SUM(CASE WHEN COL3 = 'R' THEN 1 ELSE 0 END) AS COL3_R,
    SUM(CASE WHEN COL4 = 'R' THEN 1 ELSE 0 END) AS COL4_R,
    SUM(CASE WHEN COL5 = 'R' THEN 1 ELSE 0 END) AS COL5_R,
    SUM(CASE WHEN COL6 = 'R' THEN 1 ELSE 0 END) AS COL6_R
FROM find_G; -- Replace with the actual table name


select * from emp

select sal, ()over(order by sal desc) s from emp
select sal, NTILE(3)over(order by sal desc) s from emp
select sal, LAST_VALUE(sal)over(PARTITION BY DEPTNO order by sal desc) s from emp



--- HOW TO FIND 3RD MAX SALARIED PERSONS ? ---
SELECT * FROM 
(
SELECT ENAME,SAL,DENSE_RANK()OVER (ORDER BY SAL DESC)RANKS  
FROM emp) AA
WHERE AA.RANKS=4

WITH CTE
AS
(
SELECT *,DENSE_RANK()OVER(ORDER BY SAL DESC)RNK FROM emp
)
SELECT * FROM CTE
WHERE CTE.RNK=3
SELECT * FROM EMP

SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL IN
(SELECT TOP 1 SAL FROM
(SELECT DISTINCT TOP 3 sal FROM EMP ORDER BY  SAL DESC)A ORDER BY SAL)

SELECT DISTINCT EMPNO,ENAME,SAL FROM EMP WHERE SAL IN
(SELECT MIN(SAL) FROM
(SELECT DISTINCT TOP 3 sal FROM EMP ORDER BY  SAL DESC)A)

SELECT MAX(SAL) FROM EMP 
WHERE sal < (SELECT MAX(SAL) FROM EMP )


--- HOW TO REMOVE DUPLICATE ROWS IN TABLE --
 SELECT * INTO EMPD FROM EMP
 SELECT * FROM EMPD

 SELECT SAL,COUNT(SAL)AS DUPLICATES FROM EMPD
 GROUP BY SAL
 HAVING COUNT(SAL)>1

 INSERT INTO EMPD VALUES (7369,'SMITH','CLERK',7902,'17-DEC-80',800,NULL,20);
INSERT INTO EMPD VALUES (7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30);
INSERT INTO EMPD VALUES (7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30);
INSERT INTO EMPD VALUES (7566,'JONES','MANAGER',7839,'02-APR-81',2975,NULL,20);
INSERT INTO EMPD VALUES (7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30);
INSERT INTO EMPD VALUES (7698,'BLAKE','MANAGER',7839,'01-MAY-81',2850,NULL,30);
INSERT INTO EMPD VALUES (7782,'CLARK','MANAGER',7839,'09-JUN-81',2450,NULL,10);
INSERT INTO EMPD VALUES (7788,'SCOTT','ANALYST',7566,'19-APR-87',3000,NULL,20);
INSERT INTO EMPD VALUES (7839,'KING','PRESIDENT',NULL,'17-NOV-81',5000,NULL,10);
INSERT INTO EMPD VALUES (7844,'TURNER','SALESMAN',7698,'08-SEP-81',1500,0,30);
INSERT INTO EMPD VALUES (7876,'ADAMS','CLERK',7788,'23-MAY-87',1100,NULL,20);
INSERT INTO EMPD VALUES (7900,'JAMES','CLERK',7698,'03-DEC-81',950,NULL,30);
INSERT INTO EMPD VALUES (7902,'FORD','ANALYST',7566,'03-DEC-81',3000,NULL,20);
INSERT INTO EMPD VALUES (7934,'MILLER','CLERK',7782,'23-JAN-82',1300,NULL,10);

--- to find the duplicates ---
SELECT EMPNO,COUNT(EMPNO)EMPLOYEES FROM EMPD
GROUP BY empno
HAVING COUNT(empno)>1

--- to delete a duplicate record from the table---
WITH DELETEDUPLICATE
AS
(
SELECT EMPNO,ENAME,ROW_NUMBER()OVER(PARTITION BY ENAME ORDER BY EMPNO)AS RANKED 
FROM EMPD

)
DELETE FROM DELETEDUPLICATE
WHERE RANKED>1

--- another approch to delete a duplicate recordd from the table -----
DELETE A FROM 
( SELECT EMPNO,ROW_NUMBER()OVER(PARTITION BY EMPNO ORDER BY ENAME) RNK 
FROM EMPD)A
WHERE RNK>1



SELECT * FROM EMPD



------- PRINT REPLICATE OF NUMBER---
------ASCENDING 1,22,333,4444---
--DECLARE @A INT = 1
--WHILE @A<=9
-- BEGIN 
--    DECLARE @B VARCHAR(100)=''
--	DECLARE @C INT=1

--WHILE @C<=@A
-- BEGIN 
--  SET @B=@B+CAST(@A AS varchar(20))
--  SET @C=@C+1
--  END
--  PRINT @B
--    SET @A=@A+1
--	END

--- DESCENDING 101010101,99999
DECLARE @A INT = 10
WHILE @A>=1
BEGIN 
    DECLARE @B VARCHAR(100)=''
	DECLARE @C INT=1

WHILE @C<=@A
 BEGIN 
   SET @B=@B+CAST(@A AS varchar(20))
   SET @C=@C+1
   END
   PRINT @B
    SET @A=@A-1
	END


--- 1,12,123,1234---
	DECLARE @A INT = 1
WHILE @A<=20
 BEGIN 
    DECLARE @B VARCHAR(100)=''
	DECLARE @C INT=1

WHILE @C<=@A
 BEGIN 
   SET @B=@B+CAST(@C AS varchar(20))
   SET @C=@C+1
   END
   PRINT @B
    SET @A=@A+1
	END

	--- descending order --


	DECLARE @A INT = 20
WHILE @A>=1
 BEGIN 
    DECLARE @B VARCHAR(100)=''
	DECLARE @C INT=1

WHILE @C<=@A
 BEGIN 
   SET @B=@B+CAST(@C AS varchar(20))
   SET @C=@C+1
   END
   PRINT @B
    SET @A=@A-1
	END

	--- name reverse----

	declare @name varchar(20)='LAKSHMANAN'
	DECLARE @LEN INT=LEN(@NAME)
	WHILE @LEN>0
	BEGIN
	 PRINT LEFT(@NAME,@LEN)
	 SET @LEN=@LEN-1
	 END
	 -- DESCENDING ORDER---
	DECLARE @NAME VARCHAR(20)='LAKSHMANAN'
	DECLARE @LEN INT=LEN(@NAME)
    WHILE @LEN>=0
	   BEGIN 
	      PRINT SUBSTRING(@NAME,1,@LEN)
		  SET @LEN=@LEN-1
		  END
--- ASCENDING ORDER----
	 DECLARE @NAME VARCHAR(20)='LAKSHMANAN'
	DECLARE @LEN INT=LEN(@NAME)
	DECLARE @C INT=1
    WHILE @C<=@LEN
	   BEGIN 
	     PRINT SUBSTRING(@NAME,1,@C)
	      --PRINT reverse(SUBSTRING(@NAME,1,@C))
		  SET @C=@C+1
		  END;

---- Find the nthoccurances of the string----

declare @inputstring varchar(30)='LAKSHMANANnnaaannaaaandaadw'
DECLARE @CHARACTERFIND CHAR(1)='a'
DECLARE @NTHCHARACTER INT=12;
WITH Nthoccurances
as
(
select 1 as occurances,CHARINDEX(@CHARACTERFIND,@inputstring) as positions,
 CHARINDEX(@CHARACTERFIND,@inputstring) as records
 union all
 select occurances+1,CHARINDEX(@CHARACTERFIND,@inputstring,records+1),
 CHARINDEX(@CHARACTERFIND,@inputstring,records+1)
 from Nthoccurances
 where occurances<=@NTHCHARACTER
 )
 select top 1 positions
 from Nthoccurances
 order by positions desc
 

 -- repeating numbers ---
declare @num int =1
while @num<=20
begin
 declare @rep int=1
 while @rep<=@num
 begin
  print @num
  set @rep=@rep+1
  end
  set @num=@num+1
  end
--- fibonacci series ---
  with cte as 
  (select 0 as prevnum,1 as num
  union all
  select num,prevnum+num from cte where num<20)
  select prevnum from cte
-- product---

--- stored procedures ---
--group of code and its precompiled , then whenever you want you can call it to execute it.
--we can do all the performances like ddl,dml,dcl,tcl
----syntax-
-- create procedure pr_name()
-- as
-- begin
--     sql statement(performance all the operations)
-- end

-- this procedure cannot be used in select clause 

-- exec p_name (parameter)
--- write a procedure find the eligible to vote or not --
--- input parameter---
create procedure SP_eligible(@age int)
as
  begin 
  if(@age>18)
  print 'eligible to vote'
  else
  print 'Not eligible to vote'
  end

  exec SP_eligible 19

  --- output parameter ---
  create procedure SP_eligib(@age int,@res varchar(20)output)
as
  begin 
  if(@age>18)
set @res ='eligible to vote'
  else
 set @res  ='Not eligible to vote'
  end


  declare @result varchar(20)
  exec SP_eligib 19,@result=@res output
  print @result







create or alter procedure sp_togetdept10records(@dept int)
as
begin
   select * from emp
   where deptno=@dept
end


exec sp_togetdept10records



create or alter procedure sp_getdomain(@email varchar(50))
as
begin
    select  substring('abc@gmail.com',charindex('@','abc@gmail.com')+1,(CHARINDEX('.','abc@gmail.com')-CHARINDEX('@','abc@gmail.com'))-1) as domain 

end

exec sp_getdomain abc@gmail


-- write a procedure to passing the date and display whether leep year or not
CREATE PROCEDURE CheckLeapYear(@inputDate DATE)
AS
BEGIN
    DECLARE @year INT;
    SET @year = YEAR(@inputDate);
	IF (@year % 4 = 0 AND @year % 100 <> 0) OR (@year % 400 = 0)
        PRINT CAST(@year AS VARCHAR(4)) + ' is a leap year.';
    ELSE
        PRINT CAST(@year AS VARCHAR(4)) + ' is not a leap year.';
END;

select * from products;

create PROCEDURE sp_product_launch(@P_NAME VARCHAR(20))
AS
BEGIN
     SELECT @P_NAME=P_NAME
	 FROM products
	 WHERE launch_date=CAST(GETDATE()AS varchar(20))
END

EXEC sp_product_launch 'MOUSE'

CREATE PROCEDURE SP_PRODUCT_LAUNCHDATE(@DATE DATE)
AS
BEGIN
SELECT @DATE=launch_date
FROM products
WHERE  @DATE=launch_date
END

EXEC SP_PRODUCT_LAUNCHDATE '2010-09-21'

SELECT * FROM products
CREATE TABLE PRODUCTSALES(P_ID INT PRIMARY KEY,SALES_DATE DATE,FOREIGN KEY(P_ID) REFERENCES PRODUCTS(P_ID))
INSERT INTO PRODUCTSALES VALUES(100,GETDATE()),(101,GETDATE()),(102,GETDATE()),(103,'2017-04-16'),(104,'2018-01-15')
SELECT * FROM PRODUCTSALES

CREATE PROCEDURE SP_PRODUCTSALES1(@PNAME VARCHAR(20))
AS
 BEGIN
 DECLARE @COUNT INT
 
     SELECT  @COUNT=COUNT(S.P_ID)
	 FROM products P JOIN PRODUCTSALES S
	 ON P.p_id=S.P_ID
	 WHERE S.SALES_DATE=CAST(GETDATE()AS date) AND P.p_name=@PNAME
	 IF(@COUNT=1)
    BEGIN
	  PRINT 'PRODUCT IS SOLD'
	  END
	  ELSE 
	  BEGIN
	   PRINT 'PRODUCT IS NOT SOLD'
	   END
 END

 EXEC SP_PRODUCTSALES1 MARKER

 CREATE PROCEDURE SP_PRODUCTSALES(@PNAME VARCHAR(20))
AS
 BEGIN
 DECLARE @COUNT INT
 
     SELECT  @COUNT=COUNT(S.P_ID)
	 FROM products P JOIN PRODUCTSALES S
	 ON P.p_id=S.P_ID
	 WHERE S.SALES_DATE=CAST(GETDATE()AS date) AND P.p_name=@PNAME
	 IF(@COUNT>=1)
    BEGIN
	  PRINT 'PRODUCT IS SOLD'
	  END
	  ELSE 
	      BEGIN
	         PRINT 'PRODUCT IS NOT SOLD'
	       END
 END
 EXEC SP_PRODUCTSALES MOUSE
 DROP PROCEDURE SP_PRODUCTSALES

 ---- OUTPUT PARAMETER ---

 SELECT * FROM EMP

 CREATE PROCEDURE SP_COUNTOFEMP(@DEPTNO INT,@EMPCOUNT INT OUTPUT)
 AS
 BEGIN
     SELECT @EMPCOUNT=COUNT(EMPNO)FROM EMP WHERE DEPTNO=@DEPTNO
 END

 DECLARE @TOTALEMP INT
 EXEC SP_COUNTOFEMP 20,@TOTALEMP OUTPUT
 PRINT @TOTALEMP

 --- return ---
 -- input ----
  CREATE PROCEDURE SP_COUNTOFEMPp(@DEPTNO INT)
 AS
 BEGIN
     return(SELECT COUNT(*)FROM EMP 
	 WHERE DEPTNO=@DEPTNO)
 END

 DECLARE @TOTALEMP INT
 EXEC @TOTALEMP=SP_COUNTOFEMPp 10
 PRINT @TOTALEMP

 --- output ---
 create procedure sp_empname(@empno int)
 as
 begin
 return(select ename from emp
 where empno=@empno)
 end

 declare @empname int
 exec sp_empname  @empname output
 print @empname
 ---make it as  optional---


 SELECT * FROM products
 -- 1.write a procedure which takes product name  and print the number of sales it made in the current year and previous year.
 INSERT INTO products VALUES (106,'NOTEBOOK','STATIONARY',500,350,'2022-12-20')
 
 CREATE OR ALTER PROCEDURE SP_PRODUCTSALES(@PRODUCTNAME VARCHAR(50) )
 AS
  BEGIN
        DECLARE @CURRENTYEAR INT
		DECLARE @PREVIOUSYEAR INT

		SET @CURRENTYEAR=YEAR(GETDATE())
		SET @PREVIOUSYEAR=@CURRENTYEAR-1

	-- CURRENT YEAR SALES-
	SELECT COUNT(*) AS CURRENTYEARSALES
	FROM products
	WHERE p_name=@PRODUCTNAME
	 AND YEAR(launch_date)=@CURRENTYEAR
	 -- PREVIOUS YEAR SALES --
	 SELECT COUNT(*)AS PREVIOUSYEARSALES
	 FROM products
	 WHERE p_name=@PRODUCTNAME
	  AND YEAR(launch_date)=@PREVIOUSYEAR
	  	   	    
  END
  EXEC SP_PRODUCTSALES KEYBOARD

 -- 2.write a code it takes customer id and display whether he is from metro city or  not
 SELECT * FROM products
 DROP PROCEDURE SP_PRODUCTFAMILY
 --- USINF=G PRODUCT NAME ---
 CREATE OR ALTER PROCEDURE SP_PRODUCTFAMILY(@P_ID INT)
 AS
 BEGIN
    DECLARE @P_PRODUCTNAME VARCHAR(50)
	SELECT @P_PRODUCTNAME=P_NAME FROM products 
	WHERE p_ID=@P_ID
IF @P_PRODUCTNAME IN ('MOUSE','DESKTOP','LAPTOP','KEYBOARD')
      BEGIN 
               PRINT 'PRODUCT IS FROM COMPUTER FAMILY'
       END
ELSE
        BEGIN
 PRINT 'PRODUCT IS NOT FROM COMPUTER FAMILY'
 END
 END
   --- USING FAMILNAME AS ---
 EXEC SP_PRODUCTFAMILY 106

  CREATE OR ALTER PROCEDURE SP_PRODUCTFAMILYS(@P_ID INT)
 AS
 BEGIN
    DECLARE @P_PRODUCTFAMNAME VARCHAR(50)
	SELECT @P_PRODUCTFAMNAME=p_familyname FROM products 
	WHERE p_ID=@P_ID
IF @P_PRODUCTFAMNAME IN ('COMPUTER')
      BEGIN 
               PRINT 'PRODUCT IS FROM COMPUTER FAMILY'
       END
ELSE
        BEGIN
 PRINT 'PRODUCT IS NOT FROM COMPUTER FAMILY'
 END
 END
   EXEC SP_PRODUCTFAMILYS 100

 --3.write a block or procedure which take deptno ,dname location as one string as a input check whether the first value in the argument is number or not?

 CREATE OR ALTER PROCEDURE SP_EMPDATE(@VARIABLE VARCHAR(40))
 AS
 BEGIN
  DECLARE @STRING VARCHAR(20)
  IF SUBSTRING(@VARIABLE,1,1) LIKE'[0-9]%'
   BEGIN
     PRINT 'First value argument is numbeer'
	 end
else 
  begin
     print 'First value argument is not a number'
	 end
end


exec SP_EMPDATE 'accounting,newyork'

 -- 4.write a procedure which takes employee number and print their salary
 SELECT * FROM EMP
 CREATE OR ALTER PROCEDURE SP_EMPSAL(@EMPNO INT,@SAL INT OUTPUT,@ename varchar(20) output)
 AS
 BEGIN
 
   SELECT @SAL=SAL,@ename=ename FROM EMP
   WHERE  empno=@EMPNO
END
 DECLARE @EMPNO INT
 DECLARE @SAL INT 
 declare @ename varchar(10)
EXEC SP_EMPSAL  7839,@SAL OUTPUT,@ename output
SELECT @SAL AS SALARY,@ename as employeename


 -- 5.create a procedure with except an email id as input and print if the id is valid or not

 ALTER TABLE EMP
 ALTER COLUMN EMAIL VARCHAR(50)

CREATE PROCEDURE ValidateEmail (@email VARCHAR(255))
AS
BEGIN
    IF (SELECT PATINDEX('%[^a-zA-Z0-9._-]%', @email)) = 0
        AND (SELECT LEN(@email) - LEN(REPLACE(@email, '@', ''))) = 1
        AND (SELECT LEN(@email) - LEN(REPLACE(@email, '.', ''))) >= 2
        AND (SELECT CHARINDEX('.', REVERSE(@email)) - 1) > 1
    BEGIN
        PRINT 'Email is valid'
    END
    ELSE
    BEGIN
        PRINT 'Email is not valid'
    END
END
 select * from emp

exec ValidateEmail 'scott@rediff.co.in'

CREATE or alter PROCEDURE ValidateEmail1
    @email NVARCHAR(255)
AS
BEGIN
    DECLARE @isValid BIT = 0
    
    -- Checking email format using LIKE operator
    IF @email LIKE '%@%._%'
        SET @isValid = 1
    
    -- Printing the result
    IF @isValid = 1
        PRINT 'Email is valid'
    ELSE
        PRINT 'Email is not valid'
END
 
 exec ValidateEmail1 'l.com@akb@fh.snahh'
 
 ---email---

 ---1.length of email is(<=64)
 ---2.left(@email, )<>@ and right(@email, )
 --- 3. right(@email,4) like '.com','.in'
 --- 4.no number after @
 -- 5..lower case

 create or alter procedure sp_emailvalidate(@email varchar(70))
 as
 begin 
  if
   len(@email)<=64 
   and   left(@email,1)<>'@'
   and @email like '%.com ' or @email like'%.in'
   and  substring(@email,charindex('@',@email)+1,len(@email)) NOT LIKE'%[0-9]%'
	and
	@email=lower(@email)
	and	len(@email)-len(replace(@email,'@',''))=1 
	 begin
	  print 'email is valid'
   end
 else 
      begin
	     print'email is not valid'
     end 
 end

exec sp_emailvalidate 'smith@335gmail.com'





 drop table alpha
create table alpha(s_no int,a varchar(4),b varchar(4),c varchar(4),d varchar(4),e varchar(4))
insert into alpha(s_no,a,b,c,d,e) values(1,'a','a','a','a','a'),(2,'b','b','b','b','b'),(3,'c','c','c','c','c'),(4,'d','d','d','d','d'),(5,'e','e','e','e','e')
select * from alpha;
select 
 case 
    when a in ('abcde') then ('a1''b1''c1''d1''e1')
	else null
	end as a11
	from alpha 

	SELECT
    CASE
        WHEN a = 'a' THEN ('a1''b1''c1''d1''e1')
        ELSE NULL
    END AS a1,
    CASE
        WHEN b = 'b' THEN ('a2''b2''c2''d2''e2')
        ELSE NULL
    END AS b1,
    CASE
        WHEN c = 'c' THEN ('a3''b3''c3''d3''e3')
        ELSE NULL
    END AS c1
FROM
   alpha;

   --- INOUT PARAMETERS ----
   DROP PROCEDURE SPGETEMPSAL
   CREATE PROCEDURE SPGETEMPSAL(@DEPTNO INT)
   AS
   BEGIN
        SELECT ENAME,SAL FROM EMP
		WHERE deptno=@DEPTNO
		ORDER BY ename
   END

   EXEC SPGETEMPSAL 10
   DROP PROCEDURE SPGETEMPNAME

      CREATE PROCEDURE SPGETEMPNAME(@EMPNAME VARCHAR(20))
   AS
   BEGIN
        SELECT empno,ENAME,SAL,JOB,DNAME,LOC FROM EMP JOIN dept ON EMP.deptno=DEPT.deptno
		WHERE ename=@EMPNAME
		ORDER BY ename
   END
   SELECT * FROM EMP
   EXEC SPGETEMPNAME 'WARD'

   CREATE PROCEDURE SP_SALCOMP(@MINSAL DECIMAL)
   AS
   BEGIN
        SELECT ENAME,DEPTNO,SAL FROM EMP
		WHERE SAL>=@MINSAL
   END
   EXEC SP_SALCOMP 3000

      CREATE PROCEDURE SP_SALMULCOMP(@MINSAL DECIMAL,@MAXSAL DECIMAL)
   AS
   BEGIN
        SELECT ENAME,DEPTNO,SAL FROM EMP
		WHERE SAL>=@MINSAL  AND
		SAL<=@MAXSAL
		ORDER BY deptno
   END

	   EXEC SP_SALMULCOMP @MINSAL=1500,@MAXSAL=5000;

	--- CREATING TEXT PARAMETER ---
	SELECT * FROM EMP

	 DROP PROCEDURE SP_ADDINGNAME

	ALTER PROCEDURE SP_ADDINGNAME(@MINSAL DECIMAL=800,@MAXSAL DECIMAL=500
	,@JOB VARCHAR(50))
	AS
	BEGIN 
	  SELECT ENAME,DEPTNO,SAL,job FROM EMP
		WHERE SAL>=@MINSAL  AND	SAL<=@MAXSAL
		AND JOB LIKE '%'+@JOB+'%'
		ORDER BY sal
		END

		EXEC SP_ADDINGNAME @JOB='SQL'

		CREATE PROCEDURE SP_ADDINGNAMEE(@MINSAL DECIMAL, @MAXSAL DECIMAL, @JOB VARCHAR(50))
AS
BEGIN
  SELECT ENAME, DEPTNO, SAL, job
  FROM EMP
  WHERE SAL >= @MINSAL AND SAL <= @MAXSAL
    AND JOB LIKE '%' + @JOB + '%'
  ORDER BY sal
END

EXEC SP_ADDINGNAMEE 800, 3000, 'SQL'

CREATE TABLE EMPPROCEDURE (
    ENAME VARCHAR(50),
    DEPTNO INT,
    SAL DECIMAL(10, 2),
    JOB VARCHAR(50)
);

INSERT INTO EMPPROCEDURE VALUES ('John Doe', 1, 2000.00, 'SQL Developer');
INSERT INTO EMPPROCEDURE VALUES ('Jane Smith', 2, 3000.00, 'SQL Analyst');
INSERT INTO EMPPROCEDURE VALUES ('Bob Johnson', 1, 2500.00, 'Database Administrator');
INSERT INTO EMPPROCEDURE VALUES ('Alice Williams', 3, 4000.00, 'SQL Developer');

CREATE PROCEDURE SP_ADDINGNAMES(@MINSAL DECIMAL, @MAXSAL DECIMAL, @JOB VARCHAR(50))
AS
BEGIN
    SELECT ENAME, DEPTNO, SAL, JOB
    FROM EMP
    WHERE SAL >= @MINSAL AND SAL <= @MAXSAL
        AND JOB LIKE '%' + @JOB + '%'
    ORDER BY SAL;
END;

EXEC SP_ADDINGNAMES 1000, 3000, 'HTML';


CREATE PROCEDURE uspFindProducts(
    @min_list_price AS DECIMAL
    ,@max_list_price AS DECIMAL
    ,@name AS VARCHAR(max)
)
AS
BEGIN
    SELECT
        Ename,
SAL    FROM 
EMP    WHERE
        SAL >= @min_list_price AND
        SAL <= @max_list_price AND
        ENAME LIKE '%' + @name + '%'
    ORDER BY
        SAL;
END;

EXEC uspFindProducts @min_list_price=1000,@max_list_price=5000,@name='MAXE'
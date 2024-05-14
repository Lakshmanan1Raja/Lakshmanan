--- functions ---

-- performs specific taks 
-- inbuild
-- user defined function

--we can do the performs like 
--create
-- alter
--drop 

--there are three types of functions
-- scalar(in/p'n',o/p only scalar)
-- inline table value(didn't perform dml functions)
-- multivalues function(perform dml functions)

-- syntax--

--create function function_name (variable datatype,..)
--returns variable which returns as
-- begin

-- -- function body
-- -- return @value
-- end

 -- to call the function--

 --select dbo.function_name
 
 ----SCALAR FUNCTION---
 --- create function for addition of two numbers ---
 create function fn_add(@a int,@b int)
 returns int
 as
 begin
   declare @res int
   set @res=@a+@b
   return @res
   end

   select dbo.fn_add(-5,-2)total

   select * from emp

   ALTER FUNCTION FN_NUMERIC(@A INT,@B INT)
   RETURNS INT
   BEGIN
      DECLARE @RESULT INT
	  IF (@A>@B)
	   BEGIN 
	       SET @RESULT=ABS(@A-@B)
		END
   ELSE 
    BEGIN
        SET @RESULT=ABS(@A+@B)
	 END
	  RETURN @RESULT
	 END

	 SELECT DBO.FN_NUMERIC(-5,2)TOT



   --- create function for get branch of emp --

   CREATE FUNCTION GetEmployeeBranch
(
    @EDEPTNO INT
)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @ENAME VARCHAR(50)

    SELECT @ENAME = ENAME
    FROM Emp
    WHERE DEPTNO = @EDEPTNO

    RETURN @ENAME
END

DECLARE @ENAME VARCHAR(20)
SELECT DBO.GetEmployeeBranch(10) AS EMPNAME FROM EMP


--- CREATE FUNCTION FOR SIMPLE INTEREST CALCULATION --

CREATE FUNCTION FN_INTCALC1(@P int,@T int,@R INT)
RETURNS INT 
AS
 BEGIN
     DECLARE @TOT INT
	 SET @TOT=(@P*@T*@R/100)
	 RETURN @TOT
END

SELECT DBO.FN_INTCALC1 (1000,3,3)

CREATE OR ALTER FUNCTION FN_YRCAL(@P DECIMAL,
@R DECIMAL(3,2),
@T DECIMAL(3,2))
RETURNS DECIMAL 
AS
 BEGIN
     DECLARE @TOT DECIMAL
	 SET @TOT=(@P*@T*@R/100)
	 RETURN @TOT
END
DROP FUNCTION FN_YRCAL
SELECT DBO.FN_YRCAL (20000,2.5,2.3)


CREATE OR ALTER FUNCTION FN_YRCALFL(@P FLOAT,
@R FLOAT,
@T FLOAT)
RETURNS FLOAT 
AS
 BEGIN
     DECLARE @TOT FLOAT
	 SET @TOT=(@P*@R*@T/100)
	 RETURN @TOT
END
SELECT DBO.FN_YRCALFL(20000,0.3,1)



--- INLINE VALUED FUNCTION ---

-- CREATE FUNCTION FUNCTIONNAME(@VARIABLE DATATYPE)
--RETURN TABLE
--AS
-- RETURN(SELECT  COL1,COL2,..
--   FROM TABLENAME
--   WHERE CONDITION)

                                     ---multivalued function---
--create function fn_name(@parameter)
--returns @tablename table(@col1 datatype,@col2 datatype)
--as
--begin
--  we can do 
--    insert
--	update
--	delete
--return @tablename
--end



-- FIND THE EMPLOYEES WHO ARE WORKING IN THE PARTICULAR DEPARTMENTS ---
CREATE PROCEDURE SP_EMPDET(@JOB VARCHAR(20))
AS
BEGIN
      SELECT * FROM EMP
      WHERE JOB=@JOB
END

 EXEC SP_EMPDET 'SALESMAN'

 -- USING FUNCTIONS--

 CREATE or alter FUNCTION FN_DEPT(@JOB VARCHAR(20))
 RETURNS table
 AS

   RETURN (
   SELECT * FROM emp
   where job=@JOB
   )

   select * from dbo.FN_DEPT ('manager') a join dept b on a.deptno=b.deptno


  -- write a function to print the numbers from 1 to 10 without loops
create or alter function fn_number(@A int)
returns table
as
return
(

 with num
 as
 (
 select 1 as number
 union all
 select number+1 
 from num
 where number<@A
  )
   select number from num
  );

  select * from dbo.fn_number (10)

 --write function input is an email display whether its valid or not

 create  FUNCTION fn_emailvalidate (@email varchar(100))
RETURNS varchar(20)
AS
BEGIN
    DECLARE @result varchar(20)

    IF LEN(@email) <= 64
        AND  left(@email,1) <>'@'
		and (@email like '%.com%' or @email like '%.in%')
 		and (substring(@email,charindex('@',@email)+1,len(@email)) NOT LIKE'%[0-9]%')
		and @email=lower(@email)
		and len(@email)-len(replace(@email,'@',''))=1
    BEGIN
        SET @result = 'Email ID is Valid'
    END
    ELSE
    BEGIN
        SET @result = 'Email ID is Invalid'
    END

    RETURN @result
END


select dbo.fn_emailvalidate('sunil@gmail.com')
	

--which takes date in a date format and display whether its an valid or not
create function fn_datedisplay(@date varchar(20))
returns varchar(20)
as
 begin
     declare @datereturn varchar(20)
	if ISDATE(@date)=1
		 begin 
	    set @datereturn='Date is Valid'
		end
	else
	begin
	  set @datereturn='Date is Invalid'
	  end

	 return @datereturn
	 
	 end

	 select dbo.fn_datedisplay('12-may-2023')

--to print factorial numbers

create or alter function fn_factorial(@n int)
returns table
as
return
(

 with factorial
 as
 (
 select  1 as number,1 as factorial
 union all
 select number+1,factorial*(number+1) 
 from factorial
 where number<@n
  )
   select f.number,f.factorial from factorial f
  );

    select number,factorial from dbo.fn_factorial(5)

--WRITE A FUNCTION to print 10 prime numbers




--write a question to print fibonosis (dont use for loop)


--- multi valued functions ---


--diff b/w inline and multiline

--inline                              multiline
--dml operations not performed        we can do dml perform 
--No begin and end                    begin and end is mandatory
--table structure is not mentioned    here table structure is mentioned
--views                               similar like stored procedure



--WRITE A FUNCTION which return the top 2 salaries based on the location

create function fn_top2(@location varchar(20))
returns table
as  
return
       (  select top 2 ename,sal,loc from emp e
join dept d on e.deptno=d.deptno
where loc=@location
order by sal desc)

select ename,sal from dbo.fn_top2('new york')
select * from dept

--waf That takes 'MON-YYYY' as a i/p and it will return 'mm-yyyy' but the output should like 'mon-yyyy'.


--'a,b,c,d,e' to the  o/p column a b c d e

declare @i int=1
declare @string1 varchar(100)=('a,b,c,d')
declare @string2 varchar(100)=' '
declare @len int=len(@string1)+1
 while(@i<=@len)
  begin
   if (SUBSTRING(@string1,@i,1)=',' or @i=len(@string1)+1)
   begin
    print @string2
	set @string2=' '
	end
	else 
	begin
	 set @string2=@string2+SUBSTRING(@string1,@i,1)
	 end
	 set @i=@i+1
	 end

--pass the three numbers and print the larger number

CREATE FUNCTION FN_LARGESTNUMBER(@N1 INT,@N2 INT,@N3 INT)
RETURNS INT 
AS
BEGIN
   DECLARE @RETURN INT;
 IF (@N1>=@N2 AND @N1>=@N3)
      BEGIN 
    SET @RETURN=@N1
	   END
	 IF (@N2>=@N1 AND @N2>=@N3)
      BEGIN 
    SET @RETURN=@N2
	   END
	ELSE 
	   BEGIN
	  SET @RETURN=@N3
	    END
		RETURN @RETURN 
	 END

	 SELECT DBO.FN_LARGESTNUMBER (12,23,34)AS LARGESTNUMBER
	 
	 ---------- ANOTHER TYPE ------
declare @num1 int=20
declare @num2 int=18
declare @num3 int=17

select 
   case 
        when @num1>=@num2 and @num1>=@num3 then @num1
		when @num2>=@num1 and @num2>=@num3 then @num2
		
		else  @num3
		end as largernumber

--------- using functions----
create function fn_largenumber(@a int,@b int,@c int)
returns int
as
 begin
      declare @largest int
      if(@a>@b and @a>@c)
	   begin
	     set @largest=@a
		 end
		 if(@b>@a and @b>@c)
		  begin
		   set @largest=@b
		   end
		   else 
		   begin
		     set @largest=@c
			 end

  return @largest
  end

  select dbo.fn_largenumber(5,8,10)largerstnumber

		
--pass a string and check given is palindrom or not
DECLARE @InputString VARCHAR(100) = 'malayalam';
DECLARE @ReversedString VARCHAR(100);

SELECT @ReversedString = REVERSE(@InputString);

SELECT
    CASE
        WHEN @InputString = @ReversedString THEN 'Palindrome'
        ELSE 'Not Palindrome'
    END AS PalindromeStatus;

-----  using function ----

	create function fn_palindrome(@input varchar(40))
	returns varchar(40)
	as
	begin
	 declare @returnpalindrome varchar(50)
	    select @returnpalindrome=reverse(@input)
	      
		  if 
			
			@returnpalindrome= @input
			
			  return 'Palindrome'
			  
			  else 
			  begin
			  return 'Not a Palindrome'
			 end
			  return @returnpalindrome
			  end

select dbo.fn_palindrome('malayalam')as status

-- display number of vowels and consonants in the given string

CREATE FUNCTION FN_FINDSTRING(@INPUTSTRING VARCHAR(50))
RETURNS VARCHAR(20)
AS
BEGIN
RETURN
(
  SELECT 
     CASE 
	     WHEN @InputString IN ('A','E','I','O','U') THEN 'VOWEL'
		 WHEN @InputString  NOT IN ('A','E','I','O','U') THEN 'CONSONENTS'
		 ELSE 'NONE'
		 END)
		 
		 END

		 SELECT DBO.FN_FINDSTRING('AEIOU')






--count the given character in the given string
--write a function to multiply two numbers

declare @a int =5
declare @b int=4

declare @c int
set @c=@a*@b
select @c

create function fn_multiply(@a int,@b int)
returns int
as
   begin 
    
	   declare @c int
	set @c=@a*@b
	
	return @c
	end 

	select dbo.fn_multiply (3,18)as answer

--pass the mail address  print the username,domain and extension
CREATE FUNCTION FN_DOMAIN( @EMAILADDRESS VARCHAR(70))
RETURNS TABLE
AS
   RETURN
   (
      SELECT 
	      @EMAILADDRESS AS EMAILADDRESS,
		  LEFT( @EMAILADDRESS,charindex('@', @EMAILADDRESS)-1) as username,
		  SUBSTRING( @EMAILADDRESS,CHARINDEX('@', @EMAILADDRESS)+1,CHARINDEX('.', @EMAILADDRESS)-CHARINDEX('@', @EMAILADDRESS)-1)as domain,
		  substring(@EMAILADDRESS,charindex('.', @EMAILADDRESS)+1,len( @EMAILADDRESS)-charindex('.', @EMAILADDRESS))as extension
		  )
    
	select  username,domain,extension from dbo.FN_DOMAIN ('scott44@rediff.com')


---- tablevariables---
--table is a database object in the form of rows and columns
--variable is contains the values
--temp
--stores in tempdb
--when block ends then automatically deleted
----- types
--  there are only one type is there
--   that is local(@)
---- creation of tablevariable 
--    consider as a table but acts like variable
--	  declare @table_name table
--	  (col1 datatype  constraints)

--	  insert into @table_name values(....)


 declare @Std_id 
 table(id int,ename varchar(20))
 
 insert into @Std_id values(1,'aa'),(2,'bb'),(3,'cc'),(4,'dd')
  update @Std_id set ename='dell' where id=4
  delete from @Std_id where ename='dell'
  drop table @std_id
    select * from @Std_id


  select * from @Std_id

 -- truncate table  @std_id --- truncate will not work 
  --drop table @std_id--Drop will not work 
   declare @Std_id 
 table(id int,ename varchar(20))
  update @Std_id set ename='dell' where id=4
   select * from @Std_id


   --- to calculate the age of the employee--


   declare @DOB date
   declare @age int
   set @DOB='2020-05-18'

  set @age=DATEDIFF(year,@DOB,getdate()) -
  case 
	when (MONTH(@DOB)>MONTH(getdate())) or
	     (MONTH(@DOB)=MONTH(GETDATE())) and
	 (day(@DOB)>DAY(GETDATE()))
		  then 1
	  else 0
 end 
   select @age as age


   --- using scalar function to calculate the age --
   create function fn_calculateage(@dob date)
   returns int
   as 
    begin 
	
   declare @age int
  set @age=DATEDIFF(year,@DOB,getdate()) -
  case 
	when (MONTH(@DOB)>MONTH(getdate())) or
	     (MONTH(@DOB)=MONTH(GETDATE())) and
	 (day(@DOB)>DAY(GETDATE()))
		  then 1
	  else 0
 end 
   return @age 
   end

   select dbo.fn_calculateage ('1996-12-20' ) as age


   declare @i int =1
   declare @name varchar(20) ='lakshman'
   while  @i<=len(@name)
   begin
     print  left(@name,@i)
	 set @i=@i+1
   end



  




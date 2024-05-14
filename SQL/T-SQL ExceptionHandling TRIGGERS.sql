---exception handling----assign db--

----it is an event which causes abnormal termination of program.
--in sql by using try and catch blocks

----syntax
--begin try
-----
--end try
--begin catch
--end catch
-- if there is an exception occurs in try block then then catch block will be activate
--the catch block will handle the error
--inbuild functions for error handling
--  @@error(it will check the code,if its successfull it leaves,but its an error it gives the number)
--1.error_number(it will print the internal error number)
--1.error_message()(it directly print the error)
--2.error_line()(it gives the error line)
--3.error_state()
--4.error_procedure()(while writing the stored procedure and function means , this function will tell where and which part of the error occured)
--5.error_severiaty()
--6.Raise_error()(insert directly)(must pass three arguments)('string','severity','error_state')

begin try
declare @a int,@b int,@c int
set @a=4
set @b=0
set @c=@a/@b
print @c
end try
begin catch
raiserror('@b value cannot be 0',16,1)
--select @@ERROR as error,
--       ERROR_NUMBER() as errornumber,
--	   ERROR_STATE() as errorstate,
--       ERROR_LINE() as errorline,
--       ERROR_SEVERITY() as severity
end catch;


CREATE OR ALTER PROCEDURE SP_ERR(@A INT,@B VARCHAR(23))
AS
BEGIN TRY
PRINT @A+@B
END TRY
BEGIN CATCH
PRINT 'ERROR CONVERTING DATATYPE INT TO  VARCHAR'
END CATCH

EXEC DBO.SP_ERR 45,RAILG







--1... pincode---
select SUBSTRING('country,state,city-pincode',charindex('-','country,state,city-pincode')+1,len('country,state,city-pincode'))as pincode
select SUBSTRING('india,tamilnadu,erode-638054',charindex('-','india,tamilnadu,erode-638054')+1,len('india,tamilnadu,erode-638054'))as pincode
--2.swapping 
create table swaptable(id int identity,eName varchar(20),gender varchar(10),SALARY INT)
insert into swaptable values('Amith','Male',9559),('SunilKumar','Male',7665),('SHANKAR','MALE',8878),
('ABIRAMI','FEMALE',6765),('SOWMYA','FEMALE',6775),('ANU','FEMALE',5677),('RAHUL','MALE',7667),('LAKSHMAN','MALE',7887)

SELECT * FROM GENDERUPDATEA

CREATE VIEW GENDERUPDATEA
AS
SELECT * FROM swaptable

UPDATE GENDERUPDATEA SET gender= CASE
                   WHEN gender='MALE' THEN 'FEMALE'
				   WHEN GENDER='FEMALE' THEN 'MALE'
				   ELSE 'N'
				   END

SELECT * FROM GENDERUPDATEA


UPDATE GENDERUPDATEA SET SALARY= CASE
                   WHEN id=1 THEN (SELECT SALARY FROM GENDERUPDATEA WHERE id=2 )
                   WHEN id=2 THEN (SELECT SALARY FROM GENDERUPDATEA WHERE id=3 )
				   WHEN id=3 THEN (SELECT SALARY FROM GENDERUPDATEA WHERE id=4 )
				   WHEN id=4 THEN (SELECT SALARY FROM GENDERUPDATEA WHERE id=5 )
				   WHEN id=5 THEN (SELECT SALARY FROM GENDERUPDATEA WHERE id=6 )
				   WHEN id=6 THEN (SELECT SALARY FROM GENDERUPDATEA WHERE id=7 )
				   WHEN id=7 THEN (SELECT SALARY FROM GENDERUPDATEA WHERE id=8 )
				   WHEN id=8 THEN (SELECT SALARY FROM GENDERUPDATEA WHERE id=1 )
				   ELSE 'N'
				   END


SELECT SALARY,LEAD(SALARY)OVER(ORDER BY SALARY DESC)AS SALLEAD FROM GENDERUPDATEA
ORDER BY SALARY DESC

SELECT SALARY,LAG(SALARY)OVER(ORDER BY SALARY DESC)AS SALLEAD FROM GENDERUPDATEA
ORDER BY SALARY DESC



CREATE TABLE TRACE(ID INT IDENTITY,NAME VARCHAR(20))







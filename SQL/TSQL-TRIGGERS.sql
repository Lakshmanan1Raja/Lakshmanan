---=======-----____+++++++++ TRIGGERS +++====_______0---=

--DDL AND DML TRIGGERS
--DIDNT PASS ANY PARAMETERS LIKE SP AND FN
--COMMIT AND ROLLBACK IS NOT WORK IN TRIGGERS

--DML IS MOSTLY USED IN THE TRIGGERS

--DDL TRIGGER---
	 >--DATABASE  BASED TRIGGER(IT WORKS ON PARTICULAR DATABASE ONLY)
	 >--SERVER BASED TRIGGER(IT WORKS ON ALL DATABASE WITHIN THE SERVER)

	 ----DDL TABLE EVENT AS(EVENT_GROUP)
	 -- ( CREATE TABLE
	 --  ALTER TABLE
	 --  DROP TABLE) AS EVENT_TYPE

	 --SYNTAX--
	 CREATE TRIGGER TRIGGER_NAME
	 ON (DATABASE)(ALL SERVER)
	 FOR (EVENT_TYPE) EVENT_GROUP
	 AS
	 BEGIN
	      SQL STATEMENT
	END ;


		 CREATE TRIGGER TR_NAME
	 ON DATABASE
	 FOR CREATE_TABLE
	 AS
	 BEGIN
	   PRINT'TABLE CREATED'
	 END

	 CREATE TABLE TRIGGERTABLE(ID INT,ENAME VARCHAR(30))

	 	 CREATE OR ALTER TRIGGER TR_NAME
	 ON DATABASE
	 FOR CREATE_TABLE
	 AS
	 BEGIN
	   PRINT'TABLE IS NOT CREATED'
	   ROLLBACK TRANSACTION
	 END
	 	 CREATE TABLE TRIGGERTA(ID INT,ENAME VARCHAR(30))

		 DROP TRIGGER TR_NAME
		 ON DATABASE


---- DML TRIGGERS ----(AFTER (OR) FOR TRIGGER AND INSTEADOF TRIGGER)
-- INSERT
--UPDATE
--DELETE

---INSERTION 

	create table TABTRIG
( id int ,namee varchar(30),sal int )

insert into TABTRIG values( 1,'SUNIL',8560)
insert into TABTRIG values(2,'RAHUL',7886)
insert into TABTRIG values(3,'LAKSHMAN',8987)


select * from TABTRIG

CREATE TABLE AUDITTABLE(id int ,namee varchar(30),sal int,AUDITACTION VARCHAR(30),AUDITTIME DATETIME)
SELECT * FROM AUDITTABLE
DROP TABLE AUDITTABLE
DELETE FROM TABTRIG WHERE ID=4
---SYNTAX--
---- CREATE TRIGGER TRIGGER_NAME
--		FOR {EVENT}
--		AS
--		{SQL STATEMENT}

CREATE TRIGGER DELETED_TRIGGER ON TABTRIG
for  DELETE 
AS
DECLARE @T_ID INT
DECLARE @T_NAMEE VARCHAR(20)
DECLARE @T_SAL INT
DECLARE @T_AUDITACTION VARCHAR(100)
   SELECT @t_ID=D.id FROM deleted D;
   SELECT @T_NAMEE=D.NAMEE FROM deleted D;
   SELECT @T_SAL=D.SAL FROM deleted D;
   SET @T_AUDITACTION='DELETED'
INSERT INTO AUDITTABLE(ID,NAMEE,SAL,AUDITACTION,AUDITTIME)
   VALUES(@T_ID,@T_NAMEE,@T_SAL,@T_AUDITACTION,GETDATE())

   PRINT 'AFTER DELETE TRIGGER IS FIRED' 

   ALTER TABLE TABTRIG DISABLE TRIGGER DELETE_TRIGGER
   DELETE FROM TABTRIG WHERE ID=2
   SELECT * FROM TABTRIG
   SELECT * FROM AUDITTABLE





   ---- WRITE A TRIGGER ON THE EMPLOYEE TABLE BY VALIDATING THE EMPNO BY INSERTING THE RECORD INTO EMP TABLE ,
   --IF ITS EXISTS SHOULD NOT ALLOW TO INSERT THE RECORD OTHERWISE IT SHOULD INSERT THE RECORD
   INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,NULL,20)
   SELECT * INTO EMPTRI FROM emp
   SELECT * FROM EMPTRI
   drop table  EMPTRI
   drop trigger trg_InsertEmp


 CREATE or alter TRIGGER trg_InsertEmp
ON EMPTRI
for INSERT
AS
BEGIN
   declare @i int,@count int
   select @i=empno from inserted
   select @count=count(empno) from EMPTRI 
   where empno=@i
   begin
      print @i;
	  print @count;
    END
  if @count>1
     begin
	 rollback
	  raiserror('Employee is already exists',8,1)
	  end
end

   SELECT * FROM EMPTRI




insert into EMPTRI values (7900,'laxman','devops',7782,getdate(),300,null,40)

--- write a trigger on emp table so that it should allow to do dml only during business hour (9-6) 
drop trigger tr_bussinesstime
create trigger tr_bussinesstimer on emptri
for insert,update
as
begin
   declare @timeinterval int=datepart(hour,getdate())
   if
   @timeinterval>9 and @timeinterval<11
    begin
	 raiserror('DML only during business hour',8,1)
	 rollback transaction
	 end
	 end
	 select * from emptri
insert into EMPTRI values (109,'laxman','devops',7782,getdate(),300,null,40)
update emptri set ename='vetri' where empno=79






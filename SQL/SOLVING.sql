use assignment
go

CREATE TABLE EMP(EMPID INT NOT NULL PRIMARY KEY,EMPNAME VARCHAR(20),SALARY FLOAT)
INSERT INTO EMP VALUES(1,'CHANDRA',3000),(2,'AMIT',2000),(3,'RAJU',1000)
SELECT * FROM EMP

-- SUB QUERY --

SELECT EMPNAME FROM EMP WHERE SALARY > (SELECT SALARY FROM EMP WHERE EMPNAME='AMIT')
SELECT EMPNAME FROM EMP WHERE SALARY < (SELECT SALARY FROM EMP WHERE EMPNAME='CHANDRA' )

create table gendertble(g_id int not null primary key,g_name varchar(10))
insert into gendertble values(1,'male'),(2,'female'),(3,'unknown'),(4,'male')
create table persontable(p_id int not null primary key,p_name varchar(20),g_id int,foreign key(g_id)references gendertble(g_id))
insert into persontable values(1,'sundara',1),(2,'sita',2),(3,'rajesh',3)
select * from persontable
select * from gendertble

ALTER TABLE PERSONTABLE 
ADD CONSTRAINT DF_CONSTRAINT_GENDERID
DEFAULT 3 FOR g_id

insert into persontable(p_id,p_name) values(4,'kumar')
insert into persontable(p_id,p_name,g_id)values(5,'vela',NULL)


select p_name,g_name from persontable right join gendertble on persontable.p_id=gendertble.g_id





CREATE TABLE DEPARTMENT(D_ID INT NOT NULL PRIMARY KEY,DEPTNAME VARCHAR(20),LOCATION VARCHAR(20),DEPT_ID INT)
INSERT INTO DEPARTMENT VALUES(1,'HR','BENGALURU',101),(2,'MANAGER','CHENNAI',102),(3,'SDE','BENGALURU',103),(4,'SDE','CHENNAI',103)
SELECT * FROM DEPARTMENT
SELECT * FROM EMPLOYEE
CREATE TABLE EMPLOYEE 
(EMPID INT NOT NULL PRIMARY KEY,
EMPNAME VARCHAR(20),
GENDER VARCHAR(10),
SALARY FLOAT,
DEPT_ID INT FOREIGN KEY REFERENCES DEPARTMENT(D_ID))

INSERT INTO EMPLOYEE VALUES(1,'ANKITH','MALE',2000,1)
INSERT INTO EMPLOYEE VALUES(2,'SANKAR','MALE',3000,2),(3,'LAKSHMANAN','MALE',2500,1),(4,'ANU','FEMALE',3000,2)


SELECT EMPNAME,DEPTNAME,D_ID FROM EMPLOYEE INNER JOIN DEPARTMENT ON EMPLOYEE.DEPT_ID=DEPARTMENT.D_ID

CREATE TABLE EMP1 (
EMP_ID INT NOT NULL PRIMARY KEY,NAME VARCHAR(20),MANAGERID INT)
INSERT INTO EMP1 VALUES(1,'KUMAR',3),(2,'ARUN',1),(3,'RAM',NULL),(4,'BHARAD',1),(5,'NAVEEN',1)
SELECT * FROM EMP1


SELECT E.NAME AS EMPL,M.NAME AS MANAGERNAME FROM EMP1 E LEFT JOIN EMP1 M ON E.MANAGERID=M.EMP_ID

select *  from emp1

select E.name as employee,M.name as Manager from
EMP1 E left join Emp1 M ON E.managerid=M.emp_id;

--- identity ----

create table deptarments1(deptid int identity(1,1)primary key,dname varchar(20)) 
select * from deptarments1
drop table deptarments1
insert into deptarments1 values('MANAGER')
insert into deptarments1 values ('SCINDER')
DELETE from deptarments1 where deptid=1

SET IDENTITY_INSERT deptarments1 ON
SET IDENTITY_INSERT deptarments1 OFF

-- DBCC--
DELETE FROM deptarments1

DBCC CHECKIDENT(deptarments1,RESEED,0)



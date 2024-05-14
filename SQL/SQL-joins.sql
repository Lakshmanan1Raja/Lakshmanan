use groupby

CREATE TABLE DEPTTABLE(
ID INT identity(1,1)NOT NULL PRIMARY KEY,
DEPARTMENT_NAME VARCHAR(20),
LOCATION VARCHAR(20),
DEPARTMENT_HEAD VARCHAR(20))

INSERT INTO DEPTTABLE VALUES('IT','LONDON','RICK'),
('PAYROLL','DELHI','RON'),('HR','NEW YORK','CHRISTIE'),
('OTHER DEPARTMENT','SYDNEY','CINDRELLA')
DROP TABLE empltable
create table empltable(
id int identity(1,1)not null primary key,
name varchar(20),
gender varchar(10),
salary float,department_id int
 FOREIGN KEY REFERENCES DEPTTABLE(ID))

insert into empltable values('TOM','MALE',4000,1),('PAM','FEMALE',3000,3),('JOHN','MALE',3500,1),('SAM','MALE',4500,2),('TODD','MALE',2800,2),
('BEN','MALE',7000,1),('SARA','FEMALE',4800,3),('VALARIE','FEMALE',5500,1),('JAMES','MALE',6500,NULL),('RUSSELL','MALE',8800,NULL)

SELECT * FROM empltable
SELECT * FROM DEPTTABLE

SELECT NAME,GENDER,SALARY,DEPARTMENT_NAME 
 FROM empltable
INNER JOIN DEPTTABLE 
 ON empltable.department_id=DEPTTABLE.ID

 SELECT NAME,GENDER,SALARY,DEPARTMENT_NAME 
 FROM empltable
 LEFT JOIN DEPTTABLE
 ON empltable.department_id=DEPTTABLE.ID

 SELECT NAME,GENDER,SALARY,DEPARTMENT_NAME
 FROM empltable
 RIGHT JOIN DEPTTABLE
 ON empltable.department_id=DEPTTABLE.ID

 SELECT NAME,GENDER,SALARY,DEPARTMENT_NAME
  FROM empltable
  FULL JOIN DEPTTABLE
  ON empltable.department_id=DEPTTABLE.ID

  SELECT NAME,GENDER,SALARY,DEPARTMENT_NAME
  FROM empltable
  CROSS JOIN DEPTTABLE
  SELECT * FROM empltable
  -- TO FILTER NULL--
  SELECT     NAME,GENDER,SALARY,DEPARTMENT_NAME
  FROM       empltable
  LEFT JOIN  DEPTTABLE 
  ON         empltable.department_id=DEPTTABLE.ID
  WHERE      empltable.department_id IS NULL
 OR      DEPTTABLE.ID IS NULL

 SELECT  NAME,GENDER,SALARY,DEPARTMENT_NAME
 FROM empltable
 RIGHT JOIN DEPTTABLE
 ON empltable.department_id=DEPTTABLE.ID
 WHERE empltable.department_id IS NULL

  SELECT NAME,GENDER,SALARY,DEPARTMENT_NAME
  FROM empltable
  FULL JOIN DEPTTABLE
  ON empltable.department_id=DEPTTABLE.ID
  WHERE empltable.department_id IS NULL
  OR DEPTTABLE.ID IS NULL
   
   select * from empltable
   select * from DEPTTABLE

  select DEPARTMENT_NAME,count(department_id)as totalemp
  from  empltable
  inner join DEPTTABLE
  on empltable.department_id=DEPTTABLE.ID
  group by DEPARTMENT_NAME

  -- CTE --
  WITH EMPLOYEECOUNT(DEPARTMENT_ID,TOTALEMPLOYEE)
  AS
  ( SELECT DEPARTMENT_ID,COUNT(*) AS TOTALEMPLOYEE
  FROM empltable
  GROUP BY DEPARTMENT_ID
  )
  SELECT DEPARTMENT_NAME,TOTALEMPLOYEE
  FROM DEPTTABLE
  JOIN EMPLOYEECOUNT 
  ON DEPTTABLE.ID=EMPLOYEECOUNT.DEPARTMENT_ID
  ORDER BY TOTALEMPLOYEE

  WITH EMPLOYEECOUNT(department_id,totalemployee)
  AS
  ( SELECT DEPARTMENT_ID,COUNT(*) as totalemployee
  from empltable
  group by department_id
  )
  select department_name,totalemployee
  from DEPTTABLE
  join EMPLOYEECOUNT
  on DEPTTABLE.ID=EMPLOYEECOUNT.department_id
  order by totalemployee
 
  SELECT * FROM empltable
  SELECT * FROM DEPTTABLE

  --- SELF JOIN --
  
  CREATE TABLE tblemp(id int identity(1,1)not null primary key,empname varchar(20),managerid int)
insert into tblemp values('mike',3),('rob',1),('todd',null),('ben',1),('sam',1)
select * from tblemp

  SELECT E.empname  AS EMPLOYEE,M.empname  AS MANAGER
  FROM tblemp E
  LEFT JOIN tblemp M
  ON E.managerid=M.id

  SELECT E.empname AS EMPLOYEE,M.empname AS MANAGER
  FROM tblemp E
 INNER JOIN tblemp M
  ON E.managerid=M.id

  SELECT E.empname AS EMPLOYEE,M.empname AS MANAGER
  FROM tblemp E
 CROSS JOIN tblemp M

 
 


select UPPER(FNAME),fname
 as Doctorname from DOCTORS
 order by doc_id asc

 create table strings(name varchar(20));
 insert into strings VALUES('RAHUl'),('SUNIL KUMAR'),('AMITH'),('SHANKAR');
 select * from strings
 SELECT UPPER((LEFT(NAME,1)))+ substring(lower(name), 2,len(name))AS NAMES
 FROM STRINGS

 select UPPER((left(name,1)))+RIGHT(LOWER(name),len(name)-1)as names
 from strings



 select DOCTORS.* , upper(LEFT(fname,1))+ SUBSTRING(fname,2,len(fname))as names
 from DOCTORS

 select upper(left(fname,1)) + SUBSTRING((RIGHT(fname,2)),fname,len(fname))as names
 from DOCTORS



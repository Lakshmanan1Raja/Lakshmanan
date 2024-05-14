
Student subject marks
Ravi.       Maths. 70
Ravi.       Science  80
Ram.       Maths.   85
Ram.       Hindi.     75
Kumar.    Social.  70

create table students(student varchar(15),subject varchar(10),marks int)
insert into students values('Ravi','Maths',70),('Ravi','Science',80),('Ram','Maths',85),('Ram','Hindi',75),('Kumar','Social',70)
select * from students
EXEC SP_RENAME 'STUDENTS.STUDENT','NAME';

EXEC SP_RENAME 'STUDENTS.MARKS','SCORES';
EXEC SP_RENAME 'STUDENTS.SUBJECT','SUBJECTS'

select distinct sn.NAME,sub.SUBJECTS,st.SCORES as marks from
(select distinct name from students) as sn
cross join (select distinct subjects from students)as sub
left join students st on st.NAME=st.NAME and sub.SUBJECTS=st.SUBJECTS
order by NAME,SUBJECTS

-- PIVOT query to transform subject marks into columns
SELECT *
FROM
(
  SELECT Name, SubjectS,SCORES
  FROM students
) AS SourceTable
PIVOT
(
  MAX(SCORES)
  FOR SubjectS IN ([Maths], [Science], [Hindi], [Social])
) AS PivotTable;


CREATE TABLE STUDENTSCORE(S_NAME VARCHAR(10),MATHS INT,SCIENCE INT,HINDI INT,SOCIAL INT)
INSERT INTO STUDENTSCORE VALUES ('kumar',null,null,null,70),('Ram',85,null,75,null),('Ravi',70,80,null,null)
select * from STUDENTSCORE


SELECT s_name,marks,subjects
from 
(select s_name,maths,science,hindi,social
from STUDENTSCORE
)as swc
unpivot
(
marks for subjects in (maths,science,hindi,social)
)as uno


create table t1(id int)
insert into t1 values(1),(0),(1),(1),(1),(null),(null),(0),(1),(2),(3),(5),(null)
create table t2(id int)

insert into t2 values(0),(1),(null),(null),(5),(4),(3),(null),(2),(null),(0),(6),(9)

select * from t1
select * from t2

select s.id,t.id from t1 s
right join t2 t on s.id=t.id



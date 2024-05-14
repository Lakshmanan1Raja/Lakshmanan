use product


create table students(stu_id int identity(1,1)primary key,student_name varchar(20),standards varchar(20))

insert into students values('Amith','2nd'),('Rahul','3rd'),('Shankar','2nd'),('Vignesh','1st'),('Sunil Kumar','2nd')


create table marks( sub_id int identity(1,1) primary key,subject_name varchar(20),obtained_marks int,stu_id int foreign key(stu_id) references  students(stu_id))


insert into  marks values('Language2',80,2),('Maths',73,3),('Science',82,4),('S.Science',85,5)

create table studentdesc(Stu_id int identity(1,1) primary key, height float,weight int,foreign key(stu_id) references  students(stu_id))

insert into studentdesc values (5 ,65),(6 ,70),(5.5,68),(6.6 ,75),(5.8 ,74)
select * from marks
select * from students
select* from studentdesc
SELECT * FROM students

select * from (
select a.stu_id,a.student_name,A.standards,
b.obtained_marks,c.height, DENSE_RANK() over(order by b.obtained_marks desc,c.height desc) rank1 from students a 
join marks b on a.stu_id=b.stu_id 
join studentdesc c on b.stu_id=c.Stu_id  where a.standards='2nd'
)aa
where rank1=2  

with ranked_students as
(
 select a.stu_id,a.student_name,
b.obtained_marks,c.height, DENSE_RANK() over(order by b.obtained_marks desc,c.height desc) rank1 from students a 
join marks b on a.stu_id=b.stu_id
join studentdesc c on b.stu_id=c.Stu_id
)
select * from  ranked_students 
where rank1=2



select a.stu_id,b.height, DENSE_RANK() over(order by b.height desc) from students a join studentdesc b on a.stu_id=b.stu_id



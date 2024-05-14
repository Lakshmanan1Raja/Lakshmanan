select * from c1
select STRING_AGG(job,',') from emp

select STRING_AGG(job,';') from emp

create table str_agg
(id int,
name1 varchar(50))
insert into str_agg values(1,'sou,mm,ss,ff,hh,jh,tt,rr')

select * from str_agg

select string_split('sou,mm,ss,ff,hh,jh,tt,rr',',') as a1
---from str_agg

declare @name1 nvarchar(200)='sou,mm,ss,ff,hh,jh,tt,rr'
--select value from string_split(@name1,',');

declare @name2 nvarchar(200)
declare @id int
begin
select @id=id,@name2=name1 from str_agg
SELECT @id, value 
FROM  
      STRING_SPLIT(@name2, ',')
	  end

	  SELECT id, Name1, value  
FROM str_agg  
    CROSS APPLY STRING_SPLIT(name1, ',');

	select * from str_agg 
	where name1 in (select value from string_split(name1,','))



	ProductId	Name	Tags
1	Full-Finger Gloves	clothing,road,touring,bike
2	LL Headset	bike
3	HL Mountain Frame	bike,mountain

create table product_id (p_id int,name varchar(30),tags varchar(30))
insert into product_id values(1,'Full-Finger Gloves	','clothing,road,touring,bike')
insert into product_id values(2,'LL Headset	','bike')
insert into product_id values(3,'HL Mountain	','bike,mountain')

select * from product_id
SELECT P_Id, Name, value  
FROM product_id  
    CROSS APPLY STRING_SPLIT(Tags, ',');

select p_id,name,tags
from product_id
where 'clothing' in (select value from string_split(tags,','))

SELECT value as tag, COUNT(*) AS [number_of_articles]  
FROM product_id  
    CROSS APPLY STRING_SPLIT(Tags, ',')  
GROUP BY value  
HAVING COUNT(*) > 2  
ORDER BY COUNT(*) DESC;

SELECT p_id, Name, Tags  
FROM product_id  
WHERE EXISTS (SELECT *  
    FROM STRING_SPLIT(Tags, ',')  
    WHERE value IN ('mountain'));


	select REPLICATE(
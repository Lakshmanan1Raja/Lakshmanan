drop table if exists products1
go 
create table products1 (
pr_id int identity primary key,
product_name varchar(50) not null,
price money not null,
manufacturer varchar(100),
datecreated date )
 
 -- Displaying the inserted records
 --1.Insert a product into the products table if a product based on product name and manufactrer does not exists
 --2.If a products already exists based on productname and  manufactrer but price is different then update the price of existing record into sql table
 --3.If a products already exists based on productname and  manufactrer and price then do nothing. do not insert the duplicate record
 --4.return the row from sql server table for the given product


 drop procedure if exists sp_insertproducts 
 go
 create procedure sp_insertproducts (
 @product_name varchar(50),
 @price money,
 @manufacturer varchar(100),
 @datecreated datetime=null
 )
 as
 begin
    declare @prodcut_id int

	set @datecreated=GETDATE()

	if not exists (select 1 from products1 where product_name=@product_name and manufacturer=@manufacturer)
	begin
	insert into products1([product_name], [price], [manufacturer], [datecreated])
	values(@product_name,@price,@manufacturer,@datecreated)
	end
	else 
	if exists (select 1 from products1 where product_name=@product_name and manufacturer=@manufacturer and price=@price)
	begin
	print ('Product Already Exists.!')
	end 
	else
	if exists (select 1 from products1 where product_name=@product_name and manufacturer=@manufacturer and price!=@price)
	begin
	update products1
	set price=@price
	where product_name=@product_name and manufacturer=@manufacturer
	end

	set @prodcut_id= (select top 1 pr_id from products1 where product_name=@product_name and manufacturer=@manufacturer and price=@price)


	select [pr_id], [product_name], [price], [manufacturer], [datecreated] from [dbo].[products1] 
	where pr_id=@prodcut_id

	end



--- print weekdays --
with cteweekdays
as
(
select 1 as num,DATENAME(weekday,dateadd(day,1,getdate()))as weekdays
union all
select num+1,DATENAME(weekday,dateadd(day,num+1,GETDATE())) FROM cteweekdays
WHERE NUM<=6
)
SELECT NUM,WEEKDAYS FROM cteweekdays


--- PRINT MONTHS--

with cteMONTHS
as
(
select 1 as numb,DATENAME(MONTH,dateadd(month,0,0))as months
union all
select numb+1,DATENAME(month,dateadd(month,numb,0)) FROM ctemonths
WHERE NUMb<12
)
SELECT NUMb,months FROM ctemonths




	
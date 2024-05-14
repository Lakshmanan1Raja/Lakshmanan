-- procedure for top n selling products

alter procedure sp_topsellingproduct (@topn int)
as
begin 
  select top (@topn)  ed.Product,sum(ed.sales) as totalsalesamount,count(ed.Quantity) totalquantitysold
  from Ecommerce_Data ed
  group by ed.Product
  order by totalquantitysold desc
  end

  exec sp_topsellingproduct 10



-- procedure for salesby product category

alter procedure sp_salesbyproductcategory 
as
begin 
 select  ed.Product_Category,sum(ed.sales) as totalsales
 from Ecommerce_Data ed
 group by ed.Product_Category
 order by totalsales desc
 end

 exec sp_salesbyproductcategory 

 --- generate monthly sales report

 alter procedure sp_getmonthlysalesreport (@year int)
 as
 begin
  select   (@year)year, datename(MONTH,ed.Order_Date) as  month, sum(ed.Sales) totalsales
  from Ecommerce_Data ed
  where YEAR(Order_Date)=@year
  group by  datename(MONTH,ed.Order_Date)
 order by  totalsales desc
  end

  exec sp_getmonthlysalesreport 2022


  -- views for this project 

  select * from Ecommerce_Data

  alter view vw_orderdetails
  as
  select Order_ID,Customer_ID,Product,quantity,price,Sales
  from Ecommerce_Data

  select * from vw_orderdetails

  --  view for customer insights 
  alter view vw_customerinsights
  as
  select Customer_ID,Customer_Name,Product,Quantity,sum(sales)totalamount
  from Ecommerce_Data
  group by Customer_ID,Customer_Name,Product,Quantity

  select * from vw_customerinsights


-- reverse the string --

declare @input varchar(20)='POWER'
declare @len int = len(@input)
while @len>0
 begin 
   print LEFT(@input,@len)
   set @len=@len-1
   end


   DECLARE @OriginalString VARCHAR(100) = 'POWER';
DECLARE @ReversedString VARCHAR(100);

SELECT @ReversedString = REVERSE(@OriginalString);

SELECT @ReversedString AS ReversedString;


with cte_astric
as
(
select 1 as level
union all
select level+1 from cte_astric
where level<5
)
select REPLICATE('*',level) from cte_astric

select SUBSTRING('coffee',1,4) as string
select REPLACE('Coffee','e','s')
select STUFF('Coffee',1,2,'d')
select TRANSLATE('coffee','ee','ss')
select CHAR(65)
select CHARINDEX('e','coffee')

--

select Product,count(Quantity)totalquantity
from Ecommerce_Data
where CHARINDEX('tyre',Product)>0
group by Product








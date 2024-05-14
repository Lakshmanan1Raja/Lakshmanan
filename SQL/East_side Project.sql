

----   - Write an SQL query to calculate the total sales amount for a specific date range,
--such as a week or a month.

select Product_Category,sum(Sales) total_sales_amount from Ecommerce_Data
where Order_Date between '01-01-2022' and '01-31-2022'
group by Product_Category
order by Product_Category
      
--   - How would you retrieve sales data grouped by product categories for the current month?
select * from Ecommerce_Data

select YEAR(order_date)yearoforder ,datename(MONTH,Order_Date)
SALES_MONTH,sum(Sales)total_sales FROM Ecommerce_Data
group by YEAR(order_date),datename(MONTH,Order_Date)
order by datename(MONTH,Order_Date) asc
--write an SQL query to find the top 10 best-selling products by quantity sold in the last 7 days?

SELECT top 10 Product, count(Quantity) AS total_quantity_sold
FROM Ecommerce_Data
WHERE Order_Date >= DATEADD(DAY, -7, Order_Date) -- Filter for the last 7 days
GROUP BY Product
ORDER BY total_quantity_sold DESC
 
--- Write a query to calculate the percentage increase in sales from the previous month to the current month.

--- How can you fetch the purchase history for a specific customer, including the products they bought and the purchase dates?
select  ec.Order_Date,ec.Customer_ID,ec.Customer_Name,ec.Product,ec.Product_Category,ec.Sales,
ec.Discount,ec.Quantity,ec.Shipping_Date,ec.Ship_Mode,ec.Shipping_Cost
from Ecommerce_Data ec
where ec.Customer_ID='HY-00172'

create procedure sp_custpurchasehistory(@custid nvarchar(20))
as
begin 
  select  ec.Order_Date,ec.Customer_ID,ec.Customer_Name,ec.Product,ec.Product_Category,ec.Sales,
ec.Discount,ec.Quantity,ec.Shipping_Date,ec.Ship_Mode,ec.Shipping_Cost,DATEDIFF(day,ec.Order_Date,ec.Shipping_Date) as Days_Difference
from Ecommerce_Data ec
where ec.Customer_ID=@custid
end

exec sp_custpurchasehistory 'NI-001473'

--7. **Sales by Geographic Region:**
--   - Write an SQL query to display sales data broken down by geographic region (e.g., country, state, city).
select d.City,d.State,d.Country,SUM(Sales)total_sales_amount
from Ecommerce_Data d
group by d.City,d.State,d.Country
order by d.City,d.State,d.Country

--8. **Sales by Salesperson:**
--   - How would you retrieve the total sales achieved by each salesperson in the current year?
select s.Customer_Name,sum(s.Sales) total_sales
from Ecommerce_Data s
group by s.Customer_Name
--9. **Inventory Management:**
--   - Can you write a query to identify products with low inventory levels (e.g., less than 10 units in stock)?
select e.Product_Category,e.Product,e.Quantity
from Ecommerce_Data e
where e.Quantity<5

--10. **Customer Churn Analysis:**
--    - Write a query to determine the number of customers who made a purchase last month but havent made a purchase this month.
select * from Ecommerce_Data
update Ecommerce_Data
set Order_Date='2023-09-23',Shipping_Date='2023-09-30'
where Customer_ID='ON-002623'

select Order_Date,count(distinct Customer_ID)total_customers
from Ecommerce_Data
where MONTH(Order_Date)=MONTH(dateadd(month,-1,getdate())) 
and YEAR(Order_Date)=YEAR(dateadd(month,-1,GETDATE()))
and Customer_ID not in 
(  
     select distinct Customer_ID from Ecommerce_Data 
where MONTH(Order_Date)=MONTH(getdate())
and YEAR(Order_Date)=YEAR(getdate())
)
group by Order_Date


--13. **Sales by Channel:**
--    - Write an SQL query to compare sales performance across different sales channels (e.g., online, in-store, phone orders).
select Ship_Mode,SUM(Sales)totalsales,COUNT(distinct Order_ID)totalcount,round(AVG(Sales),1)averagesales
from Ecommerce_Data
group by Ship_Mode
order by Ship_Mode

--14. **Seasonal Sales Analysis:**
--    - Can you create a query to identify the best-selling products during the holiday season (e.g., December)?
select Product,count(order_id)order_count,sum(sales)sales_amount
from Ecommerce_Data
where DATENAME(month,Order_Date) ='December' 
 group by Product
 order by Product

 select product,sales from Ecommerce_Data where Product='apple laptop'
--8. **Stored Procedures:**
----   - Create a stored procedure that accepts a customer ID as a parameter and 
--returns the customer's order history.

SELECT * FROM Ecommerce_Data

ALTER PROCEDURE SP_CUSTOMER_DATA_HISTORY (@CUSTOMER_ID NVARCHAR(20))
AS
BEGIN
  SELECT Customer_Name,
  Order_ID,
  Product_Category,Product,Sales,
  Quantity,Discount,Order_Date,Shipping_Date,DATEDIFF(DAY,Order_Date,Shipping_Date) AS DAYSDIFFERENCE,
  Ship_Mode,Shipping_Cost	
  FROM Ecommerce_Data 
  WHERE Customer_ID=@CUSTOMER_ID
  END 
  EXEC SP_CUSTOMER_DATA_HISTORY 'HY-00172'



  with cte
  as
  (
  select 0 as number,DATEname(WEEKDAY,0)weekdays
  union all 
  select number+1,DATEname(WEEKDAY,number+1)as a
  from cte
  where number<6
  )
  select weekdays from cte 

  declare @inputstring nvarchar(100)='Jai Shree Raam'
  declare @i int=20
  while @i<=20
   begin 
       select LEFT(@inputstring,1)
	    declare @c int



  select dateadd(day,datediff(day,0,eomonth(getdate())),1)

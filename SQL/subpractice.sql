use TRANSACTIONS

create table tblproducts(P_id int PRIMARY KEY, name varchar(20),description varchar(50))
insert into tblproducts values(1,'TV','52 INCH BLACK COLOR  LCD TV'),(2,'LAPTOP','VERY THIN BLACK COLOR ACER LAPTOP'),
(3,'DESKTOP','HP HIGH PERFORMANCE DESKTOP')
 
CREATE TABLE PRODUCTSALES(S_ID INT PRIMARY KEY,P_ID INT,
UNIT_PRICE INT,
QUANTITY_SOLD INT
)

 INSERT INTO PRODUCTSALES (S_ID,P_ID,UNIT_PRICE,QUANTITY_SOLD)VALUES (1,3,450,5),(2,2,350,7),(3,3,450,4),(4,4,450,9)
 
 SELECT * FROM tblproducts
 SELECT * FROM PRODUCTSALES

 -- WRITE A QUERY TO RETRIEVE PRODUCTS  THAT ARE NOT  AT ALL SOLD

 SELECT P_ID,NAME,description
 FROM tblproducts 
 WHERE P_id NOT IN(SELECT DISTINCT P_ID FROM PRODUCTSALES )


create table citywise(from_city varchar(30),
to_city varchar(30),no_of_flights int)

insert into citywise values('Banglore','Chennai',6),('Chennai','Banglore',6),
('Banglore','Delhi',4),('Delhi','Banglore',4),('Banglore','Hydrabad',10),('Hydrabad','Banglore',10)

select * from citywise;


select  c1.from_city,c1.to_city, sum(c1.no_of_flights) tot_flights
from citywise c1 join citywise c2
on c1.no_of_flights=c2.no_of_flights
--and c1.from_city=c2.from_city
group by c1.from_city,c1.to_city

--- By using self join---
select  distinct least(c1.from_city,c1.to_city)departure,greatest(c1.from_city,c1.to_city)arrival,sum(c1.no_of_flights)totalflights
from citywise c1 join citywise c2
on c1.no_of_flights=c2.no_of_flights
group by c1.from_city,c1.to_city ;

--with cte--
   with cte as 
  (select least(from_city,to_city)as city1, greatest(from_city,to_city)as city2 
  ,no_of_flights
  from citywise 
)
  select city1,city2,sum(no_of_flights)tot_flight from cte 
  group by city1,city2

  --- Derived Query ---
  select a1,b1,sum(no_of_flights)flights from
(select LEAST(from_city,to_city) a1,GREATEST(from_city,to_city) b1,no_of_flights
from citywise 
) as a
group by a1,b1 


--- excercise---

select from_city,to_city,sum(no_of_flights)
from citywise
group by from_city,to_city 

select  c1.from_city,c1.to_city, sum(c1.no_of_flights) tot_flights
from citywise c1 join citywise c2
on c1.no_of_flights=c2.no_of_flights
group by c1.from_city,c1.to_city
having c1.from_city>greatest(c1.from_city) 

select greatest(6346,423,1) from citywise
 

 with cte as 
  (select greatest(from_city,to_city)as city1, least(from_city,to_city)as city2 
  ,no_of_flights
  from citywise 
)
  select city1,city2,sum(no_of_flights)tot_flight from cte 
  group by city1,city2



  select * from citywise

-- print 1 to 10 using cte---

with cte_num
as
(
select 1 as N
union all
select n+1
from cte_num
where n<150
)
select * from cte_num
option (maxrecursion 160)

-- print odd numbers using cte --

with cte_odd
as
(
select 1 as Number
union all
select number+2
from cte_odd
where number<20
)
select * from  cte_odd

--- print even numbers using cte --

with cte_even
as
(
select 2 as Num
union all
select num+2
from cte_even
where num<100
)
select * from cte_even
option(maxrecursion 100)

with cte_event
as
(
select 2 as Num1
union all
select num1+2
from cte_event
where Num1<150
)
select * from cte_event
option(maxrecursion 100)


DECLARE @counter INT = 1;
DECLARE @numbers TABLE (Number INT);

WHILE @counter <= 10
BEGIN
    INSERT INTO @numbers (Number)
    VALUES (@counter);

    SET @counter = @counter + 1;
END

SELECT Number
FROM @numbers;


declare @num int
set @num=1
while (@num<=10)
 begin
print ( @num)

set @num=@num+1
end



--- PRINT REPLICATE OF NUMBER---
--ASCENDING 1,22,333,4444---
--DECLARE @A INT = 1
--WHILE @A<=10
-- BEGIN 
--    DECLARE @B VARCHAR(100)=''
--	DECLARE @C INT=1

--WHILE @C<=@A
-- BEGIN 
--   SET @B=@B+CAST(@A AS varchar(20))
--   SET @C=@C+1
--   END
--   PRINT @B
--    SET @A=@A+1
--	END
--- DESCENDING 101010101,99999
--DECLARE @A INT = 10
--WHILE @A>=1
-- BEGIN 
--    DECLARE @B VARCHAR(100)=''
--	DECLARE @C INT=1

--WHILE @C<=@A
-- BEGIN 
--   SET @B=@B+CAST(@A AS varchar(20))
--   SET @C=@C+1
--   END
--   PRINT @B
--    SET @A=@A-1
--	END


--- 1,12,123,1234---
	DECLARE @A INT = 1
WHILE @A<=20
 BEGIN 
    DECLARE @B VARCHAR(100)=''
	DECLARE @C INT=1

WHILE @C<=@A
 BEGIN 
   SET @B=@B+CAST(@C AS varchar(20))
   SET @C=@C+1
   END
   PRINT @B
    SET @A=@A+1
	END
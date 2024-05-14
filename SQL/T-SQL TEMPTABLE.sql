------ temptable---- db-assignment--
--temp table its not tabke a memory space.it stored in tempdb.
--once the server got disconnected automatically the temptable will be deleted.

---- types--
---- local(#)
----global(##)
----local--
--it  works on the particular session
----global
--it works both different sessions and different scopes

create table #temptable(id int primary key,ename varchar(12) )
insert into #temptable values(1,'assd'),(2,'fad'),(3,'add'),(4,'4r2'),(5,'adsd'),(6,'cxz'),(7,'fs'),(8,'fsd'),(9,'fdd'),(10,'gff')


create table #tempt(t_id int references #temptable(id),ename varchar(12) )

--Skipping FOREIGN KEY constraint '#tempt' definition for temporary table. 
--FOREIGN KEY constraints are not enforced on local or global temporary tables.
--We can not apply foreign key on temp tables i.e constraints can not be applied on temp tables


select * into #tempt from empdup
select * from #temptable 


select NAME from SYSOBJECTS WHERE NAME LIKE '%#temptable%'


-- FULLY QUALIFIED TO CALL TABLE --
--SELECT * FROM DATABASE.SERVERNAME.TABLENAME


-- CLUSTER  AND NONCLUSTERED INDEX TEMP--
DROP TABLE #temp2
create table #temp2(id int ,ename varchar(12) )
insert into #temp2 values(1,'assd'),(2,'fad'),(3,'add'),(4,'4r2'),(5,'adsd'),(6,'cxz'),(7,'fs'),(8,'fsd'),(9,'fdd'),(10,'gff')

CREATE CLUSTERED INDEX CI_IDX_TEMP ON #TEMP2(ID)
CREATE NONCLUSTERED INDEX NCI_IDX ON #TEMP2(ID)

DROP INDEX CI_IDX_TEMP ON #TEMP2


SELECT NAME FROM SYSOBJECTS WHERE NAME LIKE '%#TEMP2%'

CREATE PROCEDURE SP_TEMP
AS
BEGIN
   SELECT * FROM #temp2
END

EXEC DBO.SP_TEMP

DELETE #TEMP2
SELECT * FROM #temp2
SELECT * FROM EMP
SELECT * INTO #T_EMP FROM emp
SELECT * FROM EMP
SELECT COALESCE(COMM,'3') FROM emp
SELECT ISNULL(COMM,'3')FROM EMP

--- TABLE VARIABLES---
ITS WORKS LIKES AN TEMPERARY TABLES

USE TRANSACTIONS
CREATE TABLE BANK(T_ID INT,TRANS_TYPE VARCHAR(10),AMOUNT FLOAT)
 INSERT INTO BANK VALUES(101,'CREDIT',120),(100,'DEBIT',20),(100,'CREDIT',100),(100,'CREDIT',50),(101,'CREDIT',50),(101,'DEBIT',20),(101,'CREDIT',30)

 SELECT * FROM BANK



 SELECT *,SUM(CASE 
     WHEN TRANS_TYPE='CREDIT' THEN AMOUNT
	 WHEN TRANS_TYPE='DEBIT' THEN AMOUNT*-1 END)
	 OVER (PARTITION BY T_ID ORDER BY T_ID ROWS BETWEEN UNBOUNDED PRECEDING  AND CURRENT ROW)AS BALANCE
	 FROM BANK
	 


	  SELECT *,SUM(CASE 
     WHEN TRANS_TYPE='CREDIT' THEN AMOUNT
	 WHEN TRANS_TYPE='DEBIT' THEN AMOUNT*-1 END)
	 OVER (PARTITION BY T_ID ORDER BY T_ID ROWS BETWEEN UNBOUNDED PRECEDING  AND CURRENT ROW)AS BALANCE
	 FROM BANK

SELECT T_ID,SUM(
      CASE
	         WHEN TRANS_TYPE='CREDIT' THEN AMOUNT 
			 ELSE  AMOUNT*-1 END AS TRANSACTIONS)
FROM BANK


SELECT T_ID,TRANS_TYPE,
    LAG(AMOUNT,1,0)OVER (PARTITION BY TRANS_TYPE ORDER BY AMOUNT DESC)AS CURRENT_BAL
	FROM BANK
WHERE TRANS_TYPE IN ('CREDIT','DEBIT')

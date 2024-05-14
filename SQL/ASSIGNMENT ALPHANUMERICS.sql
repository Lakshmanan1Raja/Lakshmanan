CREATE TABLE NAMEID(ID INT IDENTITY(1,1)NOT NULL,NAME VARCHAR(30) )
INSERT INTO NAMEID VALUES('1999@@#$%^^&AMITH'),('SOW70MYA'),('SHANKAR236'),('234SPIDER'),('23SUNIL97'),('RAHUL78')


SELECT
  ID,
  NAME,
  Alphabets = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(NAME,
      '0',''),'1',''),'2',''),'3',''),'4',''),'5',''),'6',''),'7',''),'8',''),'9',''),
  NUMERICS = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
  (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
  (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(NAME,
      'A',''),'B',''),'C',''),'D',''),'E',''),'F',''),'G',''),'H',''),'I',''),'J',''),'K',''),'L',''),'M',''),'N',''),'O',''),'P',''),'Q',''),'R',''),'S',''),'T',''),'Q',''),'R',''),
'S',''),'T',''),'U',''),'V',''),'W',''),'X',''),'Y',''),'Z','')
FROM
  NAMEID;


  CREATE FUNCTION SplitAlphabetsAndNumerics_MV()
RETURNS @ResultTable TABLE (
  ID INT,
  NAME VARCHAR(30),
  Alphabets VARCHAR(30),
  Numerics VARCHAR(30)
)
AS
BEGIN
  DECLARE @Counter INT = 1
  DECLARE @TotalRows INT = (SELECT COUNT(*) FROM NAMEID)

  DECLARE @ID INT
  DECLARE @NAME VARCHAR(30)
  DECLARE @Alphabets VARCHAR(30)
  DECLARE @Numerics VARCHAR(30)

  WHILE @Counter <= @TotalRows
  BEGIN
    SELECT @ID = ID, @NAME = NAME
    FROM (
      SELECT ID, NAME, ROW_NUMBER() OVER (ORDER BY ID) AS RowNumber
      FROM NAMEID
    ) AS T
    WHERE RowNumber = @Counter

    SET @Alphabets = ''
    SET @Numerics = ''

    DECLARE @Index INT = 1
    DECLARE @Length INT = LEN(@NAME)

    WHILE @Index <= @Length
    BEGIN
      DECLARE @Character CHAR(1) = SUBSTRING(@NAME, @Index, 1)
      DECLARE @AsciiValue INT = ASCII(@Character)

      IF @AsciiValue BETWEEN 65 AND 90 OR @AsciiValue BETWEEN 97 AND 122
        SET @Alphabets = @Alphabets + @Character
      ELSE IF @AsciiValue BETWEEN 48 AND 57
        SET @Numerics = @Numerics + @Character

      SET @Index = @Index + 1
    END

    INSERT INTO @ResultTable (ID, NAME, Alphabets, Numerics)
    VALUES (@ID, @NAME, @Alphabets, @Numerics)

    SET @Counter = @Counter + 1
  END

  RETURN
END


SELECT * FROM dbo.SplitAlphabetsAndNumerics_MV();

DROP FUNCTION dbo.AlphabetsAndNumericsSPECIAL_MV







CREATE FUNCTION dbo.AlphabetsAndNumericsSPECIAL_MV()
RETURNS @ResultTable TABLE (
  ID INT,
  NAME VARCHAR(30),
  Alphabets VARCHAR(30),
  Numerics VARCHAR(30),
  SPECIALCHARACTERS VARCHAR(30)
)
AS
BEGIN
  DECLARE @Counter INT = 1
  DECLARE @TotalRows INT = (SELECT COUNT(*) FROM NAMEID)

  DECLARE @ID INT
  DECLARE @NAME VARCHAR(30)
  DECLARE @Alphabets VARCHAR(30)
  DECLARE @Numerics VARCHAR(30)
  DECLARE @SPECIALCHARACTERS VARCHAR(40)

  WHILE @Counter <= @TotalRows
  BEGIN
    SELECT @ID = ID, @NAME = NAME
    FROM (
      SELECT ID, NAME, ROW_NUMBER() OVER (ORDER BY ID) AS RowNumber
      FROM NAMEID
    ) AS T
    WHERE RowNumber = @Counter

    SET @Alphabets = ''
    SET @Numerics = ''
	SET  @SPECIALCHARACTERS=''

    DECLARE @Index INT = 1
    DECLARE @Length INT = LEN(@NAME)

    WHILE @Index <= @Length
    BEGIN
      DECLARE @Character CHAR(1) = SUBSTRING(@NAME, @Index, 1)
      DECLARE @AsciiValue INT = ASCII(@Character)

      IF (@AsciiValue BETWEEN 65 AND 90) OR (@AsciiValue BETWEEN 97 AND 122)
      BEGIN
        SET @Alphabets = @Alphabets + @Character
      END
      ELSE IF @AsciiValue BETWEEN 48 AND 57
      BEGIN
        SET @Numerics = @Numerics + @Character
      END
	  ELSE 
	  BEGIN
	     SET @SPECIALCHARACTERS=@SPECIALCHARACTERS+@Character
		 END

      SET @Index = @Index + 1
    END

    INSERT INTO @ResultTable (ID, NAME, Alphabets, Numerics,SPECIALCHARACTERS)
    VALUES (@ID, @NAME, @Alphabets, @Numerics, @SPECIALCHARACTERS)

    SET @Counter = @Counter + 1
  END

  RETURN
END


SELECT * FROM dbo.AlphabetsAndNumericsSPECIAL_MV()


DECLARE @AlphabetsTable TABLE (ID INT, Alphabets VARCHAR(30))
DECLARE @NumericsTable TABLE (ID INT, Numerics VARCHAR(30))
DECLARE @SpecialCharactersTable TABLE (ID INT, SpecialCharacters VARCHAR(30))

INSERT INTO @AlphabetsTable (ID, Alphabets)
SELECT ID, Alphabets
FROM dbo.AlphabetsAndNumericsSPECIAL_MV();

INSERT INTO @NumericsTable (ID, Numerics)
SELECT ID, Numerics
FROM dbo.AlphabetsAndNumericsSPECIAL_MV();

INSERT INTO @SpecialCharactersTable (ID, SpecialCharacters)
SELECT ID, SPECIALCHARACTERS
FROM dbo.AlphabetsAndNumericsSPECIAL_MV();

SELECT * FROM @AlphabetsTable;
SELECT * FROM @NumericsTable;
SELECT * FROM @SpecialCharactersTable;

INSERT INTO NAMEID VALUES('898SUNKUMAR')




DECLARE @NAME_ID VARCHAR(20) ='1999AMITH'
WHILE PATINDEX('%[A-Z]%',@NAME_ID)>0
BEGIN 
    
	SET @NAME_ID=STUFF(@NAME_ID,PATINDEX('%[A-Z]%',@NAME_ID),1,'')
END
PRINT @NAME_ID

DECLARE @NAME_ID2 VARCHAR(20) ='1999AMITH'
WHILE PATINDEX('%[0-9]%',@NAME_ID2)>0
BEGIN 
    
	SET @NAME_ID2=STUFF(@NAME_ID2,PATINDEX('%[0-9]%',@NAME_ID2),1,'')
END
PRINT @NAME_ID2
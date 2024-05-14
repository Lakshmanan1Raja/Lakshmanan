--REPLICATE used to replicate string No. of times
select replicate('Sun',4)
select replicate('*',4)


 declare @email nvarchar(50)='sunilkumarsk07@gmail.com'
 select substring(@email,1,CHARINDEX('@',@email)-1)+replicate('*',4)+substring(@email,CHARINDEX('@',@email),len(@email));
 
 select stuff('lakshmanan96@gmail.com',4,5,'*****')
 select REPLACE('lakshmanan96@gmail.com','gmail','*****')
 select REPLACE('lakshmanan96@gmail.com','manan96','******')

 declare @email nvarchar(50)='sunilkumarsk07@gmail.com'
 select substring(@email,1,CHARINDEX('@',@email)-1)+replicate('*',4)+substring(@email,CHARINDEX('@',@email),len(@email)-CHARINDEX('@',@email)+1);
 declare @email varchar(40)='lakshmanan96@gmail.com'
 declare @accno bigint=00000111576144
 select substring(@accno,1,CHARINDEX('@',@accno)-1)+replicate('*',4)+substring(@email,CHARINDEX('@',@email),len(@email));


 
 --SPACE	returns no. of spaces- used to insert specified no.of spaces
 SPACE(number_of_spaces)

 SELECT 'Name:' + SPACE(5) + 'John' AS PaddedName;
-- Output: Name:     John

select '     '

select space(5)

select ename + space(5)+ cast(empno as varchar) from emp

select ename + space(5)+ cast(sal as varchar) from emp

--PATINDEX	
PATINDEX('%pattern%', expression)

declare @emailid nvarchar(50)='sunilkumarsk07@gmail.com'
select patindex('%.com',@emailid)

declare @email1 nvarchar(50)='sunilkumarsk07@gmail.com'
select patindex('%gmail%',@email1)

select patindex('%@%','sunilkumarsk07@gmail.com')

SELECT PATINDEX('%world%', 'Hello, world!') AS Position;

SELECT PATINDEX('%o_e%', 'Hello, world!') AS Position;
-- Output: 5 (matches 'o, w' within the expression)

--REPLACE()
REPLACE(input_string, old_substring, new_substring)

SELECT REPLACE('Hello, world!', 'world', 'universe') AS NewString;
-- Output: Hello, universe!
SELECT REPLACE('Hello, world! welcome to new world! World of Energy', 'world', 'universe') AS NewString;
--Hello, universe! welcome to new universe! universe of Energy

SELECT REPLACE('The quick brown fox jumps over the lazy dog.', 'brown ', '') AS NewString;
-- Output: The quick fox jumps over the lazy dog.

UPDATE demp
SET ename = REPLACE(ename, 'Miller', 'MILLER')
WHERE deptno = 20;

select * from demp

UPDATE products
SET description = REPLACE(description, 'old_text', 'new_text')
WHERE category = 'Electronics';
-- This query updates the product descriptions in the 'Electronics' category.

 declare @accno bigint=500101011018642
SELECT
    REPLACE(@accno, RIGHT(@accno, 5), '*****') AS MaskedAccountNumber
FROM
    accounts;
-- This query masks the last 4 digits of the account numbers.

declare @email2 nvarchar(50)='sunilkumarsk09@gmail.com'
SELECT
    REPLACE(@email2, RIGHT(@email2, 4), '****') AS MaskedEmail

	SELECT
    REPLACE(REPLACE(description, '<b>', ''), '</b>', '') AS SanitizedDescription
FROM
    user_posts;
-- This query removes <b> and </b> tags from post descriptions.

UPDATE
    website_links
SET
    link_url = REPLACE(link_url, 'old_domain.com', 'new_domain.com')
WHERE
    link_type = 'external';
-- This query updates URLs by replacing the old domain with the new domain for external links.

SELECT
    REPLACE(notes, CHAR(13) + CHAR(10), ' | ') AS FormattedNotes
FROM
    customer_orders;
-- This query replaces Windows-style line breaks with a pipe symbol for better readability.

--STUFF()
STUFF(input_string, start_position, length_to_replace, replacement_string)

select stuff('sunilkumarsk07@gmail.com',11,4,'******') as masked_mail

SELECT STUFF('Hello, world!', 8, 0, 'beautiful ') AS ModifiedString;
-- Output: Hello, beautiful world!

SELECT STUFF('This is a sample text.', 11, 6, 'example') AS ModifiedString;
-- Output: This is an example text.

SELECT STUFF('Remove these vowels', 8, 2, '') AS ModifiedString;
-- Output: Remove vowels

UPDATE products
SET product_name = STUFF(product_name, 1, 3, 'New')
WHERE product_id = 123;
-- This query updates the product name by replacing the first 3 characters with 'New'.

DECLARE @dynamic_sql NVARCHAR(MAX);
SET @dynamic_sql = STUFF('SELECT * FROM ', 14, 0, 'products WHERE category = ''Electronics''');
-- This creates a dynamic SQL query by inserting the WHERE clause into the base query.
EXEC sp_executesql @dynamic_sql;


Question 1: Explain the difference between the REPLACE() and STUFF() functions in SQL Server.

Answer: The REPLACE() function is used to replace all occurrences of a specified substring with another substring in a given string. 
It operates on the entire string and is primarily used for simple replacements. 
On the other hand, the STUFF() function is used to insert or replace a portion of a string at a specific position. 
It allows you to replace a certain number of characters with a new substring while maintaining the original length of the string.




















































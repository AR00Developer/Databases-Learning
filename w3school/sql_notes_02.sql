source : https://www.w3schools.com/ 
content : SQL standart 

/* 
SQL order by clause, used to sort the resulting set in descending order or ascending by using the 
acronyms >> ASC|DESC 

By default the sort it's made in ascending order. 

Multiple columns sorting can be made if some values has identical order priority for the first column the second column values 
are looked up to identify wich of those it's going to take priority.
*/ 

-- Sample of a order by clause (generic) 
SELECT  column1, column2 
FROM table_name 
ORDER BY column1, column2 ... ASC|DESC 

-- Sample of sorting by country values in ASCending order
SELECT * FROM table_name 
ORDER BY country; 

-- Sample of sorting by country values in DESCending order
SELECT * FROM table_name 
ORDER BY country DESC; 

-- Sample of sorting by multiple columns(country, customer_name)
SELECT * FROM table 
ORDER BY country ASC, customer_name DESC; 

/* 
INSERT INTO clause >> used to insert new records in a table. 
There are two ways to proceeds : When we are inserting values for all the columns (c1), when we are inserting values for some columns (c2) 

c1 >> Isn't required to specify all the columns names, matching up those of the value placeholder 
c2 >> Is required to specify in wich columns they are gonna be placed and also the order must be respected. 



Generally the primary key(identifier of each row in relation to other tables). It's auto-incremental, meaning this 
we don't need to specify it. It will be filled automatically. 

*/ 


-- Sample of a insertion with some columns choosed 
INSERT INTO table_name (column1, column2, column3, ...) 
VALUES (value1, value2, value3, ...); 

-- Sample of a insertion with values for all the columns of the table 
INSERT INTO table_name 
VALUES (value1, value2, value3, ...); 

-- Sample with an insertion of multiple columns with values. 
INSERT INTO customers(customer_name, contact_name, address, city, postal_code, country) 
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'); 

-- Sample with specified columns 
INSERT INTO customers(customer_name, city, country) 
VALUES('Cardinal','Stavanger', 'Norway'); 


/* 
Null value >> Represents a blanck saved space, it doesn't have similarity with any other value, even nulls. 

If a field in a table is optional, it is possible to insert a new record or update a record without adding a value to this field. 
In this case a NULL value it will be saved in the field. 


As we can't compare NULL against NULL with operators as (=, <, >, <> ) we use as a comparison help (IS NULL, IS NOT NULL) clauses. 

IS NULL >> In where clauses it's used to retrieves values indetifying empty fields in a row 
IS NOT NULL >> In where clauses it's used to retrieve values identifying non-empty fields in a row. 

*/ 

-- Sample with IS NULL comparison 
SELECT column_names 
FROM table_name 
WHERE column_name IS NULL; 

-- Sample witth IS NOT NULL comparison 
SELECT columns_names 
FROM table_name 
WHERE column_name IS NOT NULL; 

/*
	## UPDATE clause >> It's use to update values in records from a table 
*/

-- Sample of a UPDATE clause
UPDATE table_name 
SET column1 = value1, column2 = value2 
WHERE condition ;    -- Be carefull, an always remember the condition here.

-- Sample of a UPDATE implemented  , multiple values setted in multiple columns 
UPDATE customers 
SET contact_name = 'Alfred Schmidt', city = 'Frankfurt' 
WHERE customer_id = 1; 

-- Sample of a UPATE implemented, values setted in a column 
UPDATE customers 
SET contact_name = 'Juan' 
WHERE counstry = 'Mexico'; 

-- A BAD EXAMPLE | CLAUSE WHERE FORGOTTEN it will cause all the values of the columns be setted to the same value. 
UPDATE customers 
SET contact_name = 'Alfred Schmidt'; 



/* 
	## DELETE clause >> It's used to delete values in records from a table 
	Here too, remember to restrict the values affected by using WHERE. 
*/ 
-- Sample of a DELETE clause (Generic)
DELETE FROM table_name 
WHERE condition ;

-- Sample of a DELETE clause (Implemented) 
DELETE FROM customers 
WHERE customer_name = 'Alfreds Futterkiste'; 

-- Sample of a DELETE deleting all the values from a table(Generic) 
DELETE FROM table_name ; 

-- Sample of a DELETE deleting all the values from a table (Implemented) 
DELETE * FROM customers; 


/* 
SELECT TOP clause >> It syntax differs between some systems. But the idea it's to retricti the resulting set as a whole 
in a quantity of row determined. 

example : Our result set out of the condition metted are 20  by using this kind of restriction (SELECT TOP) we will make another 
restricion above those 20 results 

SELECT TOP by technologiy : 
Oracle 	   >> ROWNUM 
MySQL  	   >> LIMIT 
MS Access  >> SELECT TOP 
SQL Server >> SELECT TOP

MS Access/SQL Server share the same stack behind scenes that's why they implement the same OPERATORS. 

*/ 

-- Sample of a TOP restriction in SQL Server/MS Access Syntax 
SELECT TOP number| percent column_names 
FROM table_name 
WHERE condition; 

-- Sample of a LIMIT restriction in a MySQL Syntax: 
SELECT column_name 
FROM table_name 
WHERE condition 
LIMIT number; 

-- Sample of a rownum restriction in a ORACLE syntax: 
SELECT column_names 
FROM table_name 
WHERE condition 
WHERE ROWNUM <= number; 

-- Sample of a SELECT TOP restriction implementes in SQL Server/MS Access 
SELECT TOP 3 * customers; 

-- Sample of a LIMIT restriction implemented in a MYSQL syntax 
SELECT * FROM customers 
LIMIT 3; 

-- Sample of a ROWNUM resctrition in ORACLE syntax .
SELECT * FROM customers 
WHERE ROWNUM <= 3;

 -- Sample of a SELECT TOP of  'SQL Server/MS Access'  with a where clause include 
SELECT TOP 3 * FROM customers 
WHERE country = 'Germany' ; 

-- Sample of a LIMIT of 'MySQL' with where clause include 
SELECT * FROM customers 
WHERE country = 'Germany'; 

-- Sample of a ROWNUM of Oracle with where clause include 
SELECT * FROM customers 
WHERE country = 'Germany' AND ROWNUM <= 3; 



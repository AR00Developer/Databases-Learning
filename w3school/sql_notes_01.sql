Content : SQL General syntax 
Source  : https://www.w3schools.com/sql/default.asp

/* 
SQL is a standard language for storing, manipulating and retrieving data in databases. 
Standard "language" it can be used in : MySQL, SQL Server, MS Access, Oracle, Sybase, Informix, Postgress, etc.

SQL >> Structured Query Language. 
SQL >> Lets us access and manipulate databases. 

What can it does : 
 - Execute queries agains a database. 
 - Retrieve data from a database. 
 - Insert records in a database. 
 - Update records in a databases. 
 - Delete records in a database. 
 - Create new databases, tables, views, procedures (objets), etc.
 
 Most of the SQL databases program also have their own propietary addition to the SQL standard. 
 
SQL query are performed against RDBMS (Relational Database Managment System) 

RDBMS stored data in objects called tables. A table is a collection of related data entried and it consists of columns and rows. 
Every table is broken up into smaller entities called fields. 
	A Record,also called a row, is each individual entry that exists in a table. 
	Columns >> Vertical 
	Row >> Horizonta 
	
	Graphic Ilustration : 
		| Column1 | Column2 | Column3
		|---------|---------|--------
	row1| Column1 | Column2 | Column3
	row2| Column1 | Column2 | Column3
	row3| Column1 | Column2 | Column3
	row4| Column1 | Column2 | Column3
	
	## SQL keywords are not case sensitive. 
	-- Some database systems require a semicolon at the end of each SQL statement. 
	
	Some of the most use SQL clauses : 
	SELECT  >> Extracts data from  a database 
	UPDATE  >> Update data in a database 
	DELETE  >> Deletes data from a database 
	INSERT INTO   >> Inserts new data into a database 
	
	CREATE DATABASE >> Creates a new database 
	ALTER DATABASE  >> Modifies a database 
	CREATE TABLE  >> Creates a table 
	ALTER TABLE   >> Modifies a table 
	DROP TABLE    >> Deletes a table 
	CREATE INDEX  >> Creates an index (search key) 
	DROP INDEX    >> Deletes an index
	
	Generally the same command can be implemented on other object as : CREATE, ALTER, DROP . 
	E.G 
	CREATE index, CREATE table. 
	DROP table, DROP index, DROP view, etc. 
	
*/ 


-- Sample of a SELECT clause selecting all 
SELECT * FROM customers;

-- Sample of a SELECT clause selecting values from column1
SELECT column1 FROM customers;

-- Sample of SELECT clause selecting multiple columns values 
SELECT column1, column2, column2 FROM customers; 

/* 
SELECT distinct statement is used to return only distinct(different) values from a set of values 
*/ 

-- Sample of  a select extracting distinct values from multiple columns 
SELECT DISTINCT column1, column2, column3 
FROM table_name; 

-- Sample of a SELECT extracting values from a column, duplicates includes 
SELECT column1 FROM table_name; 

-- Sample counting distinct values from a table 
SELECT COUNT(DISTINCT column1) FROM table_name; 

-- MS Access sample of the example before due to a incompatibility 
SELECT COUNT(*) AS distinct_countries 
FROM (SELECT DISTINCT country FROM customers);



/* 

WHERE clause >> Use to filter records from a set of values 
This caluse is used to extract only those records that fulfill a specified condition 

!!!! REMEMBER : always use WHERE in update, delete statements !!!!
*/ 

-- Sample of a WHERE  implementation general 
SELECT column1, column2, ... 
FROM table_name 
WHERE condition; 

-- Sample of a WHERE clause filtering by country (String literals)
SELECT * FROM customers 
WHERE country = 'Mexico'; 

-- Sample of a WHERE clause filtering by country (numeric values)
SELECT * FROM customers 
WHERE customer_id = 1; 

/* 
	Operators accepted by where clause : ( = , > , <, >=, <= , <>, BETWEEN, LIKE, IN ) 
	The WHERE clause can be combined with AND, OR, and NOT operators 
	
	Required attributes For AND, OR, NOT and result in boolean  true. 
	---------------------
	|true|AND|true |true|
	|true|OR |false|true| 
	|false|NOT|----|true| 
	--------------------
	
AND >> Required both side condition to be true in order to result in true. 
OR  >> Required just one side condition to result in true. 
NOT >> Required the precedent condition to be false in order to result in true. 

: They are called logi operator they "truthy" relationship can be understood by following the logic of their states (v:true, f:false) 

AND >> v AND v = true, v AND f = false, f AND f = false. 
OR  >> v OR f  = true, f OR  v = true , f AND f = false.
NOT >> NOT v  = false, NOT f = true . 
	
AND, OR require condition at both side thus are called binary logic operators, while NOT just require one so it's called unary logic operator.
	
*/

-- Sample with AND operator in a WHERE (Generic)
SELECT column1, column2 
FROM table_name 
WHERE condition1 AND condition2; 

-- Sample with an OR operator in a WHERE clause  (Generic)
SELECT column1, column2 
FROM table_name 
WHERE condition1 OR condition2;

-- Sample with a NOT operator in a WHERE clause (Generic) 
SELECT column1, column2 
FROM table_name 
WHERE NOT condition; 

-- Sample with AND operator in a WHERE (implemented)
SELECT name, address 
FROM city 
WHERE last_name ='Jhonson' AND age = 20;

-- Sample with OR  operator in a WHERE (implemented)
SELECT name, address 
FROM table_name 
WHERE last_name = 'Jhonson' OR street = 'Abbey Road'

-- Sample with NOT operator in a WHERE (implemented)
SELECT name, address 
FROM table_name 
WHERE first_name NOT 'Jhonson'; 


/* By using parenthesis we can play a lot with precedence and 
generates lots of useful sequence of statements to extract and filter data*/ 

-- Sample combining AND and OR operators 
SELECT * FROM customers 
WHERE country='Germany' AND (city='Berlin' OR city='München'); 

-- Sample combining AND and NOT operators 
SELECT * FROM customers 
WHERE not country = 'Germany' AND NOT = 'USA'; 









































































































































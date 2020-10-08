
/* 
Stored procedure  is a prepared SQL code, that executes some task and can be soved in order
to be invokes and executed as required 

*/

-- Sample of Store Procedure 
CREATE PROCEDURE procedure_name 
AD 
	sql_statement; 
GO; 

-- Sample of execution of the before procedure 
EXEC procedure_name; 

-- Sample of a procedure with a query within 
CREATE PROCEDURE select_all_customers 
AS 
	SELECT * FROM customers; 
GO; 

-- Sample of execution previous procedure 
EXEC select_all_customers; 

-- Sample of a procedure with a parameter 
CREATE PROCEDURE select_all_customers @city nvarchar(30) 
AS 
	SELECT * FROM customers WHERE city = @city 
GO;

-- Sample of execution previous procedure with args 
EXEC select_all_customers @city = 'Country_name'; 

-- Sample of a procedure with a parameter | 02 
CREATE PROCEDURE select_all_customers @street nvarchar(30) 
AS 
	SELECT address FROM country WHERE country_name LIKE '%lost_paradise%';
GO; 

-- Sample of  a procedure with multiple args 
CREATE PROCEDURE  select_all_customers @city nvarchar(30), @postal_code nvarchar(10) 
AS 
	SELECT * FROM customers WHILE city = @city AND postal_code = @postal_code
GOM 

-- Sample of execution previous procedure with multiple args 
EXEC select_all_customers @city = 'some_country', @postal_code = 'some_post_code'; 

/* 
About the next topic "Comments" 
Just I will not make samples about it, but for you know 

/* 
	Multiline 
	Comments 
	syntax 
*/ 
-- Single line sintax of comments 

that's all that you need, even betters some ideas let you make some configuration with shortcuts to select blocks of code
and comment automatically with thos shortcut blocks of code selected, really a useful things. Do some research on it.
*/



/*

DDL sentences are used to define objects from the DB, and also to manipulate them (CREATE, DROP, ALTER) 
https://en.wikipedia.org/wiki/Data_definition_language 

Some objects example : 
VIEW 
TABLE 
SYNONYM 
INDEX 
etx .

Some query that are use genericly with them 
DROP   'x' >> Where 'x' it's an object and we need to deleted it. 
CREATE 'x' >> Where 'x' it's an object and we need to created it. 
ALTER  'x' >> Where 'x' it's an object and we need to modify it.

 When creaing tables we can use sub-queries in order to dump data from existing table into the new one. 
 
 ALTER TABLE 'x' statement is used to add, delete, or modify in an existing table. 
 
*/ 

-- Sample of a Create database query 
 CREATE DATABASE databasename; 
 
-- In order to show the existen ones 
 SHOW DATBASES; 
 
-- Sample of a database being deleted
DROP DATABASE databasename; 

-- Sample of a Backup database query (generic)
BACKUP DATABASE database_name 
TO DISK = 'file_path'; 

-- Sample of a Backup database query (implemented) 
BACKUP DATABASE test_db
TO DISK = 'D:\backups\test_db.bak'; 

-- Sample of a Backup of the last changes (generic)
BACKUP DATABASE database_name 
TO DISK = 'filepath' 
WITH DIFFERENTIAL; 

-- Sample of a Backup of a database query 
BACKUP DATABASE test_db 
TO DISK = 'D:\backups\test_db.bak' 
WITH DIFFERENTIAL; 

-- Sample of a create table object with columns (generic) 
CREATE TABLE table_name ( 
	column1 datatype,
	column2 datatype,
	column3 datatype, 
	...
);

-- Sample of a create table object with columns (implemented) 
CREATE TABLE persons ( 
	person_id int, 
	last_name  varchar(255), 
	first_name varchar(255), 
	address    varchar(255),
	city       varchar(255)
);

-- Sample of a create table with dumping by sub-query (generic) 
CREATE TABLE new_table AS 
	SELECET column1, column2, ..
	FROM existing_table_name 
	WHERE condition;

-- Sample of a create table with dumping by sub-query (implemented) 
CREATE TABLE test_table AS 
	SELECT customer_name, contact_name 
	FROM customers; 

-- Sample of dropping a table 
DROP TABLE tablename; 

--  Sample of dropping a table | 02 
DROP TABLE shippers; 

-- Sample of truncating a table 
TRUNCATE TABLE table_name; 

-- Sample of a alter a table adding a column 
ALTER TABLE table_name 
ADD column_name datatype; 

-- Sample of alter a table | 02 
ALTER TABLE customers 
ADD email varchar(244) 

-- Sample of dropping a column 
ALTER TABLE table_name 
DROP COLUMN column_name; 

-- Sample of dropping a column | 02 
ALTER TABLE customers 
DROP COLUMN email; 

-- Sample of ALTER a table SQL Server/ MS Access 
ALTER TABLE table_name 
ALTER COLUMN column_name datatype; 

-- Sample of ALTER a table MySQL/ Oracle < 10g 
ALTER TABLE table_name 
MODIFY COLUMN column_name datatype; 

-- Sample of alter table Oracle > 10g 
ALTER TABLE table_name 
MODIFY column_name datatype; 

-- Sample of adding a column | 03 
ALTER TABLE persons 
ADD data_of_birth date; 

-- Sample of modifying a table 
ALTER TABLE persons 
ALTER column date_of_birth year; 

-- Sample of dropping a column 
ALTER TABLE persons 
DROP column date_of_birth; 


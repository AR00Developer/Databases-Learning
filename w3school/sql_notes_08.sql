/* 
Default Constraint >> Works as a default value for a column 
 It can be used in conjunction with function that extract information from the SO. 
*/

-- Sample SQL DEFAULT / MySQL / SQL Server / Oracle / MS Access 
CREATE TABLE persons ( 
	id 			int	NOT NULL, 
	lastname   varchar(255) NOT NULL, 
	firstname  varchar(255), 
	age int, 
	city varchar(255) DEFAULT 'sandness'
);

-- Sample SQL Default with functions 
CREATE TABLE orders ( 
	id int NOT NULL,
	ordernumber int NOT NULL,
	orderdate date DEFAULT GETDATE()
);

-- Sample of DEFAULT with alter table / MySQL/ 
ALTER TABLE persons 
ALTER city SET DEFAULT 'sandness'; 

-- Sample of DEFAULT with alter table SQL Server 
ALTER TABLE persons 
ADD CONSTRAINT df_city 
DEFAULT 'sandness' FOR city; 

-- Sample of DEFAULT with alter table MS Access 
ALTER TABLE persons 
ALTER COLUMN city SET DEFAULT 'sandness'; 

-- Sample of DEFAULT with alter table Oracle 
ALTER TABLE persons 
MODIFY city DEFAULT 'sandness'; 

-- Sample of DEFAULT with alter table MySQL 
ALTER TABLE persons 
ALTER cuty DROP DEFAULT; 

-- Sample of DEFAULT with alter table SQL Server / Oracle / MS Access 
ALTER TABLE persons 
ALTER COLUMN city DROP DEFAULT; 

/* 
INDEX >> Used to retrieve data from the database more quickly than otherwise. The users cannot see the indexes, they 
are just used to speed up searches/queries. 

Note : Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). 

Suggestion >> Only create indexes on columns that will be frequently searched against
*/ 

-- Sample of CREATE INDEX 
CREATE INDEX index_name 
ON table_name (column1, column2, ...); 

-- Sample of CREATE UNIQUE INDEX 
CREATE UNIQUE INDEX index_name 
ON table_name (column1, column2, ... ); 

-- Sample of creating an index above a column 
CREATE INDEX idx_lastname 
ON persons (lastname); 

-- Sample of creating an index composed of two columns
CREATE INDEX idx_pname 
ON persons (lastname, firstname); 

-- Sample of DROP INDEX > MS Access 
DROP INDEX index_name ON table_name; 

-- Sample of DROP INDEX >> SQL Server 
DROP INDEX table_name.index_name; 

-- Sample of DROP INDEX >> DB2 / Oracle 
DROP INDEX index_name; 

-- Sample of DROP INDEX by using ALTER >> MySQL 
ALTER TABLE table_name 
DROP INDEX index_name; 

/* 
AUTO-INCREMENT : allows a unique number to be generated automatically when a new record is 
inserted into a table. (Usually for PK) 

Usually by default the increment value it's : 1. 
  Also we could create a sequence (generator of number by  a pattern) an use it as value for the AUTO_INCREMENT 
  

*/ 

-- Sample of auto increment 
CREATE TABLE persons (
	personid int NOT NULL AUTO_INCREMENT, 
	lastname  varchar(255) NOT NULL, 
	firstname varchar(255), 
	age int, 
	PRIMERY KEY (personid)
);

-- Sample of AUTO_INCREMENT by using alter table 
ALTER TABLE persons auto_increment = 100; 

-- Sample for IDENTITY (AUTO-INCREMENT) for SQL Server 
CREATE TABLE persons( 
	personid  int IDENTITY(1,1) PRIMARY KEY, 
	lastname  varchar(255) NOT NULL,
	firstname varchar(255), 
	age int
);


-- Sample of AUTO-INCREMENT for MS Access 
CREATE TABLE persons ( 
	personid 	AUTOINCREMENT PRIMARY KEY, 
	lastname 	VARCHAR(255) NOT NULL, 
	firstname 	VARCHAR(255), 
	age int
);



/* 
In Oracle in order to imitate the same functionality 
We need to use a sequence .  

And invokate it in each insertion. 
*/
-- Samplw of a SEQUENCE for ORACLE 
CREATE SEQUENCE seq_person 
MINVALUE 1 
START WITH 1 
INCREMENT BY 1 
CACHE 10; 

-- Insertion with a sequence being invocated it 
INSERT INTO persons (personid, firstname, lastname) 
VALUES (seq_person.nextval, 'Lars', 'Monsen' ); 


/* 
SQL DATES : I won't dive too much into this due to a the incompatibility on different format between each provider . 

But Basically : Data it's used to being representated by usin 'MASK' , mask are descriptions of the format we want for the values 
pass as arguments for the most usual functions representing DATE, DATE with TIME ( HOUR; MINUTE, MILISECOND, TIMELINE ZONE ) and so on . 

Usually each value follow some pattern : 
YYYY : 1999   >> YYYY --> Represents Year and can be also 'YY' for 20th century 
DD : 02       >> DD   --> Represents Day and can be represented as string of 3 chars usually as a t representative 
MM : 08       >> MM   --> Represents Month and can be represented as string of 3 chars usually as a shortname representative 


Some Masks  : 
YYYY-MM-DD 
YYYY-MON-DD
YY-MM-DD     
YYYY/MM/DD 
YYYY/MON/DD
YY/MM/DD   

And some Functions : 
TO_DATE('date_example', 'MASK');
TO_DATE('1999/09/04', 'YYYY/MON/DD');

*/ 

/* 
VIEW >> Are virtual tables based on the result-set of an SQL statement. 
The fields in a view are fields from one or more real tables in the database. 

The view are keep up-to-date due to a the database engine recreated the data, using the view's SQL Statement,
 every time a user queries a view.  

*/ 

-- Sample of Creating a view (generic) 
CREATE VIEW view_name as 
SELECT column1, column2, ... 
FROM table_name 
WHERE condition; 

-- Sample of creating a view 
CREATE VIEW [Brazil Customers] AS 
SELECT customer_name, contact_name 
FROM customers 
WHERE country = 'brazil'; 

-- Sample of invocating the view by its name 
SELECT * FROM [Brazil Customers];

-- Sample of a view with WHERE conditions applied 
CREATE VIEW [Products above average price] AS 
SELECT product_name, price 
FROM products 
WHERE price > (SELECT AVG(price) FROM products); 

-- Sample invocating the previous view 
SELECT * FROM [Products above average price];

-- Sample of creating a view 
CREATE OR REPLACE VIEW view_name AS (generic)
SELECT column1, column2, ...
FROM table_name 
FROM table_name 
WHERE condition; 

-- Sample of creating a view (implemented)
CREATE OR REPLACE VIEW [Brazil Customers] AS 
SELECT customer_name, contact_name, city 
FROM customers 
WHERE country = 'Brazil'; 

-- Sample DROPPING a view. (generic)  
DROP VIEW view_name;

/* 

SQL Injection >> Makes reference to a technique where malicious user, are capable of obtain information from the db without consent due to an 
unsanitize input. This allos them to execute arbitrarious code on the DB , by first checking if the 'attack' breaks the existent format of the site, and if a 
detection of error it's found, they begun to execute query by injecting them in parameters by 'GET HTPP method'. 

HOSTING    >> The information refers to the engine use to run the DB, presented on the README file of the repo 

DATA TYPES >> It just a reference to the different types of data available for each engine, per version all of that change as per technology, so it doesn't make
sense use that information, while working whit any of these technologies you're going to get the knowing of wich are avaible for your version and the 
different way to optimize your queries. 

As a data Oracle above the 10g Version I think it's let us create new data types, so to make an idea of the difference of data types and engine 
*/

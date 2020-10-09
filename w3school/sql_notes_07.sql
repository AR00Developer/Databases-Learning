/* 
CONSTRAINTS : Used to specify rules for the data in a table. 
Limtit the type of data that can go into a tablle. This ensures the accuracy and reliability of the data in the table. 
If there is any violiation between the constrain and the data action, the action is aborder. 

Constrant can ba column level or  tablle level. 

Commonly used: 
NOT NULL >> Ensure that a column cannot have a NULL value. 
UNIQUE   >> Ensures that all values in a column are different.
PRIMARY KEY >> A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table.
FOREIGN KEY >> Uniquely identifies a row/record in a table to be used by other table to JOIN.
CHECK    >> Ensure that all values in  a a column satisfies a specific condition.
DEFAULT  >> Sets a default value for a column when no value is specified.
INDEX    >> Used to create and retrieve data from the database very quickly.

There are two ways to add them . 
 First when we are creating the table and the second by using the ALTER clause in order to modify an existing table. 
 
CHECK >> Use to specify range, to be accepted when setting values.
 
 */ 
 
-- Sample of a NOT NULL on CREATE TABLE 
CREATE TABLE persons ( 
	id int NOT NULL, 
	last_name  varchar(255) NOT NULL, 
	first_name varcharr(255) NOT NULL, 
	age int 
); 

-- Sample of an ALTER clause to add the constraint 
ALTER TABLE persons 
MODIFY age int NOT NULL; 

-- Sample of UNIQUE constraint SQL Server / Oracle / MS Access 
CREATE TABLE persons ( 
	id int NOT NULL UNIQUE, 
	last_name   varchar(255) NOT NULL, 
	first_name  varchar(255), 
	age int
);

-- Sample of UNIQUE cn MySQL 
CREATE TABLE persons ( 
	id int NO NULL, 
	last_name    varchar(255) NOT NULL, 
	first_name   varchar(255), 
	age int, 
	UNIQUE (ID) 
);

-- Sample of a UNIQUE cn as last rule MySQL / SQL Server / Oracle / MS Access 
CREATE TABLE persons ( 
	id int  NOT NULL,
	last_name   varchar(255) NOT NULL, 
	first_name  varchar(255), 
	age int 
	CONSTRIANT UC_PERSON UNIQUE (id, last_name)
);

-- Sample of adding a constraint to an existent table 
ALTER TABLE persons 
ADD unique (id); 

-- Sample of adding a constrant to a table MySQL / SQL Server / Oracle / MS Acces
ALTER TABLE persons 
ADD CONSTRAINT UC_PERSON UNIQUE (id, last_name); 

-- Sample of dropping a constraint MySQL 
ALTER TABLE persons 
DROP INDEX UC_PERSON; 

-- Sample of dropping a constrain SQL Server / Oracle / MS Access 
ALTER TABLE persons 
DROP CONSTRAINT uc_person; 

-- Sample of Adding PK on ID column MySQL 
CREATE TABLE persons ( 
	id int NOT NULL, 
	last_name  varchar(255) NOT NULL; 
	first_name varchar(255), 
	age int, 
	PRIMERY KEY (id)
);

-- Sample of adding PK on ID column  SQL Server / Oracle/ MS Access 
CREATE TABLE persons ( 
	id int NOT NULL PRIMARY KEY, 
	last_name   varchar(255) NOT NULL, 
	first_name  varchar(255),
	age into
	
);

-- Sample of adding PK add last rule MySQL / SQL Server / Oracle / MS Access 
CREATE TABLE persons ( 
	id int NOT NULL, 
	last_name   varchar(255) NOT NULL, 
	first_name  varchar(255), 
	age int,
	CONSTRAINT PK_PERSON PRIMARY KEY (id, last_name)
);

-- Sample of adding pk by usin ALTER MySQL / SQL Server / Oracle / MS Access 
ALTER TABLE persons 
ADD PRIMERY KEY (id); 

-- Sample of adding  a composed PK MySQL / SQL Server / Oracle / MS Access 
ALTER TABLE persons 
ADD CONSTRAINT pk_person PRIMARY KEY (id, last_name); 

-- Sample of dropping a PK constraint MySQL 
ALTER TABLE persons 
DROP PRIMARY KEY; 

-- Sample of dropping a PK constraint SQL Server / Oracle / MS Access 
ALTER TABLE persons 
DROP CONSTRAINT pk_person; 

-- Sample of a Foreign key ad  at the definition of  a Table MySQL 
CREATE TABLE orders ( 
	order_id NOT NULL, 
	order_number int NOT NULL, 
	person_id int, 
	PRIMARY KEY (order_id), 
	FOREIGN KEY (person_id) REFERENCES persons(person_id) 
);

-- Sample of a Foreign key ad  at the definition of  a Table SQL Server / Oracle / MS Access
CREATE TABLE orders ( 
	order_id int NOT NULL PRIMARY KEY, 
	order_number int NOT NULL, 
	person_id int FOREIGN KEY REFERENCES persons(person_id)
);


-- Sample adding Foreign Key as a reference MySQL  / SQL Server / Oracle / MS Access 
CREARE TABLE orders ( 
	order_id NOT NULL, 
	order_number int NOT NULL, 
	person_id int, 
	PRIMARY KEY (order_id), 
	CONSTRAINT FK_person_order FOREIGN KEY (person_id) 
	REFERENCES persons (person_id)
);


-- Sample of adding a foreign key after an ALTER with its reference.
ALTER TABLE orders 
ADD FOREIGN KEY (person_id) REFERENCES persons(person_id);

-- Sample of adding a foreign key after an ALTER with its reference with naming 
ALTER TABLE orders 
ADD CONSTRAINT FK_person_order 
FOREIGN KEY (person_id) REFERENCES persons(person_id); 

-- Sample of Dropping a FG MySQL 
ALTER TABLE orders 
DROP FOREIGN KEY FK_person_order; 

-- Sample of Dropping a FG SQL Server / Oracle / MS Access 
ALTER TABLE orders 
DROP CONSTRAINT FK_person_order; 


-- Sample of adding CHECK MySQL 
CREATE TABLE persons ( 
	id	int NOT NULL, 
	last_name   varchar(255) NOT NULL; 
	first_name  varchar(255), 
	age int, 
	CHECK (age >= 18);
);

-- Sample of adding CHECK >> SQL Server / Oracle / MS Access 
CREATE TABLE persons ( 
	id int NOT NULL, 
	last_name   varchar(255) NOT NULL, 
	first_name  varchar(255), 
	age int CHECK( age >= 18)
);

-- Sample of adding CHECK >> by using ALTER 
ALTER TABLE persons 
ADD CHECK ( age >= 18); 

--- Sample of deleting CHECK >> by using ALTER TABLE  given
ALTER TABLE persons 
DROP CONSTRAINT chk_personage;



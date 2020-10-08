
/* 
SQL Between operator 
Between operator >> Its functionality it's to restrcit values from a set, given a range where they'll be admited it. 
*/ 

-- Sample of BETWEEN clause (generic) 
SELECT column_name 
FROM table_name 
WHERE column_name BETWEEN value1 AND value2; 

-- Sample of BETWEEN clause (implemented) 
SELECT * FROM products 
WHERE price BETWEN 10 AND 20; 

-- Sample of BETWEEN Negated 
SELECT * FROM products 
WHERE price NOT BETWEEN 10 AND 20; 

-- Sample of BETWEEN and NOT IN operator 
SELECT * FROM products 
WHERE price BETWEEN 10 AND 20 
AND category_id NOT IN (1, 2, 3); 

-- Sample of BETWEEN with text values as range. 
SELECT * FROM products 
WHERE product_name BETWEEN 'Carnarvon' AND 'Mozzarella di Giovanni'; 

-- Sample of BETWEEN with text values as range exlcluded.
SELECT * FROM products 
WHERE product_name NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni' 
ORDER BY product_name; 

-- Sample of BETWEEN with DATE as range. 
SELECT * FROM orders 
WHERE order_date BETWEEN '1996-07-01' AND '1996-07-31'; 

 
/* 
		## SQL Aliases : 
SQL aliases are used to give a table, or a column in a table,a temporary name. Usually this increment performance 
due to a avoid to the engine searching for the reference, also they are required in JOINs in order to avoid ambiguety of references 
*/ 
-- Sample of an alias of a table (generic)
SELECT column_name AS alias_name
FROM table_name; 

-- Sample of alias for multiple columns of a table 
SELECT customer_id as ID, customer_name AS CUSTOMER 
FROM customers; 

-- Sample of alias with spaces in its identifier 
SELECT customer_id AS "Customer ID" 
FROM customers; 

-- Sample of an alias applied to the table 
SELECT o.order_id, o.order_data, c.customer_name 
FROM customers AS c, orders AS o 
WHERE c.customer_name = 'Around the Horn' AND c.customer_id; 

/* 
SQL JOIN clause >> Used to combine rows from two or more tables, based on a related column between them. 

INNER (OUTER) JOIN >> Select Records that have matching values in both tables. 
LEFT  (OUTER) JOIN >> Returns all records from the left  table, and the matched records from the right table 
RIGHT (OUTER) JOIN >> Returns all records from the right table, and the matched records from the left table 
FULL  (OUTER) JOIN >> Returns all records when there is a match in either left or right table. 

Venn's diagram content : https://www.youtube.com/watch?v=CkV_uRErIqk

*/ 

-- Sample of a INNER JOIN from two tables 
SELECT ord.order_id, cus.customer_name, ord.order_date 
FROM orders 
INNER JOIN customers ON ord.customer_id = cus.customer_id; 

-- Sample of a INNER JOIN , values matching in both tables 
SELECT column_name 
FROM table1 
INNE JOIN table2 
ON table1.column_name = table2.column_name; 

-- Sample of INNER JOIN implemented three tables  
SELECT ord.order_id, cus.customer_name, ship.shipper_name 
FROM (( ord INNER JOIN customers ON ord.customer_id = cus.customer_id) 
		INNER JOIN shippers  ON ord.shipper_id  = ship.shipper_id);


-- Sample of a LEFT JOIN (generic) 
SELECT column_name 
FROM table1 tab1
LEFT JOIN table2 tab2
ON tab1.column_name = tab2.column_name; 

-- Sample of LEFT JOIN implemented 
SELECT cus.customer_name, ord.order_id 
FROM customers cus 
LEFT JOIN ord ON cus.customer_id = ord.customer_id 
ORDER BY cus.customer_name; 


-- Sample of RIGHT JOIN (generic)
SELECT column_name 
FROM table1 tab1
RIGHT JOIN table2 tab2 
ON tab1.column_name = tab2.column_name; 

-- Sample of RIGHT JOIN (implemented)
 SELECT ord.order_id, emp.last_name, emp.first_name 
 FROM orders ord 
 RIGHT JOIN employees emp 
 ON ord.employee_id = emp.employeeÑ_id 
 ORDER BY ord.order_id ; 
 
-- Sample of a FULL OUTER JOIN (generic)
SELECT column_name 
FROM table1 
FULL OUTER JOIN table2 
ON tab1.column_name = tab2.column_name 
WHERE condition; 

-- Sample of FULL OUTER JOIN (implemented) 
SELECT cus.customer_name, ord.order_id 
FROM customers cus 
FULL OUTER JOIN orders ord 
ON cus.customer_id = ord.customer_id
ORDER BY cus.customer_name; 

-- Sample of a SELF JOIN (generic) 
SELECT column_name, table tab1, table2 tab2
WHERE condition; 

-- Sample of a SQL SELF JOIN (implemented) 
SELECT cusA.customer_name AS customer_name, cusB.customer_name AS customer_name2, cusA.city 
FROM customers cusA, customers cusB 
WHERE cusA.customer_id <> cusB.customer_id 
AND cusA.city = cusB.city 
ORDER BY cusB.city; 

/* 
SQL UNION operator >> Used to combine the result-set of two or more SELECT statements 

Some requirements for use it: 
 * Each select statement within the UNION must have the same number of columns. 
 * The columns must also have similar data types. 
 * The columns in each select statement must be in the same order. 
 
 ## UNION operator selects only distinct values by default. To allow duplicates we must use 'UNION ALL' instead. 
 */ 
 
-- Sample of a UNION operator (generic) 
SELECT column_name FROM table1 
UNION 
SELECT column_name FROM table2; 


-- Sample of UNION ALL operator (generic) 
SELECT column_name FROM table1 
UNION ALL 
SELECT column_name FROM table2; 

-- Sample of UNION operator (implemented) 
SELECT city FROM customers 
UNION 
SELECT city FROM suppliers 
ORDER BY city; 

-- Sample of UNION ALL operators (implemented) 
SELECT city FROM customers 
UNION ALL 
SELECT city FROM suppliers 
ORDER BY city; 

-- Sample of UNION with WHERE 
SELECT city, country FROM customers 
WHERE country = 'Germany' 
UNION 
SELECT city, country FROM suppliers 
WHRE country = 'Germany' 
ORDER BY city; 

-- Sample of UNION ALL with WHERE 
SELECT city, country FROM customers 
WHERE country = 'Germany' 
UNION ALL 
SELECT city, country FROM suppliers 
WHERE country = 'Germany' 
ORDER BY city; 
 
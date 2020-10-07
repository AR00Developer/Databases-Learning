 /* 
GROUP BY statement >> groups rows that have the same values into summary roes. 
It's often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG() ) to group the 
result-set by one or more columns 
*/ 

-- Sample of  GROUP BY (generic) 
SELECT column_name 
FROM table_name 
WHERE condition 
GROUP BY column_name 
ORDER BY column_name; 

-- Sample of GROUP BY with COUNT function 
SELECT COUNT(customer_id), country 
FROM customers 
GROUP BY country; 

-- Sample of GROUP BY with COUNT function and ORDER BY customer_id 
SELECT COUNT(customer_id), country
FROM customers 
GROUP BY country 
ORDER BY COUNT(customer_id) DESC; 

-- Sample of GROUP BY after a LEFT JOIN 
SELECT ship.shipper_name, COUNT(ord.order_id) AS 'Number of Orders' 
FROM orders 
LEFT JOIN shippers ship ON ord.shipper_id = ship.shipper_id 
GROUP BY shipper_name; 

/* 
 ## HAVING clause was added to SQL to fix the issue of the WHERE clause being unabled to be used with aggregate functions 

 Usually in Oracle environment the aggregate function to be filtrated needs 'HAVING' clause and always needs to be group by 'GROUP BY' clause.
*/ 

-- Sample of HAVING with GROUP BY 
SELECT column_name 
FROM table_name 
WHERE condition 
GROUP BY column_name 
HAVING condition
GROUP BY column_name 
HAVING condition 
ORDER BY column_name; 

-- Sample of HAVING (implemented) 
SELECT COUNT (customer_id), country 
FROM customers 
GROUP BY country 
HAVING COUNT(customer_id) > 5; 

-- Sample of HAVING (implemented) | 02 
SELECT COUNT(customer_id),country 
FROM customers 
GROUP BY country 
HAVING COUNT(customer_id) > 5 
ORDER BY COUNT(customer_id) DESC; 

-- Sample of HAVING  after JOIN (implemented) | 03 
SELECT emp.last_name, COUNT(ord.order_id) AS 'Numbe Of Orders' 
FROM (Orders ord INNER JOIN employees emp ON ord.employee_id = emp.employee_id) 
GROUP BY last_name 
HAVING COUNT(ord.order_id) > 10; 

-- Sample of HAVING  after JOIN (implemented) | 04 
SELECT emp.last_name, COUNT(ord.order_id) AS 'Number Of Orders' 
FROM Orders ord 
INNER JOIN employees emp
ON ord.empoyee_id = emp.employee_id 
WHERE last_name = 'Davolio' OR last_name = 'Fuller' 
GROUP BY last_name 
HAVING COUNT(ord.order_id) > 25; 


/* 
		## The EXISTs operator is used to test for the existence of any record in a subquery. 
	The exists operator returns true if the subquery returns one or more records 

ANY operator > used with WHERE or HAVING clause. returns true  if any of the subquery values meet a condition 
ALL operator > user with WHERE or HAVING clause. returns true if all the sub-queries meet the conditions 
*/

-- Sample of Exists (generic) 
SELECT column_name 
FROM table_name 
WHERE EXISTS 
(SELECT column_name FROM table_name WHERE condition ); 

-- Sample of EXISTS (implemented)   | 01
SELECT supplier_name  
FROM suppliers  sup
WHERE EXISTS( SELECT product_name FROM products prod WHERE prod.supplier_id = sup.supplier_id AND price < 20 ); 
	
-- Sample of EXISTS (implemented)  | 02 
SELECT supplier_name 
FROM suppliers 
WHERE exists(SELECT product_name FROM products WHERE prod.supplier_id = sup.supplier_id AND price = 22 ); 


-- Sample of ANY operator 
SELECT column_name 
FROM table_name 
WHERE condition ANY 
(SELECT column_name FROM table_name WHERE condition2); 

-- Sample of ALL operator 
SELECT columnn_name 
FROM table_name 
WHERE condition ALL 
(SELECT column_name FROM table_name WHERE condition2); 


-- Sample of ANY operator (implemented) 
SELECT product_name 
FROM products 
WHERE product_id = ANY ( SELECT product_id FROM order_details WHERE quantity > 99); 

-- Sample of ALL operator (implemented) 
SELECT product_name 
FROM products 
WHERE product_id = ALL (SELECT product_id FROM order_Details WHERE quantity = 10); 


/* 
      ##  SELECT INTO copies data from one table into a new table 
 SELECT INTO >> usually use to copy data from implict cursors in queries.
 
 Usually most RDBMS support MERGE, UPSERT that allows to do a big dump of fields betweent tables based on conditions. 
 INSERT INTO >> Copies data from one table and inserts it into another table, both table has to match field types and quantity.
				Columns from the source table empty will fill with null the target one. (Table)
*/ 

-- Sample of SELECT INTO (generic) 
SELECT * 
INTO new_table [IN external_db] 
FROM old_Table 
WHERE condition;

-- Sample of SELECT INTO (generic) | 02 
SELECT column1, column2, column3 
INTO new_table [IN external_db] 
FROM old_Table 
WHERE condition; 

-- Sample of SELECT INTO to a external table all columns | 01
SELECT * INTO customers_backup2018
FROM customers; 

-- Sample of SELECT INTO to a external table all columns | 02
SELECT * INTO customers_backup2017 IN 'backup.mdb' 
FROM customers; 

-- Sample of SELECT INTO to a external table multiple column | 01
SELECT customer_name, contact_name INTO customer_backup2017 
FROM customers; 

-- Sample of SELECT INTO to a external table multiple column | 02
SELECT customer_name, contact_name INTO 'backup.mdb'
FROM customers; 

-- Sample of a INSERT INTO performed after a JOIN 
SELECT cus.customer_name, ord.order_id 
INTO customer_order_backup2017 
FROM customers cus
LEFT JOIN orders ON cus.customer_id = ord.customer_id; 


-- Sample of a INSERT INTO 
INSERT INTO table2 
SELECT * FROM table1 
WHERE ocndition 

-- Sample of INSERT into some columns 
INERT INTO table2 (column1, column2, column3, ... columnN) 
SELECT column1, column2, column3, ... 
FROM table1 
WHERE condition; 

-- Sample of INSERT INTO with multiple columns 
INSERT INTO customers (customer_name, city, country) 
SELECT supplier_name, city, country FROM suppliers; 

-- Sample of INSERT INTO with WHERE clause 
INSERT INTO customers (customer_name, city, country) 
SELECT supplier_name, city, country FROM suppliers 
WHERE country = 'Germany' ; 


/* 
SQL NULL functions >> As null values are special in some way of saying. We use mostly to interact with theme some special functions as follow  :
 IFNULL(), ISNULL(), COLAESCE(), NVL() 

  Most of them works in two ways, the first one from a 'n' set of values given to them the first evaluated to 'true' as existent' it's used. 
  The second they return some numeric value indicating the existences or absensce of values in the field specified. 
*/ 

-- Sample of IFNULL mysql env. Just it chooses the first value not null 
SELECT product_name, unit_price * (unit_in_stock + IF NULL(units_order, 0 )) 
FROM products; 

-- Sample of COALESCE()  
SELECT product_name, unit_price * (units_in_stocl + COALESCE(units_in_order, 0)) 
FROM products; 

-- Sample of NVL oracle env. 
SELECT product_name, unit_price * (units_in_stock + NVL(units_on_order, 0)) 
FROM products; 

-- Sample of SQL Server IF NULL function 
SELECT product_name, unit_price * (units_in_stock + IS NULL(units_on_order, 0))
FROM products; 

-- Sample of MS Access IS NULL 
SELECT product_name, unit_price * (units_in_stocl + IIF(isNull(units_order), 0, units_on_order))
FROM products; 


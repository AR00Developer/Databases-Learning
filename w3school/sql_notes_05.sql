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






















































































































































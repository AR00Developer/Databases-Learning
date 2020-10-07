
/* 
MIN(), MAX() functions. 

MIN() >> Returns the smallest value of the selected column
MAX() >> Returns the largest value of the selected column

*/ 

-- Sample with MIN() function (generic) 
SELECT MIN(column_name) 
FROM table_name 
WHERE condition; 

-- Sample with MAX() function (generic) 
SELECT MAX(column_name) 
FROM table_name 
WHERE condition;
 
 
-- SELECT min values from a column(implemented) 
SELECT MIN(price) AS smallest_price 
FROM products; 

-- SELECT max values from a column(implemented) 
SELECT MAX(price) AS largest_price 
FROM products; 

/* 
window function ( COUNT(), AVG(), SUM() )  all of them perform an operation above all the the values from the resulset obtained. 

COUNT() >> Counts all the registers(fields) obtained from a query. 
AVG()   >> Returns an average number from all the values obtained. 
SUM()   >> Sum all the values obtainers after being performed a query. 

*/ 

-- Sample COUNT() implemented (generic)
SELECT COUNT(column_name) 
FROM table_name 
WHERE condition; 

-- Sample AVG() implemented (generic)
SELECT AVG(column_name) 
FROM table_name 
WHERE condition; 

-- Sample SUM() implemented (generic)
SELECT SUM(column_name) 
FROM table_name 
WHERE condition; 

-- Sample COUNT() query (implemented)
SELECT COUNT(product_id) 
FROM products; 

-- Sample SUM() query (implemented)
SELECT ACG(price) 
FROM products; 

-- Sample AVG() query (implemented)
SELECT SUM(quantity) 
FROM order_details; 

/* 
LIKE operator >> Used for make search with patterns of words that match in some ways to register of a field. 

Usually like a REGEX function that let us perform this searchs, all the words used as pattern can be affected by the wildcards ('%','_') 

% symbol >> Represents zero, one, or multiple characters. 
_ symbol >> Represents a single character. 

some Combinations of wildcards : 
'n%' 	>> - Performs a search where 'n' it's the first character.  
'%n' 	>> - Performs a search where 'n' it's the last character.
'%n%' 	>> - Performs a search where 'n' it's somewhere between the beggining and the end.
'_n%'   >> - Performs a search where 'n' it's almost at the beggining, the first place it's ocuppied by other character.
'n_%'   >> - Performs a search where 'n' it's at the begginning follow of one characters. 
'n__%'  >> - Performs a search where 'n' it's at the begginning follow of two characters. 
'n%p'   >> - Performs a search where 'n' it's at the beginning and 'p' at the end.  


*/ 

-- Sample of a SELECT qyery qith a pattern generic after LIKE operator 
SELECT column1, column2
FROM table_name 
WHERE column1 LIKE pattern; 


-- Sample with a search of a pattern that involves the character 'a' at the beginning 
SELECT * FROM customers 
WHERE customer_name LIKE 'a%'; 

-- Sample with a search of a pattern that involves the character 'a' at the end
SELECT * FROM customers 
WHERE customer_name LIKE '%a'; 

-- Sample with a search of a pattern that involves the characters 'or' somewhere between the beginning and the end. 
SELECT * FROM customers 
WHERE customer_name LIKE '%or%'; 

-- Sample with a search of a pattern that involves the character 'r' almost at the beggining preceding a character unknown. 
SELECT * FROM customers 
WHERE customer_name LIKE '_r%';

-- Sample with a search of a pattern that involves the character 'a' at the beggining followed by two characters unknown 
SELECT * FROM customers 
WHERE customer_name LIKE 'a__%'; 

-- Sample with a search of a pattern that involves the character 'a' at the beginning and the character 'o' at the end. 
SELECT * FROM customers 
WHERE contact_name LIKE 'a%o';

-- Sample with a search of a pattern that involves the character 'a' not at the beginning 
SELECT * FROM customers 
WHERE customer_name NOT LIKE 'a%'; 


/* 
Anothers useful wildcards that can be used with the like operator :

-- MS Access  wildcards
*   >> - Represents zero or more characters. 
?   >> - Represents a single character.
[]  >> - Represents any single character within the brackets
!   >> - Represents any character not in the brackets. 
-   >> - Represents a range of characters
#   >> - Represents any single numeric character 

-- SQL Server wildcards
%    >> - Represents zero or more characters. 
--   >> - Represents a single character. 
[]   >> - Represents any single character withing the brackets. 
^    >> - Represents any character not in the brackets. 
-    >> - Represents a range of characters. 

*/


-- Sample with using the '%' wildcard 
SELECT * FROM customers 
LIKE city FROM LIKE 'ber%'; 

-- Sample with using the '%word%'  pattern 
SELECT * FROM customers 
LIKE city FROM LIKE '%word%'; 

-- Sample with using the '_' wildcard
SELECT * FROM customers 
WHERE city LIKE '_word'; 

-- Sample of multiple '_' use wildcard 
SELECT * FROM customers 
WHERE city LIKE 'L_n_on'; 

-- Sample of '[]' pattern search, all between the brackets are the characters to be found 
SELECT * FROM customers 
WHERE city LIKE '[bsp]%'; 

-- Sample of '[]' pattern search, a range of characters from 'a' to 'c' 
SELECT * FROM customers 
WHERE city LIKE '[a-c]'; 

-- Sample of '[!]' pattern search, all not between the brackets are the characters to be found (Version 01)
SELECT * FROM customers 
WHERE city LIKE '[!bsp]%'; 

-- Sample of '[!]' pattern search, all not between the brackets are the characters to be found (Version 01)
SELECT * FROM customers 
WHERE city NOT LIKE '[bsp]%'; 

/* 
SQL IN operator : Allow us to specify multiple values in a WHERE clause. 
 Shortcut for multiple OR conditions . 

It can be performed by passing values to the 'IN' function or as sub-query as argument of the function 'IN'. 
*/ 

-- Sample with 'IN' keyword. 
SELECT column_name
FROM table_name 
WHERE column_name IN (value1, value2, ..., valueN);

-- Sample with Sub-query within the first query 
SELECT column_name 
FROM table_name 
WHERE column_name IN (SELECT statement);

-- Sample with 'IN' multiple-values as args (implemented) 
SELECT * FROM customers 
WHERE country IN ('Germany', 'France', 'UK'); 

-- Sample with 'IN' multiple-values negated as args (implemented) 
SELECT * FROM customers 
WHERE country NOT IN ('Germany', 'France', 'UK'); 

-- Sample with a Sub-query with multiple-values as result-set of it's execution 
SELECT * FROM customers 
WHERE country IN (SELECT country FROM suppliers);


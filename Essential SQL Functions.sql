-- Numeric Functions
SELECT ROUND(5.73);
SELECT CEILING(5.2);
SELECT FLOOR(5.7);
SELECT ABS(-4.78);
SELECT RAND(); -- And Many More
-- String Functions
SELECT UPPER('Sky');
SELECT LOWER('Sky');
SELECT LTRIM('     SUDIPTA');
SELECT RTRIM('SUDIPTA      ');
SELECT TRIM('  SQL  ');
SELECT SUBSTRING('Kindergarten',7);
SELECT REPLACE('Kindergarten','garten','garden');
SELECT LOCATE('Kind','Kindergarten');
-- CONCAT Function
use sql_store;
SELECT CONCAT(first_name,' ',last_name) AS Full_name
FROM customers;
-- DATE TIME Functions
SELECT NOW(); -- 2022-06-09 11:01:22
SELECT CURDATE(),CURTIME();
SELECT MINUTE(NOW());
SELECT EXTRACT(YEAR FROM NOW());
-- Date-Time Formatting
SELECT DATE_FORMAT(NOW(),'%D %M %Y');
SELECT TIME_FORMAT(NOW(),'%H %i %S %p');
-- Date-Time Calculation
SELECT DATE_ADD(NOW(),INTERVAL 1 YEAR);
SELECT DATE_SUB(NOW(),INTERVAL 1 DAY);
SELECT DATEDIFF('2022-07-06','2021-07-06');
-- IFNULL Functions
SELECT CONCAT(first_name,' ',last_name) as Full_name,
       IFNULL(phone,'Unknown') 
FROM customers;
-- IF Function
SELECT p.product_id,
	   p.name,
       COUNT(*) AS orders, 
       IF(COUNT(*)>1,'Many Times','Once') AS Frequency 
FROM order_items o
JOIN products p ON p.product_id = o.product_id GROUP BY product_id;
-- CASE Operator
SELECT CONCAT(first_name,' ',last_name) AS Full_name,
	   points,
       CASE
		   WHEN points > 3000 THEN 'GOLD'
           WHEN points >=2000 THEN 'SILVER'
           WHEN points <2000 THEN 'BRONZE'
	   END AS Badges
FROM customers ORDER BY points DESC;
           
           
use sql_store;
-- SELECT statement
select name,unit_price as 'unit price', unit_price * 1.1 as 'new price' from products;
-- WHERE Clause
select * from orders where order_date > '2018-01-01';
-- AND,OR,NOT Operator
select * from order_items where (order_id = 6 and (quantity*unit_price) > 30);
-- IN operator
select * from products where quantity_in_stock in (49,38,72);
-- BETWEEN operator
select * from customers where birth_date between '1990-01-01' and '2000-01-01';
-- LIKE operator
select * from customers where address like '%trail%' or address like '%avenue%';
select * from customers where phone like '%9';
-- REGEXP operator
select * from customers where first_name regexp 'ELKA|AMBUR'; -- | LOGICAL OR FOR TWO ALTERNATIVE EXPRESSIONS
select * from customers where last_name regexp 'EY$|ON$'; -- $ USED FOR END OF STRING
select * from customers where last_name regexp '^MY|SE'; -- ^ USED FOR START OF STRING
select * from customers where last_name regexp 'B[RU]'; -- [] USED FOR SEQUENCIAL, INTERVAL MATCHING
-- IS NULL operator
select * from orders where shipped_date is null;
-- ORDER BY operator
select order_id,product_id,quantity,unit_price, (quantity*unit_price) as total_price from order_items where order_id = 2  order by total_price desc;
-- LIMIT operator
select * from customers order by points desc limit 3;

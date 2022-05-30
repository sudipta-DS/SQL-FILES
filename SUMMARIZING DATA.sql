use sql_invoicing;
SELECT 
    'First Half Of 2019' AS date_range,
    SUM(invoice_total),
    SUM(payment_total),
    SUM(invoice_total - payment_total)
FROM invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-06-30'
UNION
SELECT 
    'Second Half Of 2019' AS date_range,
    SUM(invoice_total),
    SUM(payment_total),
    SUM(invoice_total - payment_total)
FROM invoices
WHERE invoice_date BETWEEN '2019-07-01' AND '2019-12-31'
UNION
SELECT 
    'Total' AS date_range,
    SUM(invoice_total),
    SUM(payment_total),
    SUM(invoice_total - payment_total)
FROM invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-12-31';
-- GROUP BY CLAUSE
SELECT p.date,
	   pm.name as payment_method, 
       SUM(amount) as total_payments 
FROM payments p
JOIN payment_methods pm ON p.payment_method = pm.payment_method_id
GROUP BY p.payment_id 
ORDER BY p.date ;
-- HAVING CLAUSE
USE sql_store;
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       sum(oi.quantity * oi.unit_price)as spent_total
FROM customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id) WHERE c.state = 'VA'
HAVING spent_total >100;
-- ROLL UP STATEMENT
USE sql_invoicing;
SELECT pm.name as payment_methods,
       SUM(p.amount) as amount FROM payments p
JOIN payment_methods pm ON p.payment_method=pm.payment_method_id
GROUP BY payment_methods WITH ROLLUP ;
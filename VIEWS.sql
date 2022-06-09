-- VIEWS CREATION
USE sql_invoicing;
CREATE OR REPLACE VIEW Customer_balances AS
SELECT i.client_id,
       c.name,
       SUM(invoice_total - payment_total) AS balance
FROM invoices i
JOIN clients c USING (client_id)
GROUP BY client_id,name;
 
-- CREATE VIEW
CREATE OR REPLACE VIEW invoices_view AS
SELECT invoice_id,
	   number,
       client_id,
       invoice_total,
       payment_total,
       (invoice_total-payment_total) AS balance,
       invoice_date,
       due_date,
       payment_date
FROM invoices;
-- CREATE VIEW WITH PRIVACY
CREATE OR REPLACE VIEW invoices_privacy AS
SELECT invoice_id,
	   number,
       client_id,
       invoice_total,
       payment_total,
       (invoice_total-payment_total) AS balance,
       invoice_date,
       due_date,
       payment_date
FROM invoices 
WHERE (invoice_total-payment_total) > 0
WITH CHECK OPTION -- This statement prevent to update,delete rows from views;
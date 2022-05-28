use sql_store;
-- INNER JOIN
select order_id, order_items.product_id,quantity,order_items.unit_price,name 
from order_items 
inner join products on
order_items.product_id = products.product_id;
-- SELF JOIN
use sql_hr;
select e.employee_id,e.first_name , m.first_name as manager
from employees e
join employees m on
e.reports_to = m.employee_id;
-- JOINING MULTIPLE TABLES
use sql_invoicing;
select pay.payment_id,
	   pay.client_id,
       pay.date,
       pay.amount,
       ci.name,
       pm.name as payment_method
from payments pay
join clients ci on pay.client_id = ci.client_id
join payment_methods pm on pay.payment_method = pm.payment_method_id;
-- COMPOUND JOIN
use sql_store;
select * from 
order_items oi
join order_item_notes oin on
oi.product_id = oin.product_id
and oi.order_id = oin.order_id;
-- OUTER JOIN
select products.product_id,
       products.name,
       products.quantity_in_stock,
       products.unit_price,
       order_items.quantity
from products
left join order_items on
products.product_id = order_items.product_id;
-- OUTER JOIN BETWEEN MULTIPLE TABLES
select o.order_date,
       o.order_id,
       c.first_name,
       sh.name as shipper,
       os.name as status
from orders o 
left join customers c on o.customer_id = c.customer_id
left join order_statuses os on o.status = os.order_status_id
left join shippers sh on o.shipper_id = sh.shipper_id
order by shipper;
-- USING CLAUSE
use sql_invoicing;
select p.date,
       p.amount,
       c.name as clients,
       pm.name as status
from payments p
join clients c using (client_id)
join payment_methods pm on p.payment_method=pm.payment_method_id;
-- UNIONS
use sql_store;
select customer_id,first_name,points, "BRONZE" as 'type'  
from customers where points < 2000
union
select customer_id,first_name,points, "SILVER"  
from customers where points between 2000 and 3000
union 
select customer_id,first_name,points, "GOLD"  
from customers where points >= 3000
order by first_name;
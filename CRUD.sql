use sql_store;
-- INSERT SINGLE ROW IN THE TABLE
insert into customers(
         first_name,
         last_name,
         birth_date,
         address,
         city,
         state)
values ('Sudipta',
        'Samanta',
        '2001-06-23',
        'address',
        'CA',
        'CA');
-- INSERT MULTIPLE ROWS IN THE TABLE
insert into products(name,quantity_in_stock,unit_price)
values ('Multivitamin',70,5.25),('Fish Oil',100,5.50),('Creatine',75,6.00);
-- INSERT HIRERCHICAL ROWS
insert into orders(customer_id,order_date,status)
values (1,'2022-05-30',1);
insert into order_items(product_id,quantity,unit_price)
values (last_insert_id(),72,4.5);
-- CREATING A COPY OF TABLE
use sql_invoicing;
insert into invoicing_with_date 
select * from invoices where payment_date is not null;
-- UPDATE SINGLE ROW
update invoices
set invoice_total = 700.00,payment_date = due_date
where invoice_id = 4;
-- UPDATE MULTIPLE ROWS
use sql_store;
update customers 
set points = points+50
where birth_date < '1990-01-01' ;
-- USING SUBQUERY IN UPDATES
update orders
set comments = 'GOLD CUSTOMER'
where customer_id in (select customer_id from customers where points > 3000);
-- DELETEING ROW
delete from customers where customer_id =12;

USE sql_store;

SELECT * 
FROM products
WHERE unit_price > (
	SELECT unit_price
    FROM products
    where product_id = 3
);

USE sql_hr;

SELECT first_name, last_name,salary
FROM employees
where salary > (SELECT AVG(salary) from employees);

USE sql_store;

SELECT * from products where product_id not in(
SELECT DISTINCT(product_id) FROM order_items );


USE sql_invoicing;

SELECT * FROM clients
where client_id not in (
select distinct client_id from invoices);
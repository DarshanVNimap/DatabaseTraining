
-- USING SUBQUERY
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

-- FIND CUSTOMER WHO HAVE ORDERED LETTUCE


-- SUBQUERY

SELECT first_name, last_name FROM customers
WHERE customer_id IN (
	SELECT customer_id FROM orders o
	JOIN order_items oi USING (order_id)
	WHERE oi.product_id = 3
);


-- USING JOIN
SELECT DISTINCT(c.customer_id), first_name , last_name 
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON oi.order_id = o.order_id
WHERE oi.product_id = 3;

-- SELECT INVOICES LARGER THAN ALL INVOICES OF CLIENT ID 3
-- USING SUBQUERY

USE sql_invoicing ;
SELECT * FROM invoices 
WHERE invoice_total > (SELECT Max(invoice_total)  FROM invoices
						WHERE client_id = 3
						);
                         
-- USING ALL KEY WORD

SELECT * FROM invoices 
WHERE invoice_total > ALL (SELECT invoice_total FROM invoices
						   WHERE client_id = 3);
                           
-- SELECT CLIENTS WITH AT LEAST TWO INVOICES

SELECT * FROM clients
WHERE client_id = Any(
	SELECT client_id FROM invoices
	GROUP BY client_id
	HAVING COUNT(*) > 2);

-- SELECT EMPLOYEE 	WHOSE SALARY IS ABOVE THE AVG IN THEIR OFFICE

USE sql_hr;

SELECT * FROM employees e
WHERE salary > (
	SELECT AVG(salary) 
    FROM employees
    where office_id = e.office_id
);

-- GET INVOICES THAT ARE LARGER THAN THE CLIENT'S AVG AMOUNT

USE sql_invoicing;

SELECT * FROM invoices  i
WHERE invoice_total >
(SELECT AVG(invoice_total) FROM invoices
WHERE client_id = i.client_id)
ORDER BY client_id; 

-- SELECT CLIENT THAT HAVE AN INVOICE

SELECT * FROM clients 
WHERE client_id IN
(SELECT DISTINCT client_id FROM invoices);

SELECT DISTINCT(client_id), name , city FROM clients c
JOIN invoices USING (client_id);

SELECT * FROM clients c
WHERE EXISTS (
	SELECT distinct client_id
    FROM invoices
    WHERE client_id = c.client_id
);

-- FIND PRODUCT THAT NEVER BEEN ORDERED

USE sql_store;

SELECT * FROM products p
WHERE NOT EXISTS (
SELECT product_id FROM order_items
WHERE product_id = p.product_id);

Use sql_invoicing;
SELECT 
	client_id, 
    invoice_total, 
    (SELECT AVG(invoice_total) FROM invoices) AS Average ,
    ABS(invoice_total - (SELECT Average)) AS Difference
FROM invoices;





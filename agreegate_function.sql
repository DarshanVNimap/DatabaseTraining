CREATE DATABASE IF NOT EXISTS BILL;

USE BILL;
CREATE TABLE IF NOT EXISTS Invoice
(
	 invoice_id INTEGER PRIMARY KEY auto_increment,
    customer_name VARCHAR(50),
    invoice_date DATE,
    amount DECIMAL(10, 2),
    status TEXT
);

DROP TABLE IF EXISTS Invoice; 

INSERT INTO invoice (customer_name, invoice_date, amount, status) VALUES
    ('John Doe', '2023-11-01', 100.00, 'Paid'),
    ('Jane Smith', '2023-11-02', 150.50, 'Pending'),
    ('Bob Johnson', '2023-11-03', 200.75, 'Paid'),
    ('Alice Brown', '2023-11-04', 75.20, 'Pending'),
    ('Charlie Davis', '2023-11-05', 120.90, 'Paid'),
    ('Eva White', '2023-11-06', 180.30, 'Paid'),
    ('David Lee', '2023-11-07', 90.50, 'Pending'),
    ('Grace Miller', '2023-11-08', 160.80, 'Paid'),
    ('Frank Wilson', '2023-11-09', 130.25, 'Pending'),
    ('Helen Anderson', '2023-11-10', 220.00, 'Paid');
    

SELECT 
	COUNT(invoice_id)  AS Total_Costumer,
    SUM(amount) AS Total_Amount,
    AVG(amount) AS Average,
    status
FROM Invoice
group by status
HAVING total_amount > 300;


SELECT 
    a.state,
    SUM(i.amount) AS Amount,
    AVG(i.amount) AS Average
FROM customer c
JOIN address a
	ON c.customer_id = a.customer_id
JOIN invoice i
	ON c.customer_id = i.customer_id
GROUP BY a.state with rollup;

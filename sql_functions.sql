-- NUMERIC FUNCTION
SELECT  ABS(-203);  
SELECT RAND();   -- RANDOMLY GENERATE VALUE 0-1
SELECT ROUND(5.8); 
SELECT FLOOR(5.74); -- ROUND NUMBER MIN TO INTEGER
SELECT CEILING(5.456); -- ROUND NUMBER WITH NEAR MAX INTEGER

-- STRING FUNCTION

SELECT TRIM('    dARSHAN     '); -- REMOVE UNNECCESARY SPACES FROM BIGGNING AND ENDDING
SELECT LTRIM("   DARSHAN");  -- REMOVE REMOVE UNNECCESARY SPACES FROM BIGGNING
SELECT RTRIM('dARSHAN        ');  -- REMOVE UNNECCESARY SPACES FROM ENDDING;

SELECT CONCAT("DARSHAN" , " ", "VALA") AS 'FULL NAME';  -- JOIN TWO STRING

SELECT SUBSTRING("KINDGARDER" , 5, 3) ; 

-- DATE FUNCTION

SELECT NOW();  -- GIVE CURRENT SYSTEM TIME AND DATE
SELECT CURDATE();  -- CURRENT DATE
SELECT CURTIME() ; -- CURRENT TIME

SELECT EXTRACT(MONTH FROM NOW()); -- EXTRACT MONTH , DAY OR YEAR 

SELECT YEAR(NOW());
SELECT MONTHNAME(NOW());

-- 

USE sql_store;

SELECT 
	order_id,
    IFNULL(shipper_id , "Not assign") AS Shipper,
    COALESCE(shipper_id, comments, 'Not ')
FROM ORDERS;

-- 

SELECT 
	CONCAT(first_name , " " , last_naMe) AS customer,
    points,
    CASE
		WHEN (points > 3000) THEN 'GOLD'
        WHEN (points >= 2000) THEN 'SILVER'
        ELSE 'BRONZE'
	END AS category
FROM
	customers;
    
--

USE sql_invoicing;
SELECT
	client_id,
    name,
    (SELECT SUM(invoice_total) FROM invoices WHERE client_id = c.client_id) AS total_sale,
    (SELECT AVG(invoice_total) FROM invoices) AS average,
    (SELECT total_sale - average) AS difference
FROM clients c;

SELECT 
	CONCAT(first_name ,' ', last_name) AS name,
    IFNULL(phone , 'Unkown') AS phone
FROM
	customers;
    
--

SELECT 
	order_id,
    order_date,
    IF(YEAR(order_date) = YEAR(NOW()) , 'ACTIVE' , 'ARCHIEVE') AS status
FROM 
	orders;
    
--

SELECT 
	order_id,
    order_date,customers,
    CASE 
		WHEN (YEAR(order_date) = YEAR(NOW())) THEN 'ACTIVE'
        WHEN (YEAR(order_date) = YEAR(NOW())-1) THEN 'LAST YEAR'
        WHEN (YEAR(order_date) < YEAR(NOW()) - 1) THEN 'ARCHIEVE'
	END AS category
 FROM orders;
 
 
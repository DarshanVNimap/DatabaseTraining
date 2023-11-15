
-- CREATE PROCEDURE GET INVOICE BY CLIENT

DROP PROCEDURE IF EXISTS get_invoice_by_client;

DELIMITER $$

CREATE PROCEDURE get_invoice_by_client
(
	client_id INT
)
BEGIN
	SELECT * FROM invoices i 
	WHERE i.client_id = client_id;
END$$
DELIMITER ;

CALL get_invoice_by_client(2);
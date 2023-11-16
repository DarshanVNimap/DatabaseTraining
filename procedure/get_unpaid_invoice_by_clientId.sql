DROP PROCEDURE IF EXISTS get_unpaid_invoice_by_clientId;

DELIMITER $$

CREATE PROCEDURE  get_unpaid_invoice_by_clientId
(
	client_id INT,
    OUT total_invoice INT,
    OUT total_amount DECIMAL(8, 3)
)
BEGIN
	SELECT COUNT(*) AS `total_invoice`,
	   SUM(invoice_total) AS total_amount
	INTO total_invoice , total_amount
	FROM invoices i
	WHERE payment_total = 0 AND i.client_id = client_id;

END$$

DELIMITER ;

CALL get_unpaid_invoice_by_clientId(1);
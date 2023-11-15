DELIMITER $$

CREATE PROCEDURE get_customer_balance()
BEGIN
SELECT client_id,
       SUM(invoice_total),
       SUM(invoice_total - payment_total) AS balance
FROM invoices
GROUP BY client_id;
END$$

DELIMITER ;

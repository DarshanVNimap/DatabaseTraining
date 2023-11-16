DROP PROCEDURE IF EXISTS update_payment;

DELIMITER $$

CREATE PROCEDURE update_payment(
	invoice_id INT,
    invoice_total DECIMAL(9 ,2)
)
BEGIN	
		IF invoice_total <= 0 
		THEN
			SIGNAL SQLSTATE '22003'
            SET MESSAGE_TEXT = 'INVALID PAYMENT AMOUNT';
		END IF;
		IF NOT EXISTS (SELECT invoice_id FROM invoices WHERE invoice_id = invoice_id) THEN
			SIGNAL SQLSTATE '42S22'
            SET MESSAGE_TEXT  = 'INVALID INVOICE ID';
		END IF;
		UPDATE invoices i
			SET i.invoice_total = invoice_total
		WHERE i.invoice_id = invoice_id ;
END$$

DELIMITER ;

CALL update_payment(1 , null);
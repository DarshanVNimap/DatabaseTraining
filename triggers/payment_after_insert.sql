USE sql_invoicing;

DROP TRIGGER payment_after_insert;

DELIMITER $$
CREATE TRIGGER payment_after_insert 
		AFTER 
		INSERT ON payments
        FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total + NEW.amount
    WHERE invoice_id  = NEW.invoice_id;
END$$
DELIMITER ;

INSERT INTO payments VALUES (DEFAULT , 2 , 1 , DATE(NOW()), 120,1) ;
DELIMITER $$
CREATE PROCEDURE calculate_risk_factor()
BEGIN
	DECLARE risk_factor INT DEFAULT 0;
    DECLARE invoice_total TINYINT;
    DECLARE total_amount DECIMAL;
    
    SELECT COUNT(*) , SUM(invoice_total)
    INTO invoice_total , total_amount
    FROM invoices;
    
   SET risk_factor =  total_amount / invoice_total * 5;
   
   SELECT risk_factor;
END$$
DELIMITER ;

CALL calculate_risk_factor();
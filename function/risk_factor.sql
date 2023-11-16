DELIMITER $$

CREATE FUNCTION `get_risk_factor_by_client`(
	client_id INT
) RETURNS int
    READS SQL DATA
BEGIN
	DECLARE risk_factor INT DEFAULT 0;
    DECLARE total_invoice TINYINT;
    DECLARE total_amount DECIMAL;
    
    SELECT COUNT(*) , SUM(invoice_total)
		INTO total_invoice , total_amount
    FROM invoices i
    where i.client_id = client_id;
    
   SET risk_factor =  total_amount / total_invoice * 5;
   

RETURN IFNULL(risk_factor , 0);
END$$

SELECT client_id , 
	name,
    get_risk_factor_by_client(client_id) AS risk_factor
FROM 
	clients;

DROP  PROCEDURE IF EXISTS get_payment_by_clientId_paymentId;

DELIMITER $$

CREATE PROCEDURE get_payment_by_clientId_paymentId(
	client_id INT,
    payment_method_id TINYINT 
)
BEGIN
	SELECT  
		c.name , c.city , 
        c.state, p.amount, 
        pm.name AS payment_type 
	FROM clients c
	JOIN  payments p USING (client_id)
	JOIN payment_methods pm
		ON pm.payment_method_id = p.payment_id
	WHERE 
		pm.payment_method_id = IFNULL(payment_method_id , pm.payment_method_id) AND c.client_id = IFNULL(client_id , c.client_id);
END$$

DELIMITER ;

CALL get_payment_by_clientId_paymentId(5 , 2);


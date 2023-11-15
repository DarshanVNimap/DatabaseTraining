DROP PROCEDURE IF EXISTS get_clients;

DELIMITER $$
CREATE PROCEDURE get_clients()
BEGIN
	SELECT c.client_id, c.name FROM clients c
    JOIN invoices USING (client_id)
    GROUP BY c.client_id;
END$$

DELIMITER ;

call get_clients;
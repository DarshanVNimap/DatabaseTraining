-- CREATE PROCEDURE GET CLIENTS BY STATE 

DROP PROCEDURE IF EXISTS get_client_by_state;

DELIMITER @@

CREATE PROCEDURE get_client_by_state
(
	state CHAR(2)
)
BEGIN
	SELECT * FROM clients c
	WHERE c.state = state;
END@@

DELIMITER ;

call get_client_by_state('IN');

USE [BankingDB]
GO
/*procedure initialization*/
CREATE PROCEDURE sp_add_money_to_account 
@status_id int	
AS
BEGIN
    UPDATE accounts
	SET amount += 10
	FROM (SELECT clients.client_id FROM clients WHERE clients.client_status_id = @status_id) AS selected
	WHERE accounts.client_id =selected.client_id
END;

/*procedure execution*/
SELECT accounts.account_id,accounts.amount,accounts.client_id,statuses.status_id,accounts.bank_reference_id
FROM accounts
INNER JOIN clients ON clients.client_id = accounts.client_id
INNER JOIN statuses ON statuses.status_id = clients.client_status_id

EXECUTE sp_add_money_to_account @status_id =5; 
GO

SELECT accounts.account_id,accounts.amount,accounts.client_id,statuses.status_id,accounts.bank_reference_id
FROM accounts
INNER JOIN clients ON clients.client_id = accounts.client_id
INNER JOIN statuses ON statuses.status_id = clients.client_status_id

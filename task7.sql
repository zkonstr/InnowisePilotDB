USE [BankingDB]
GO

/*procedure initialization*/
CREATE PROCEDURE sp_account_to_card_transaction 
@account_id int,  
@card_id int, 
@transfer_amount decimal(19,2)
AS
declare @err_message nvarchar(max)
declare @check_amount decimal(19,2)
declare @check_id int

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
BEGIN TRANSACTION 

SELECT @check_amount = 
	(SELECT accounts.amount - (SELECT ISNULL(SUM(Cards.amount ),0) 
								FROM Cards
								WHERE @account_id = Cards.account_id)
	FROM accounts
	WHERE accounts.account_id = @account_id)

SELECT @check_id = 
	(SELECT account_id
	 FROM Cards
	 WHERE account_id = @card_id
		 AND  account_id = @account_id)

IF  @check_id IS NULL
    BEGIN
        SET @err_message = 'transferring money to the wrong card'
        RAISERROR(@err_message, 16, 1)
		ROLLBACK
			RETURN
	END;

IF  @transfer_amount > @check_amount
    BEGIN
        SET @err_message = 'amount transferred is more than the availible amount of the account!'
        RAISERROR(@err_message, 16, 1)
		ROLLBACK
			RETURN
	END;

UPDATE Cards
SET amount += @transfer_amount 
WHERE account_id = @card_id
	AND  account_id = @account_id

BEGIN  
	COMMIT  
		PRINT 'Transaction committed'  
END;  
/*procedure execution*/
SELECT accounts.account_id,accounts.amount,cards.card_id,cards.amount,accounts.client_id
FROM accounts
INNER JOIN clients ON clients.client_id = accounts.client_id
INNER JOIN cards ON cards.account_id = accounts.account_id

EXECUTE sp_account_to_card_transaction @account_id = 1,@card_id =1, @transfer_amount = 1000 

SELECT accounts.account_id,accounts.amount,cards.card_id,cards.amount,accounts.client_id
FROM accounts
INNER JOIN clients ON clients.client_id = accounts.client_id
INNER JOIN cards ON cards.account_id = accounts.account_id
USE [BankingDB]
GO

CREATE TRIGGER AccountBalanceCheck
ON Accounts
AFTER INSERT, UPDATE
AS 
BEGIN
IF EXISTS   
(
	SELECT inserted.account_id 
	FROM inserted
	JOIN cards ON cards.account_id = inserted.account_id 
	GROUP BY inserted.account_id 
	HAVING MAX(inserted.amount) < SUM(cards.amount)
)			
RAISERROR ('Account amount cannot be less than card amount', 16,1);  
END;
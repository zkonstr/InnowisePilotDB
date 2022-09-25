USE [BankingDB]
GO

SELECT clients.client_name,accounts.account_id,banks.bank_name, accounts.amount - SUM(cards.amount) AS difference 
FROM Accounts 
	INNER JOIN cards ON cards.account_id = accounts.account_id
	INNER JOIN banks ON banks.bank_id = accounts.bank_reference_id
	INNER JOIN clients ON clients.client_id = accounts.client_id
GROUP BY clients.client_name,accounts.account_id,banks.bank_name, accounts.amount
HAVING accounts.amount  - SUM(cards.amount) != 0
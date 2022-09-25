USE [BankingDB]
GO

SELECT  clients.client_name, clients.client_surname, cards.card_id, cards.amount, banks.bank_name
FROM cards
	INNER JOIN accounts ON accounts.account_id = cards.account_id
	INNER JOIN clients ON clients.client_id = accounts.client_id
	INNER JOIN banks ON banks.bank_id = accounts.bank_reference_id
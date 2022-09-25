USE [BankingDB]
GO

/*procedure initialization*/
CREATE PROCEDURE sp_check_amount_excess
AS
BEGIN
   SELECT clients.client_name,clients.client_surname, accounts.amount - SUM(cards.amount) AS account_excess 
   FROM Clients
   JOIN Accounts on accounts.client_id = clients.client_id
   JOIN Cards on cards.account_id = accounts.account_id
   GROUP BY  clients.client_name, clients.client_surname, accounts.amount
   HAVING accounts.amount  - SUM(Cards.amount) != 0
END;
GO

/*procedure execution*/
SELECT accounts.account_id,accounts.amount,cards.card_id,cards.amount,accounts.client_id
FROM accounts
INNER JOIN clients ON clients.client_id = accounts.client_id
INNER JOIN cards ON cards.account_id = accounts.account_id

EXECUTE sp_check_amount_excess

SELECT accounts.account_id,accounts.amount,cards.card_id,cards.amount,accounts.client_id
FROM accounts
INNER JOIN clients ON clients.client_id = accounts.client_id
INNER JOIN cards ON cards.account_id = accounts.account_id
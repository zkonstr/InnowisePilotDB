USE [BankingDB]
GO

/*subquery realisation*/
SELECT statuses.status_name, 
	(SELECT COUNT(cards.card_id) 
		FROM cards
		INNER JOIN accounts ON accounts.account_id = cards.account_id
		INNER JOIN clients ON clients.client_id = accounts.client_id
		WHERE statuses.status_id = clients.client_status_id) AS Count
FROM statuses

/*GROUP BY realisation*/
SELECT statuses.status_name, COUNT(cards.card_id) AS number_of_cards 
	FROM cards
	INNER JOIN accounts ON accounts.account_id = cards.account_id
	INNER JOIN clients ON clients.client_id = accounts.client_id
	INNER JOIN statuses ON statuses.status_id = clients.client_id
GROUP BY statuses.status_name
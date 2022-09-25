USE [BankingDB]
GO

SELECT bank_name FROM departments
	INNER JOIN banks on banks.bank_id = departments.bank_id
	INNER JOIN cities on cities.city_id = departments.city_id
WHERE cities.city_name= 'Minsk'


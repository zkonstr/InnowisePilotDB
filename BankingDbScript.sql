/*DB creation*/
USE master
GO

IF NOT EXISTS (
   SELECT name
   FROM sys.databases
   WHERE name = N'BankingDB'
)
CREATE DATABASE [BankingDB]
GO

/*Tables*/

USE [BankingDB]
GO

CREATE TABLE dbo.banks(
	bank_id int  NOT NULL,
	bank_name varchar(25) NOT NULL,
	CONSTRAINT PK_banks PRIMARY KEY CLUSTERED (bank_id)
)
GO

CREATE TABLE dbo.cities(
	city_id int NOT NULL,
	city_name varchar(25) NOT NULL,
	CONSTRAINT PK_city PRIMARY KEY CLUSTERED (city_id)
)
GO

CREATE TABLE dbo.departments(
	departments_id int NOT NULL,
	city_id int NOT NULL,
	bank_id int NOT NULL,
	CONSTRAINT FK_bank_department_reference FOREIGN KEY (bank_id) REFERENCES dbo.banks (bank_id),
	CONSTRAINT FK_city_department_reference FOREIGN KEY (city_id) REFERENCES dbo.cities (city_id),
	CONSTRAINT PK_departments PRIMARY KEY CLUSTERED (departments_id)
)
GO

CREATE TABLE dbo.statuses(
	status_id int NOT NULL,
	status_name varchar(25) NOT NULL,
	CONSTRAINT PK_statuses PRIMARY KEY CLUSTERED (status_id)
)
GO

CREATE TABLE dbo.clients(
	client_id int NOT NULL,
	client_name varchar(25) NOT NULL,
	client_surname varchar(25) NOT NULL,
	client_status_id int NOT NULL,
	CONSTRAINT FK_status_client_reference FOREIGN KEY (client_status_id) REFERENCES dbo.statuses (status_id),
	CONSTRAINT PK_clients PRIMARY KEY CLUSTERED (client_id)
)
GO

CREATE TABLE dbo.accounts(
	account_id int NOT NULL,
	amount decimal(19,2) NOT NULL,
	client_id int NOT NULL,
	bank_reference_id int NOT NULL,
	CONSTRAINT PK_accounts PRIMARY KEY CLUSTERED (account_id),
	CONSTRAINT FK_bank_account_reference FOREIGN KEY (bank_reference_id) REFERENCES dbo.banks (bank_id),
	CONSTRAINT FK_client_account_reference FOREIGN KEY (client_id) REFERENCES dbo.clients (client_id)
)
GO

CREATE TABLE dbo.cards(
	card_id int NOT NULL,
	amount decimal(19,2) NOT NULL,
	account_id int NOT NULL,
	CONSTRAINT PK_cards PRIMARY KEY CLUSTERED (card_id),
	CONSTRAINT FK_account_card_reference FOREIGN KEY (account_id) REFERENCES dbo.accounts (account_id)
)
GO

USE [BankingDB]
GO

INSERT INTO [dbo].[banks] ([bank_id], [bank_name]) VALUES(1,'BelarusBank')
INSERT INTO [dbo].[banks] ([bank_id], [bank_name]) VALUES(2,'BelAgroPromBank')
INSERT INTO [dbo].[banks] ([bank_id], [bank_name]) VALUES(3,'PriorBank')
INSERT INTO [dbo].[banks] ([bank_id], [bank_name]) VALUES(4,'AlfaBank')
INSERT INTO [dbo].[banks] ([bank_id], [bank_name]) VALUES(5,'GazPromBank')
GO

INSERT INTO [dbo].[cities] ([city_id], [city_name]) VALUES(1,'Minsk')
INSERT INTO [dbo].[cities] ([city_id], [city_name]) VALUES(2,'Brest')
INSERT INTO [dbo].[cities] ([city_id], [city_name]) VALUES(3,'Vitebsk')
INSERT INTO [dbo].[cities] ([city_id], [city_name]) VALUES(4,'Grodno')
INSERT INTO [dbo].[cities] ([city_id], [city_name]) VALUES(5,'Mogilev')
GO

INSERT INTO [dbo].[departments] ([departments_id],[city_id],[bank_id]) VALUES(1,1,1)
INSERT INTO [dbo].[departments] ([departments_id],[city_id],[bank_id]) VALUES(2,4,1)
INSERT INTO [dbo].[departments] ([departments_id],[city_id],[bank_id]) VALUES(3,1,4)
INSERT INTO [dbo].[departments] ([departments_id],[city_id],[bank_id]) VALUES(4,3,3)
INSERT INTO [dbo].[departments] ([departments_id],[city_id],[bank_id]) VALUES(5,2,5)
GO

INSERT INTO [dbo].[statuses] ([status_id],[status_name]) VALUES(1,'employed')
INSERT INTO [dbo].[statuses] ([status_id],[status_name]) VALUES(2,'unemployed')
INSERT INTO [dbo].[statuses] ([status_id],[status_name]) VALUES(3,'senior')
INSERT INTO [dbo].[statuses] ([status_id],[status_name]) VALUES(4,'underage')
INSERT INTO [dbo].[statuses] ([status_id],[status_name]) VALUES(5,'disabled')
GO

INSERT INTO [dbo].[clients] 
([client_id],[client_name],[client_surname],[client_status_id]) 
VALUES(1,'Jack','Dilan',1)

INSERT INTO [dbo].[clients] 
([client_id],[client_name],[client_surname],[client_status_id]) 
VALUES(2,'Ivan','Ivanov',1)

INSERT INTO [dbo].[clients] 
([client_id],[client_name],[client_surname],[client_status_id]) 
VALUES(3,'Sergey','Petrov',2)

INSERT INTO [dbo].[clients] 
([client_id],[client_name],[client_surname],[client_status_id]) 
VALUES(4,'Daniel','Cho',5)

INSERT INTO [dbo].[clients] 
([client_id],[client_name],[client_surname],[client_status_id]) 
VALUES(5,'Max','Fisher',4)

GO

INSERT INTO [dbo].[accounts]
([account_id],[amount],[client_id],[bank_reference_id])
VALUES(1,15009.21,1,4)

INSERT INTO [dbo].[accounts]
([account_id],[amount],[client_id],[bank_reference_id])
VALUES(2,7812.36,2,1)

INSERT INTO [dbo].[accounts]
([account_id],[amount],[client_id],[bank_reference_id])
VALUES(3,15.52,3,2)

INSERT INTO [dbo].[accounts]
([account_id],[amount],[client_id],[bank_reference_id])
VALUES(4,1200.92,1,5)

INSERT INTO [dbo].[accounts]
([account_id],[amount],[client_id],[bank_reference_id])
VALUES(5,150,5,3)
GO

INSERT INTO [dbo].[cards] ([card_id],[amount],[account_id]) VALUES(1,1000,1)
INSERT INTO [dbo].[cards] ([card_id],[amount],[account_id]) VALUES(2,10,3)
INSERT INTO [dbo].[cards] ([card_id],[amount],[account_id]) VALUES(3,3,3)
INSERT INTO [dbo].[cards] ([card_id],[amount],[account_id]) VALUES(4,100,5)
INSERT INTO [dbo].[cards] ([card_id],[amount],[account_id]) VALUES(5,10,5)
GO

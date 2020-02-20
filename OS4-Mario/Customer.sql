CREATE TABLE [dbo].[Customer]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(50) NULL, 
    [Phone] VARCHAR(50) NULL, 
    [Email] VARCHAR(50) NULL, 
    [IsActive] BIT NULL, 
)

CREATE TABLE [dbo].[Restaurant]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(50) NOT NULL,
    [City] VARCHAR(50) NOT NULL, 
    [Address] VARCHAR(MAX) NOT NULL, 
    [Country] VARCHAR(50) NOT NULL
)

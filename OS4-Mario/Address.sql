CREATE TABLE [dbo].[Address]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [City] VARCHAR(50) NOT NULL, 
    [Country] VARCHAR(50) NOT NULL, 
    [PostalCode] VARCHAR(15) NOT NULL, 
)

CREATE TABLE [dbo].[Dough]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(50) NOT NULL, 
    [Diameter] INT NOT NULL, 
    [Description] VARCHAR(MAX) NOT NULL, 
    [Surcharge] MONEY NOT NULL, 
    [Available] BIT NOT NULL
)

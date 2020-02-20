CREATE TABLE [dbo].[Deliverer]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [FirstName] VARCHAR(50) NOT NULL, 
    [LastName] VARCHAR(50) NOT NULL, 
    [RestaurantId] INT NULL, 
)

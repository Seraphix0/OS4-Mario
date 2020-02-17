CREATE TABLE [dbo].[Deliverer]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [FirstName] VARCHAR(50) NOT NULL, 
    [LastName] VARCHAR(50) NOT NULL, 
    [RestaurantId] INT NULL, 
    [DelivererAvailabilityId] INT NULL, 
    CONSTRAINT [FK_Deliverer_ToRestaurant] FOREIGN KEY ([RestaurantId]) REFERENCES [Restaurant]([Id]), 
)

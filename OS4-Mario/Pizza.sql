CREATE TABLE [dbo].[Pizza]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Custom] BIT NOT NULL, 
	[Available] BIT NOT NULL,
    [Price] VARCHAR(50) NOT NULL, 
    [DoughId] INT NOT NULL, 
    [SauceId] INT NOT NULL, 
    [ProductId] INT NOT NULL, 
    [HalfCompositionPizzaId] INT NULL, 
    CONSTRAINT [FK_Pizza_ToPizza] FOREIGN KEY ([HalfCompositionPizzaId]) REFERENCES [Pizza]([Id]), 
    CONSTRAINT [FK_Pizza_ToDough] FOREIGN KEY ([DoughId]) REFERENCES [Dough]([Id]),
    CONSTRAINT [FK_Pizza_ToSauce] FOREIGN KEY ([SauceId]) REFERENCES [Sauce]([Id]), 
    CONSTRAINT [FK_Pizza_ToProduct] FOREIGN KEY ([ProductId]) REFERENCES [Product]([Id])
)

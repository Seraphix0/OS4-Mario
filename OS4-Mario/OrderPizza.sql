CREATE TABLE [dbo].[OrderPizza]
(
	[OrderId] INT NOT NULL, 
    [PizzaId] INT NOT NULL, 
    PRIMARY KEY ([PizzaId], [OrderId]), 
    CONSTRAINT [FK_OrderPizza_ToOrder] FOREIGN KEY ([OrderId]) REFERENCES [Order]([Id]), 
    CONSTRAINT [FK_OrderPizza_ToPizza] FOREIGN KEY ([PizzaId]) REFERENCES [Pizza]([Id])
)

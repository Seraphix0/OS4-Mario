CREATE TABLE [dbo].[OrderProduct]
(
	[OrderId] INT NOT NULL , 
    [ProductId] INT NOT NULL, 
    [Count] INT NOT NULL DEFAULT 1, 
    PRIMARY KEY ([OrderId], [ProductId]), 
    CONSTRAINT [FK_OrderProduct_ToOrder] FOREIGN KEY ([OrderId]) REFERENCES [Order]([Id]), 
    CONSTRAINT [FK_OrderProduct_ToProduct] FOREIGN KEY ([ProductId]) REFERENCES [Product]([Id])
)

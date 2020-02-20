CREATE TABLE [dbo].[OrderItem]
(
	[OrderId] INT NOT NULL , 
    [OrderItemId] INT NOT NULL, 
    [Amount] INT NOT NULL, 
    [ProductId] INT NOT NULL, 
    PRIMARY KEY ([OrderId],[OrderItemId]), 
    CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY ([OrderId]) REFERENCES [Order]([Id]), 
    CONSTRAINT [FK_OrderItem_Product] FOREIGN KEY ([ProductId]) REFERENCES [Product]([Id])
)

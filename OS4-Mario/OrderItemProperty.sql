CREATE TABLE [dbo].[OrderItemProperty]
(
	[OrderItemId] INT NOT NULL , 
    [PropertyKey] VARCHAR(50) NOT NULL, 
    [PropertyValue] VARCHAR(MAX) NOT NULL, 
    PRIMARY KEY ([OrderItemId], [PropertyKey]), 
    CONSTRAINT [FK_OrderItemProperty_OrderItem] FOREIGN KEY ([OrderItemId]) REFERENCES [OrderITem]([OrderItemId])
)

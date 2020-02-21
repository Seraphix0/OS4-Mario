CREATE TABLE [dbo].[OrderItemProperty]
(
	[OrderId] INT NOT NULL, 
    [OrderItemId] INT NOT NULL,
    [PropertyKey] VARCHAR(50) NOT NULL, 
    [PropertyValue] VARCHAR(MAX) NOT NULL, 
    PRIMARY KEY ([OrderId], [PropertyKey], [OrderItemId]), 
    CONSTRAINT [FK_OrderItemProperty_OrderItem] FOREIGN KEY ([OrderId],[OrderItemId]) REFERENCES [OrderItem]([OrderId],[OrderItemId])
);

GO CREATE TRIGGER ControlIngredients
ON [dbo].[OrderItemProperty]
FOR INSERT
AS
BEGIN
    DECLARE @orderItemId INT;
    SELECT @orderItemId = inserted.OrderItemId FROM inserted;

    DECLARE @productId INT;
    SELECT @productId = (SELECT OrderItem.ProductId FROM OrderItem WHERE OrderItem.OrderItemId = @orderItemId)
    
    IF ((SELECT 1 FROM ProductProperty WHERE ProductProperty.PropertyKey = 'custom' AND ProductProperty.PropertyValue = 'true' AND ProductProperty.ProductId = @productId) = 1)
        IF ((SELECT COUNT(*) FROM OrderItemProperty WHERE OrderItemProperty.PropertyKey LIKE 'ingredient%' AND OrderItemProperty.OrderItemId = @orderItemId) > 4)
            RAISERROR('Too many ingredients!', 16, 1)

END;

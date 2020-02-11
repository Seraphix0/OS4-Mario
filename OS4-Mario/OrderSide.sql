CREATE TABLE [dbo].[OrderSide]
(
	[OrderId] INT NOT NULL , 
    [SideId] INT NOT NULL, 
    PRIMARY KEY ([OrderId], [SideId]), 
    CONSTRAINT [FK_OrderSide_ToOrder] FOREIGN KEY ([OrderId]) REFERENCES [Order]([Id]), 
    CONSTRAINT [FK_OrderSide_ToSide] FOREIGN KEY ([SideId]) REFERENCES [Side]([Id])
)

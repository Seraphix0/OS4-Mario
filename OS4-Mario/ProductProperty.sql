CREATE TABLE [dbo].[ProductProperty]
(
	[ProductId] INT NOT NULL , 
    [PropertyKey] INT NOT NULL, 
    [PropertyValue] INT NOT NULL, 
    PRIMARY KEY ([ProductId], [PropertyKey]), 
    CONSTRAINT [FK_ProductProperty_Product] FOREIGN KEY ([ProductId]) REFERENCES [Product]([id])
)

CREATE TABLE [dbo].[ProductProperty]
(
	[ProductId] INT NOT NULL , 
    [PropertyKey] VARCHAR(50) NOT NULL, 
    [PropertyValue] VARCHAR(MAX) NOT NULL, 
    PRIMARY KEY ([ProductId], [PropertyKey]), 
    CONSTRAINT [FK_ProductProperty_Product] FOREIGN KEY ([ProductId]) REFERENCES [Product]([id])
)

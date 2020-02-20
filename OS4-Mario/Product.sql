CREATE TABLE [dbo].[Product]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(50) NULL, 
	[Description] VARCHAR(50) NULL,
    [Price] MONEY NOT NULL, 
    [DeliverySurcharge] MONEY NOT NULL, 
    [VATpercentage] INT NOT NULL, 
    [CategoryId] INT NOT NULL, 
    CONSTRAINT [FK_Product_Category] FOREIGN KEY ([CategoryId]) REFERENCES [Category]([Id]), 
)

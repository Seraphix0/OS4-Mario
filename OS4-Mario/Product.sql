CREATE TABLE [dbo].[Product]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(50) NULL, 
	[Description] VARCHAR(50) NULL,
    [Price] MONEY NULL, 
    [DeliverySurcharge] MONEY NULL, 
    [Spicy] BIT NULL, 
    [Vegetarian] BIT NULL, 
    [SubCategoryid] INT NULL, 
    CONSTRAINT [FK_Product_ToSubCategoryId] FOREIGN KEY ([SubCategoryId]) REFERENCES [SubCategory]([Id])
)

CREATE TABLE [dbo].[Category]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(50) NULL, 
    [SubCategoryId] INT NULL, 
    CONSTRAINT [FK_Category_SubCategory] FOREIGN KEY ([SubCategoryId]) REFERENCES [Category]([Id])
)

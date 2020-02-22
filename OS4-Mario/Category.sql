CREATE TABLE [dbo].[Category]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(50) NOT NULL, 
    [ParentCategoryId] INT NULL, 
    CONSTRAINT [FK_Category_ParentCategory] FOREIGN KEY ([ParentCategoryId]) REFERENCES [Category]([Id])
)

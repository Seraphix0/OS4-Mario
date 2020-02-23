CREATE TABLE [dbo].[Category]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Name] VARCHAR(50) NOT NULL, 
    [ParentCategoryId] INT NULL, 
    CONSTRAINT [FK_Category_ParentCategory] FOREIGN KEY ([ParentCategoryId]) REFERENCES [Category]([Id])
)

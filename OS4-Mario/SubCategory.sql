CREATE TABLE [dbo].[SubCategory]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(50) NULL, 
    [CategoryId] INT NULL, 
    CONSTRAINT [FK_SubCategory_ToCategory] FOREIGN KEY ([CategoryId]) REFERENCES [Category]([Id])
)

CREATE TABLE [dbo].[Availability]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [IntervalStart] DATETIME NOT NULL, 
    [IntervalEnd] DATETIME NULL
)

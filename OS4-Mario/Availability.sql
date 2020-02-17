CREATE TABLE [dbo].[Availability]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [IntervalStart] DATETIME NOT NULL, 
    [IntervalEnd] DATETIME NULL
)

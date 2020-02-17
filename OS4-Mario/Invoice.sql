CREATE TABLE [dbo].[Invoice]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [DateTime] DATETIME NULL, 
    [Price] MONEY NULL, 
    [VAT] MONEY NULL, 
    [Discount] MONEY NULL, 
    [ToPay] MONEY NULL
)

CREATE TABLE [dbo].[Coupon]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Discount] MONEY NULL, 
    [Used] BIT NOT NULL DEFAULT 0
)

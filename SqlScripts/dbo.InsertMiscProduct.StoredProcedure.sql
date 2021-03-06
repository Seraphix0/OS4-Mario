/****** Object:  StoredProcedure [dbo].[InsertMiscProduct]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMiscProduct]
@ProductName varchar(50),
@ProductDescription varchar(50) = NULL,
@CategoryId int,
@Price money,
@isSpicy bit,
@isVegetarian bit
AS

INSERT INTO Product(Name, Description, CategoryId, Price) VALUES(@ProductName, @ProductDescription, @CategoryId, @Price)

DECLARE @ProductId int
SELECT @ProductId = SCOPE_IDENTITY()
SET IDENTITY_INSERT [ProductProperty] ON

INSERT INTO ProductProperty(ProductId, PropertyKey, PropertyValue) VALUES(@ProductId, 'spicy', CAST(@isSpicy AS varchar))
INSERT INTO ProductProperty(ProductId, PropertyKey, PropertyValue) VALUES(@ProductId, 'vegetarian', CAST(@isVegetarian AS varchar))
GO

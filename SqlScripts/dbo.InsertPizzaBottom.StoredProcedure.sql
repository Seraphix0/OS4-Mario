/****** Object:  StoredProcedure [dbo].[InsertPizzaBottom]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPizzaBottom]
@Name varchar(50),
@Diameter varchar(50),
@Description varchar(50) = NULL,
@Surcharge varchar(50)
AS

SET NOCOUNT ON;

IF NOT EXISTS (SELECT * FROM Category WHERE Category.Name = 'Bodem')
	EXEC InsertCategory @Name = 'Bodem', @IsSubCategory = 0

DECLARE @CategoryId int
SELECT @CategoryId = (SELECT Id FROM Category WHERE Category.Name = 'Bodem')

INSERT INTO Product(Name, Description, Price, CategoryId) VALUES(@Name, @Description, @Surcharge, @CategoryId)

DECLARE @ProductId int
SET @ProductId = SCOPE_IDENTITY()
SET IDENTITY_INSERT [ProductProperty] ON

INSERT INTO ProductProperty(ProductId, PropertyKey, PropertyValue) VALUES(@ProductId, 'diameter', @Diameter)
GO

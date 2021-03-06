/****** Object:  StoredProcedure [dbo].[InsertPizzaIngredient]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPizzaIngredient]
@ProductName varchar(50),
@ProductDescription varchar(50) = NULL,
@ProductPrice money,
@DeliverySurcharge money,
@CategoryId int,
@isSpicy bit,
@isVegetarian bit,
@IngredientName varchar(50),
@PizzaSauce varchar(50)
AS

DECLARE @ProductId int

IF NOT EXISTS (SELECT * FROM Product WHERE Product.Name = @ProductName AND Product.Description = @ProductDescription)
	BEGIN
		INSERT INTO Product(Name, Description, Price, DeliverySurcharge, CategoryId)
		VALUES(@ProductName, @ProductDescription, @ProductPrice, @DeliverySurcharge, @CategoryId)
		
		SELECT @ProductId = SCOPE_IDENTITY() 

		INSERT INTO ProductProperty(ProductId, PropertyKey, PropertyValue) VALUES(@ProductId, 'spicy', CAST(@isSpicy AS varchar))
		INSERT INTO ProductProperty(ProductId, PropertyKey, PropertyValue) VALUES(@ProductId, 'vegetarian', CAST(@isVegetarian AS varchar))
		INSERT INTO ProductProperty(ProductId, PropertyKey, PropertyValue) VALUES(@ProductId, 'pizza.sauce', @PizzaSauce)
	END
ELSE
	SELECT @ProductId = (SELECT Id FROM Product WHERE Product.Name = @ProductName AND Product.Description = @ProductDescription)


INSERT INTO ProductProperty(ProductId, PropertyKey, PropertyValue) VALUES(@ProductId, 'ingredient.name', @IngredientName)

GO

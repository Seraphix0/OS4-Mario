/****** Object:  StoredProcedure [dbo].[InsertOrderItemToOrder]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrderItemToOrder]
@OrderId int,
@ProductName varchar(50),
@PizzaSauce varchar(50) = NULL,
@DoughName varchar(50) = NULL,
@Price float,
@Quantity int
AS
	SET NOCOUNT ON
	DECLARE @ProductId int
	SELECT @ProductId = (SELECT Id FROM Product WHERE Product.Name = @ProductName)

	IF @ProductId IS NOT NULL
		BEGIN
			DECLARE @OrderItemId int
			INSERT INTO OrderItem(ProductId, OrderId, Quantity, Price) VALUES(@ProductId, @OrderId, @Quantity, @Price)
			SELECT @OrderItemId = SCOPE_IDENTITY()

			IF @DoughName IS NOT NULL
				BEGIN
					DECLARE @DoughProductId int
					SELECT @DoughProductId = (SELECT Id FROM Product WHERE Product.Name = @DoughName)
					INSERT INTO OrderItemProperty(OrderItemId, PropertyKey, PropertyValue) VALUES(@OrderItemId, 'dough.productId', @DoughProductId)
				END


			SELECT * INTO #TempTable 
			FROM ProductProperty
			WHERE ProductProperty.ProductId = @ProductId
			
			DECLARE @ProductPropertyId int

			WHILE EXISTS (SELECT * FROM #TempTable)
			BEGIN
				SELECT @ProductPropertyId = (SELECT TOP 1 Id FROM #TempTable ORDER BY Id ASC)
				DECLARE @PropertyKey varchar(50)
				DECLARE @PropertyValue varchar(MAX)

				SELECT @PropertyKey = (SELECT PropertyKey FROM #TempTable WHERE #TempTable.Id = @ProductPropertyId)
				SELECT @PropertyValue = (SELECT PropertyValue FROM #TempTable WHERE #TempTable.Id = @ProductPropertyId)
				IF @PizzaSauce IS NOT NULL
					BEGIN
						IF @PropertyKey = 'pizza.sauce' AND @PropertyValue != @PizzaSauce
							BEGIN
								INSERT INTO OrderItemProperty(OrderItemId, PropertyKey, PropertyValue) VALUES(@OrderItemId, @PropertyKey, @PizzaSauce)
								INSERT INTO OrderItemProperty(OrderItemId, PropertyKey, PropertyValue) VALUES(@OrderItemId, 'custom', 'true')
							END
						ELSE
							INSERT INTO OrderItemProperty(OrderItemId, PropertyKey, PropertyValue) VALUES(@OrderItemId, @PropertyKey, @PropertyValue)
							
					END
				ELSE
					INSERT INTO OrderItemProperty(OrderItemId, PropertyKey, PropertyValue) VALUES(@OrderItemId, @PropertyKey, @PropertyValue)

				DELETE #TempTable WHERE #TempTable.Id = @ProductPropertyId
			END
		END
	ELSE
		RAISERROR('Product doesnt exist!', 16, 1)
GO

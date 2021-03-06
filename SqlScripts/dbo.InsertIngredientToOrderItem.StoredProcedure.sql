/****** Object:  StoredProcedure [dbo].[InsertIngredientToOrderItem]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertIngredientToOrderItem]
@OrderItemId int,
@IngredientName varchar(50)
AS
	SET NOCOUNT ON
	INSERT INTO OrderItemProperty(OrderItemId, PropertyKey, PropertyValue) VALUES(@OrderItemId, 'ingredient.name', @IngredientName)

	IF NOT EXISTS (SELECT * FROM OrderItemProperty WHERE OrderItemProperty.OrderItemId = @OrderItemId AND OrderItemProperty.PropertyKey = 'custom' AND OrderItemProperty.PropertyValue = 'value')
		INSERT INTO OrderItemProperty(OrderItemId, PropertyKey, PropertyValue) VALUES(@OrderItemId, 'custom', 'true') 
	
GO

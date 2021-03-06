/****** Object:  StoredProcedure [dbo].[InsertOrder]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrder]
@StoreName varchar(50),
@CustomerName varchar(50),
@CustomerPhone varchar(50),
@CustomerMail varchar(50),
@City varchar(50),
@Address varchar(50),
@PlacementDate varchar(50),
@DeliveryDate varchar(50),
@DeliveryTime varchar(50) = NULL,
@TotalPrice float,
@Discount float,
@CouponName varchar(50) = NULL
AS
	SET NOCOUNT ON
	DECLARE @PlacementDateToUse date
	SELECT @PlacementDateToUse = CONVERT(date, @PlacementDate, 105)

	DECLARE @DeliveryDateToUse date
	SELECT @DeliveryDateToUse = CONVERT(date, @DeliveryDate, 105)

	DECLARE @DeliveryTimeToUse time
	IF @DeliveryTime IS NOT NULL
		SELECT @DeliveryTimeToUse = CONVERT(time, @DeliveryTime, 8)
	ELSE
		SET @DeliveryTimeToUse = NULL
	
	

	DECLARE @StoreId int
	IF EXISTS (SELECT * FROM Restaurant WHERE Restaurant.Name = @StoreName)
		SELECT @StoreId =  (SELECT Id FROM Restaurant WHERE Restaurant.Name = @StoreName)
	ELSE
		RAISERROR('Store doesnt exist!', 16, -1)

	DECLARE @CustomerId int
	IF NOT EXISTS(SELECT * FROM Customer WHERE Customer.Name = @CustomerName AND Customer.Email = @CustomerMail)
		BEGIN
			INSERT INTO Customer(Name, Email, Phone, IsActive) VALUES(@CustomerName, @CustomerMail, @CustomerPhone, 1)
			SELECT @CustomerId = SCOPE_IDENTITY()
		END
	ELSE
		SELECT @CustomerId = (SELECT Id FROM Customer WHERE Customer.Name = @CustomerName AND Customer.Email = @CustomerMail)


	DECLARE @AddressId int
	IF NOT EXISTS (SELECT * FROM Address WHERE Address.Street = @Address AND Address.City = @City)
		BEGIN
			INSERT INTO Address(Street, City) VALUES(@Address, @City)
			SELECT @AddressId = SCOPE_IDENTITY()
		END
	ELSE
		SELECT @AddressId = (SELECT Id FROM Address WHERE Address.Street = @Address AND Address.City = @City)

	DECLARE @CustomerAddressIdLink int
	IF NOT EXISTS (SELECT * FROM CustomerAddressLink WHERE AddressIdLink = @AddressId AND CustomerIdLink = @CustomerId)
		BEGIN
			INSERT INTO CustomerAddressLink(CustomerIdLink, AddressIdLink) VALUES(@CustomerId, @AddressId)
			SELECT @CustomerAddressIdLink = SCOPE_IDENTITY()
		END
	ELSE
		SELECT @CustomerAddressIdLink = (SELECT Id FROM CustomerAddressLink WHERE AddressIdLink = @AddressId AND CustomerIdLink = @CustomerId)



	DECLARE @CouponId int = NULL
	IF @CouponName != NULL
		BEGIN
				IF NOT EXISTS(SELECT * FROM Coupon WHERE Coupon.Description = @CouponName)
					BEGIN
						INSERT INTO Coupon(Description) VALUES (@CouponName)
						SELECT @CouponId = SCOPE_IDENTITY()
					END
				ELSE
					SELECT @CouponId = (SELECT Id FROM Coupon WHERE Coupon.Description = @CouponName)
		END
	

	INSERT INTO [Order](PlacementDate, DeliveryDate, Price, Discount, CustomerAddressIdLink, DeliveryTime, CouponId, RestaurantId) VALUES(@PlacementDateToUse, @DeliveryDateToUse, @TotalPrice, @Discount, @CustomerAddressIdLink, @DeliveryTimeToUse, @CouponId, @StoreId)
		

GO

/****** Object:  StoredProcedure [dbo].[CreateRestaurant]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateRestaurant]
@Description varchar(50),
@Street varchar(50),
@City varchar(50),
@CountryCode varchar(50),
@PostalCode varchar(50),
@PhoneNumber varchar(50)
AS

SET NOCOUNT ON;
INSERT INTO dbo.Address(City, CountryCode, PostalCode, Street)
VALUES (@City, @CountryCode, @PostalCode, @Street)

DECLARE @AddressId int
SET @AddressId = SCOPE_IDENTITY()

INSERT INTO dbo.Restaurant(Name, AddressId, PhoneNumber)
VALUES (@Description, @AddressId, @PhoneNumber)
GO

CREATE TABLE [dbo].[Order]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [PlacementDate] DATETIME NOT NULL, 
    [DeliveryDateTime] DATETIME NULL, 
    [DelivererId] INT NULL, 
    [InvoiceId] INT NOT NULL,
    [CouponId] INT NULL, 
    [Price] MONEY NOT NULL, 
    [VAT] MONEY NOT NULL, 
    [Discount] MONEY NOT NULL, 
    [AddressIdLink] INT NOT NULL, 
    [CustomerIdLink] INT NOT NULL, 
    CONSTRAINT [FK_Order_ToCoupon] FOREIGN KEY ([CouponId]) REFERENCES [Coupon]([Id]), 
    CONSTRAINT [FK_Order_ToDeliverer] FOREIGN KEY ([DelivererId]) REFERENCES [Deliverer]([Id]), 
    CONSTRAINT [FK_Order_ToCustomerAddressLink] FOREIGN KEY ([AddressIdLink], [CustomerIdLink]) REFERENCES [CustomerAddressLink]([CustomerIdLink], [AddressIdLink]) 
)

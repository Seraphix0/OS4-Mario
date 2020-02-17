CREATE TABLE [dbo].[Order]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [DateTime] DATETIME NOT NULL, 
    [DeliveryDateTime] DATETIME NULL, 
    [DelivererId] INT NULL, 
    [InvoiceId] INT NOT NULL,
    [CustomerId] INT NULL,
    [CouponId] INT NULL, 
    CONSTRAINT [FK_Order_ToCoupon] FOREIGN KEY ([CouponId]) REFERENCES [Coupon]([Id]), 
    CONSTRAINT [FK_Order_ToDeliverer] FOREIGN KEY ([DelivererId]) REFERENCES [Deliverer]([Id]), 
    CONSTRAINT [FK_Order_ToCustomer] FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([Id]), 
    CONSTRAINT [FK_Order_ToInvoice] FOREIGN KEY ([InvoiceId]) REFERENCES [Invoice]([Id]),
)

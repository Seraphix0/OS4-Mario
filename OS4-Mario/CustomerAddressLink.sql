CREATE TABLE [dbo].[CustomerAddressLink]
(
	[CustomerIdLink] INT NOT NULL , 
    [AddresIdLink] INT NOT NULL, 
    PRIMARY KEY ([AddresIdLink], [CustomerIdLink])
)

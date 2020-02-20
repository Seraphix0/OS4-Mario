CREATE TABLE [dbo].[CustomerAddressLink]
(
	[CustomerIdLink] INT NOT NULL , 
    [AddressIdLink] INT NOT NULL, 
    PRIMARY KEY ([AddressIdLink], [CustomerIdLink])
)

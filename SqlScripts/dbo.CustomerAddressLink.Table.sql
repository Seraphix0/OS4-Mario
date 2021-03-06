/****** Object:  Table [dbo].[CustomerAddressLink]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAddressLink](
	[CustomerIdLink] [int] NOT NULL,
	[AddressIdLink] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CustomerAddressLink] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNQ_CustomerAddressLink] UNIQUE NONCLUSTERED 
(
	[CustomerIdLink] ASC,
	[AddressIdLink] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerAddressLink]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddressLink_Address] FOREIGN KEY([AddressIdLink])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[CustomerAddressLink] CHECK CONSTRAINT [FK_CustomerAddressLink_Address]
GO
ALTER TABLE [dbo].[CustomerAddressLink]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddressLink_CustomerAddressLink] FOREIGN KEY([Id])
REFERENCES [dbo].[CustomerAddressLink] ([Id])
GO
ALTER TABLE [dbo].[CustomerAddressLink] CHECK CONSTRAINT [FK_CustomerAddressLink_CustomerAddressLink]
GO

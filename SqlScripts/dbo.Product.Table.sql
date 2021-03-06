/****** Object:  Table [dbo].[Product]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Price] [money] NOT NULL,
	[DeliverySurcharge] [money] NOT NULL,
	[VATpercentage] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK__Product__3214EC075B96DCB8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_DeliverySurcharge]  DEFAULT ((0)) FOR [DeliverySurcharge]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_VATpercentage]  DEFAULT ((23)) FOR [VATpercentage]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO

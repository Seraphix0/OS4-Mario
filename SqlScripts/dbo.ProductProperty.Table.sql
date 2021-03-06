/****** Object:  Table [dbo].[ProductProperty]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductProperty](
	[ProductId] [int] NOT NULL,
	[PropertyKey] [varchar](50) NOT NULL,
	[PropertyValue] [varchar](max) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ProductProperty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductProperty]  WITH CHECK ADD  CONSTRAINT [FK_ProductProperty_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductProperty] CHECK CONSTRAINT [FK_ProductProperty_Product]
GO

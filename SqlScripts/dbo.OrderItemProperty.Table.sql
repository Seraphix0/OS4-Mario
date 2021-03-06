/****** Object:  Table [dbo].[OrderItemProperty]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItemProperty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyKey] [varchar](50) NOT NULL,
	[PropertyValue] [varchar](max) NOT NULL,
	[OrderItemId] [int] NOT NULL,
 CONSTRAINT [PK_OrderItemProperty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderItemProperty]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemProperty_OrderItem] FOREIGN KEY([OrderItemId])
REFERENCES [dbo].[OrderItem] ([Id])
GO
ALTER TABLE [dbo].[OrderItemProperty] CHECK CONSTRAINT [FK_OrderItemProperty_OrderItem]
GO

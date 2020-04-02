/****** Object:  Table [dbo].[overige-producten]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[overige-producten](
	[categorie] [nvarchar](255) NULL,
	[subcategorie] [nvarchar](255) NULL,
	[productnaam] [nvarchar](255) NULL,
	[productomschrijving] [nvarchar](255) NULL,
	[prijs] [money] NULL,
	[spicy] [nvarchar](255) NULL,
	[vegetarisch] [nvarchar](255) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[pizza-ingredienten]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pizza-ingredienten](
	[categorie] [nvarchar](255) NULL,
	[subcategorie] [nvarchar](255) NULL,
	[productnaam] [nvarchar](255) NULL,
	[productomschrijving] [nvarchar](255) NULL,
	[prijs] [money] NULL,
	[bezorgtoeslag] [money] NULL,
	[spicy] [nvarchar](255) NULL,
	[vegetarisch] [nvarchar](255) NULL,
	[beschikbaar] [nvarchar](255) NULL,
	[aantalkeer_ingredient] [float] NULL,
	[ingredientnaam] [nvarchar](255) NULL,
	[pizzasaus_standaard] [nvarchar](255) NULL,
	[F13] [nvarchar](255) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MarioOrderData_1000]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarioOrderData_1000](
	[Winkelnaam] [nvarchar](50) NULL,
	[Klantnaam] [nvarchar](50) NULL,
	[TelefoonNr] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Adres] [nvarchar](50) NULL,
	[Woonplaats] [nvarchar](50) NULL,
	[Besteldatum] [nvarchar](50) NULL,
	[AfleverType] [nvarchar](50) NULL,
	[AfleverDatum] [nvarchar](50) NULL,
	[AfleverMoment] [nvarchar](50) NULL,
	[Product] [nvarchar](50) NOT NULL,
	[PizzaBodem] [nvarchar](50) NULL,
	[PizzaSaus] [nvarchar](50) NULL,
	[Prijs] [nvarchar](50) NOT NULL,
	[Aantal] [nvarchar](50) NOT NULL,
	[Extra_Ingrediënten] [nvarchar](100) NULL,
	[Prijs_Extra_Ingrediënten] [nvarchar](50) NULL,
	[Regelprijs] [nvarchar](50) NOT NULL,
	[Totaalprijs] [nvarchar](50) NULL,
	[Gebruikte_Coupon] [nvarchar](50) NULL,
	[Coupon_Korting] [nvarchar](50) NULL,
	[Te_Betalen] [nvarchar](50) NULL
) ON [PRIMARY]
GO

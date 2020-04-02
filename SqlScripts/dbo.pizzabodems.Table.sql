/****** Object:  Table [dbo].[pizzabodems]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pizzabodems](
	[naam] [nvarchar](255) NOT NULL,
	[diameter] [float] NOT NULL,
	[omschrijving] [nvarchar](255) NOT NULL,
	[toeslag] [money] NULL,
	[beschikbaar] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO

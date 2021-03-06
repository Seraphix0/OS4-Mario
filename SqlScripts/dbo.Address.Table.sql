/****** Object:  Table [dbo].[Address]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[CountryCode] [varchar](50) NULL,
	[PostalCode] [varchar](15) NULL,
	[Street] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Address__3214EC07FE06AD35] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

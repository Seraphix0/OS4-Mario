CREATE TABLE [dbo].[Sheet1$] (
	[categorie] nvarchar(255) NOT NULL,
	[subcategorie] nvarchar(255) NOT NULL,
	[productnaam] nvarchar(255) NOT NULL,
	[productomschrijving] nvarchar(255) NOT NULL,
	[prijs] money NOT NULL,
	[bezorgtoeslag] money NOT NULL,
	[spicy] nvarchar(255) NOT NULL,
	[vegetarisch] nvarchar(255) NOT NULL,
	[beschikbaar] nvarchar(255) NOT NULL,
	[aantalkeer_ingredient] float NOT NULL,
	[ingredientnaam] nvarchar(255) NOT NULL,
	[pizzasaus_standaard] nvarchar(255) NOT NULL
);
GO
USE [Mario]
GO

/****** Object: Table [dbo].[pizza_ingredienten] Script Date: 23-2-2020 15:32:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[pizza_ingredienten] (
    [categorie]             NVARCHAR (255) NOT NULL,
    [subcategorie]          NVARCHAR (255) NOT NULL,
    [productnaam]           NVARCHAR (255) NOT NULL,
    [productomschrijving]   NVARCHAR (255) NOT NULL,
    [prijs]                 MONEY          NOT NULL,
    [bezorgtoeslag]         MONEY          NOT NULL,
    [spicy]                 NVARCHAR (255) NOT NULL,
    [vegetarisch]           NVARCHAR (255) NOT NULL,
    [beschikbaar]           NVARCHAR (255) NOT NULL,
    [aantalkeer_ingredient] FLOAT (53)     NOT NULL,
    [ingredientnaam]        NVARCHAR (255) NOT NULL,
    [pizzasaus_standaard]   NVARCHAR (255) NOT NULL
);



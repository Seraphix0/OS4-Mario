USE [Mario]
GO

/****** Object: Table [dbo].[overige_producten] Script Date: 23-2-2020 15:32:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[overige_producten] (
    [categorie]           NVARCHAR (255) NULL,
    [subcategorie]        NVARCHAR (255) NULL,
    [productnaam]         NVARCHAR (255) NULL,
    [productomschrijving] NVARCHAR (255) NULL,
    [prijs]               MONEY          NULL,
    [spicy]               NVARCHAR (255) NULL,
    [vegetarisch]         NVARCHAR (255) NULL
);



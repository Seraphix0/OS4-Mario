USE [Mario]
GO

/****** Object: Table [dbo].[MarioOrderData] Script Date: 23-2-2020 15:30:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MarioOrderData] (
    [Winkelnaam]               NVARCHAR (50)  NULL,
    [Klantnaam]                NVARCHAR (50)  NULL,
    [TelefoonNr]               NVARCHAR (50)  NULL,
    [Email]                    NVARCHAR (50)  NULL,
    [Adres]                    NVARCHAR (50)  NULL,
    [Woonplaats]               NVARCHAR (50)  NULL,
    [Besteldatum]              NVARCHAR (50)  NULL,
    [AfleverType]              NVARCHAR (50)  NULL,
    [AfleverDatum]             NVARCHAR (50)  NULL,
    [AfleverMoment]            NVARCHAR (50)  NULL,
    [Product]                  NVARCHAR (50)  NOT NULL,
    [PizzaBodem]               NVARCHAR (50)  NULL,
    [PizzaSaus]                NVARCHAR (50)  NULL,
    [Prijs]                    NVARCHAR (50)  NOT NULL,
    [Aantal]                   NVARCHAR (50)  NOT NULL,
    [Extra_Ingrediënten]       NVARCHAR (100) NULL,
    [Prijs_Extra_Ingrediënten] NVARCHAR (50)  NULL,
    [Regelprijs]               NVARCHAR (50)  NOT NULL,
    [Totaalprijs]              NVARCHAR (50)  NULL,
    [Gebruikte_Coupon]         NVARCHAR (50)  NULL,
    [Coupon_Korting]           NVARCHAR (50)  NULL,
    [Te_Betalen]               NVARCHAR (50)  NULL
);



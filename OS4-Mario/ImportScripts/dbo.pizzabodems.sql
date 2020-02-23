USE [Mario]
GO

/****** Object: Table [dbo].[pizzabodems] Script Date: 23-2-2020 15:33:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[pizzabodems] (
    [naam]         NVARCHAR (255) NULL,
    [diameter]     FLOAT (53)     NULL,
    [omschrijving] NVARCHAR (255) NULL,
    [toeslag]      MONEY          NOT NULL,
    [beschikbaar]  NVARCHAR (255) NULL
);



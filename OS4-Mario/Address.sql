﻿CREATE TABLE [dbo].[Address]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [City] VARCHAR(50) NOT NULL, 
    [Country] VARCHAR(50) NOT NULL, 
    [PostalCode] VARCHAR(15) NOT NULL, 
)
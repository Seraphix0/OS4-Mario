INSERT INTO [dbo].[Category] (
	Name
)
SELECT DISTINCT categorie
FROM [dbo].[pizza_ingredienten];
GO

-- Maar dan...
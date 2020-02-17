CREATE TABLE [dbo].[PizzaIngredient]
(
	[PizzaId] INT NOT NULL , 
    [IngredientId] INT NOT NULL, 
    [Count] INT NOT NULL DEFAULT 1, 
    [Extra] BIT NOT NULL DEFAULT 0, 
    PRIMARY KEY ([PizzaId], [IngredientId]), 
    CONSTRAINT [FK_PizzaIngredient_ToPizza] FOREIGN KEY ([PizzaId]) REFERENCES [Pizza]([Id]), 
    CONSTRAINT [FK_PizzaIngredient_ToIngredient] FOREIGN KEY ([IngredientId]) REFERENCES [Ingredient]([Id])
)

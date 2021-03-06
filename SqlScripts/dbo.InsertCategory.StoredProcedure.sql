/****** Object:  StoredProcedure [dbo].[InsertCategory]    Script Date: 30-Mar-20 7:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCategory]
@Name varchar(50),
@SubCategoryName varchar(50) = NULL,
@IsSubcategory bit
AS
DECLARE @CategoryId int
IF (@SubCategoryName IS NULL)
	SELECT @CategoryId = (SELECT Id FROM Category WHERE Category.Name = @Name)
ELSE
	SELECT @CategoryId = (SELECT Id FROM Category WHERE Category.Name = @SubCategoryName)
	

IF NOT EXISTS (SELECT * FROM Category WHERE Category.Id = @CategoryId)
	IF (@IsSubcategory = 0)
		INSERT INTO Category(Name) VALUES (@Name)
	ELSE
		BEGIN
			DECLARE @ParentId int
			SELECT @ParentId = (SELECT Id FROM Category WHERE Category.Name = @Name)

			IF NOT EXISTS (SELECT * FROM Category WHERE Category.Id = @ParentId)
				INSERT INTO Category(Name) VALUES (@Name)

			INSERT INTO Category(Name, ParentCategoryId) VALUES(@SubCategoryName, @ParentId)
		END	

	


GO

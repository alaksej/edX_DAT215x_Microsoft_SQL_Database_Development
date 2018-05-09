--CREATE PROCEDURE Reports.GetProductColors
--AS
--SET NOCOUNT ON;
--BEGIN
--	SELECT Distinct Color
--	FROM SalesLT.Product
--	WHERE Color IS NOT NULL;
--END
--GO

--DROP PROCEDURE Reports.GetProductsAndModels;
--GO

--CREATE PROCEDURE Reports.GetProductsAndModels
--AS
--SET NOCOUNT ON;
--BEGIN

--	SELECT 
--		P.ProductID
--		, P.Name
--		, P.ProductNumber
--		, P.SellStartDate
--		, P.SellEndDate 
--		, P.Color
--		, PM.ProductModelID
--		, PD.Description
--	FROM SalesLT.Product AS P
--		LEFT JOIN SalesLT.ProductModel AS PM
--		ON P.ProductModelID = PM.ProductModelID
--		LEFT JOIN SalesLT.ProductModelProductDescription AS PMPD
--		ON PM.ProductModelID = PMPD.ProductModelID
--		LEFT JOIN SalesLT.ProductDescription AS PD
--		ON PMPD.ProductDescriptionID = PM.ProductModelID
--	ORDER BY p.ProductID,pm.ProductModelID
	
--END
--GO

--EXEC Reports.GetProductsAndModels
--GO

ALTER PROCEDURE Reports.GetProductsByColor
@Color varchar(20) = NULL
AS
BEGIN
	SELECT ProductID, Name, ListPrice AS Price, Color, Size
	FROM SalesLT.Product
	WHERE (Color = @Color) OR (Color IS NULL AND @Color IS NULL)
	ORDER BY Name
END
GO

EXEC Reports.GetProductsByColor NULL
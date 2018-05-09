--CREATE VIEW vOnlineProducts
--AS
--SELECT ProductID, Name, ProductNumber, ISNULL(Color, 'N/A') AS Color, Size, ListPrice, Weight
--FROM SalesLT.Product
--WHERE SellStartDate < GETDATE() 
--	AND  SellEndDate > GETDATE();

--GO

--CREATE VIEW vAvialableModels
--AS
--SELECT P.ProductID AS 'Product ID'
--	, P.Name AS 'Product Name'
--	, PM.ProductModelID AS 'Product Model ID'
--	, PM.Name AS 'Product Model'
--FROM SalesLT.Product AS P
--	JOIN SalesLT.ProductModel AS PM
--	ON P.ProductModelID = PM.ProductModelID
--WHERE SellStartDate < GETDATE() 
--	AND  SellEndDate > GETDATE();
--GO


CREATE VIEW vCustomer
AS
SELECT CustomerID, FirstName, LastName, PasswordHash, PasswordSalt
FROM SalesLT.Customer;

GO

SELECT * FROM vCustomer
ORDER BY CustomerID;
GO



INSERT INTO vCustomer
(FirstName, LastName, PasswordHash, PasswordSalt)
VALUES ('Ed', 'Kish', 'Uw8sEe4ZGPvigEQEiSJ57Bd77SB77S', 'cjsKU4w=');
GO

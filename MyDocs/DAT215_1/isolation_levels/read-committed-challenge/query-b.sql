-- query-B-step1
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
GO
SELECT ProductID, ListPrice 
FROM SalesLT.Product
WHERE ProductID= 680;
GO

-- query-B-step2
SELECT ProductID, ListPrice 
FROM SalesLT.Product
WHERE ProductID= 680;
GO
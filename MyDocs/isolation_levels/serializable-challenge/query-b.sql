-- query-B-step1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
SELECT ProductID, ListPrice 
FROM SalesLT.Product
WHERE ProductID= 680;
GO


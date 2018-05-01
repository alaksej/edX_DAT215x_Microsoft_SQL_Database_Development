SET TRANSACTION ISOLATION LEVEL REPEATABLE READ 
GO
-- Connection 1
BEGIN TRANSACTION
SELECT CustomerID, Phone 
FROM SalesLT.Customer
WHERE Phone < '111-555-2222';
GO

-- Connection 2
--INSERT SalesLT.Customer
--(NameStyle, Title, FirstName, MiddleName, LastName, Suffix, CompanyName, SalesPerson,
--EmailAddress, Phone, PasswordHash, PasswordSalt, ModifiedDate)
--SELECT NameStyle, Title, FirstName, MiddleName, LastName, Suffix, N'Demo Sports' AS CompanyName, SalesPerson,
--EmailAddress, N'111-555-1111' AS Phone, PasswordHash, PasswordSalt, GETDATE() AS ModifiedDate
--FROM SalesLT.Customer
--WHERE CustomerID = 2

-- Connection 1
-- now returns one record more,
-- although still the same transaction
-- that's a phantom read
SELECT CustomerID, Phone 
FROM SalesLT.Customer
WHERE Phone < '111-555-2222';
COMMIT

-- Solution
-- Use SERIALIZABLE isolation level
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
-- Connection 1
BEGIN TRANSACTION
SELECT CustomerID, Phone 
FROM SalesLT.Customer
WHERE Phone < '111-555-2222';
GO

-- Connection 2
-- will be blocked until the transaction is committed
--INSERT SalesLT.Customer
--(NameStyle, Title, FirstName, MiddleName, LastName, Suffix, CompanyName, SalesPerson,
--EmailAddress, Phone, PasswordHash, PasswordSalt, ModifiedDate)
--SELECT NameStyle, Title, FirstName, MiddleName, LastName, Suffix, N'Demo Sports' AS CompanyName, SalesPerson,
--EmailAddress, N'111-555-1111' AS Phone, PasswordHash, PasswordSalt, GETDATE() AS ModifiedDate
--FROM SalesLT.Customer
--WHERE CustomerID = 2

-- Connection 1
SELECT CustomerID, Phone 
FROM SalesLT.Customer
WHERE Phone < '111-555-2222';
COMMIT

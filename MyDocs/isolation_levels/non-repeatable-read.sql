--SELECT name, snapshot_isolation_state, is_read_committed_snapshot_on FROM sys.databases;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO

-- Connection 1
-- we start a transaction
BEGIN TRANSACTION
SELECT CustomerID, Phone 
FROM SalesLT.Customer WITH (READCOMMITTEDLOCK)
WHERE CustomerID = 2;
GO

-- Connection 2
-- in another connection, we update the value
--UPDATE SalesLT.Customer
--	SET Phone = N'333-555-3333'
--	WHERE CustomerID = 2;


-- Connection 1
-- will select 333-555-3333 
-- although we have not committed the transaction
-- this is called - non-repeatable read
SELECT CustomerID, Phone 
FROM SalesLT.Customer WITH (READCOMMITTEDLOCK)
WHERE CustomerID = 2;
COMMIT

-- Solution:

-- To avoid this situation we can change the 
-- transaction's isolation level:
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ 
GO
-- Connection 1
-- we start a transaction
BEGIN TRANSACTION
SELECT CustomerID, Phone 
FROM SalesLT.Customer
WHERE CustomerID = 2;
GO

-- Connection 2
	--UPDATE SalesLT.Customer
	--SET Phone = N'444-555-4444'
	--WHERE CustomerID = 2;


SELECT CustomerID, Phone 
FROM SalesLT.Customer
WHERE CustomerID = 2;
COMMIT
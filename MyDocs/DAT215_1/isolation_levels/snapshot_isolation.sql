-- Snapshot (optimistic) isolation is used for Azure databases


-- Conn1
UPDATE SalesLT.Customer SET Phone = N'170-555-0127' WHERE CustomerID = 2
GO

SELECT CustomerID, Phone FROM SalesLT.Customer WHERE CustomerID = 2

-- Conn2
--BEGIN TRANSACTION
--	UPDATE SalesLT.Customer
--	SET Phone = N'616-555-6161'
--	WHERE CustomerID = 2;

-- Conn1
SET TRANSACTION ISOLATION LEVEL SNAPSHOT
GO
BEGIN TRANSACTION
	UPDATE SalesLT.Customer
	SET Phone = N'777-555-7777'
	WHERE CustomerID = 2;

-- Conn2
-- COMMIT
-- Results in an error: 
-- Snapshot isolation transaction aborted due to update conflict. 
-- You cannot use snapshot isolation to access table 'SalesLT.Customer' 
-- directly or indirectly in database 'AdventureWorksLT' to update, delete, 
-- or insert the row that has been modified or deleted by another transaction. 
-- Retry the transaction or change the isolation level for the update/delete statement.

-- The transaction is rolled back

SELECT @@TRANCOUNT;
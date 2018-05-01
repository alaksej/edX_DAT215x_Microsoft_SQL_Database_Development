-- query-A-step1
BEGIN TRANSACTION
	UPDATE SalesLT.Product
	SET ListPrice= 11111
	WHERE ProductID= 680;
GO

-- Run query-B-step1 here
-- Note that the query is blocked.

-- query-A-step2
ROLLBACK;
GO

-- Note that Query B can now complete.

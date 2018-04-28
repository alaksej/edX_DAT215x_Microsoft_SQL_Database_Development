-- query-A-step1
BEGIN TRANSACTION
	UPDATE SalesLT.Product
	SET ListPrice= 11111
	WHERE ProductID= 680;
GO

-- Run query-B-step1 here

-- query-A-step2
ROLLBACK;
GO

-- Run query-B-step2 here

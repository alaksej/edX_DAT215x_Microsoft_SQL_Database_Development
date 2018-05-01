-- query-A-step1
BEGIN TRANSACTION
	UPDATE SalesLT.Product
	SET ListPrice= 11111
	WHERE ProductID= 680;
GO

-- Run query-B-step1 here
-- The select will return the original ListPrice
-- Note that this is the default behavior in Azure
-- The default behavior in an on-premises system is to block the second transaction.

-- query-A-step2
ROLLBACK;
GO

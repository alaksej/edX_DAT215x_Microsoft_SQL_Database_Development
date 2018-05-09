CREATE SCHEMA Production;
GO

CREATE TABLE Production.ProductAudit
(
	AuditID INT IDENTITY(1,1),
	ProductID INT,
	UpdateTime datetime2,
	ModifyingUser varchar(30),
	OriginalListPrice decimal(18, 2),
	NewListPrice decimal(18, 2),
	CONSTRAINT [PK_ProductAudit_AuditID] PRIMARY KEY CLUSTERED (AuditID),
	CONSTRAINT [FK_ProductAudit_Product_ProductID] FOREIGN KEY ([ProductID]) 
		REFERENCES [SalesLT].[Product] ([ProductID])
)
GO

DROP TRIGGER TR_ProductListPrice_Update
GO

CREATE TRIGGER TR_ProductListPrice_Update
ON SalesLT.Product
AFTER UPDATE
AS
BEGIN
	INSERT INTO Production.ProductAudit
	(
		ProductID,
		UpdateTime,
		ModifyingUser,
		OriginalListPrice,
		NewListPrice
	)
	SELECT
		I.ProductID,
		SYSDATETIME(),
		ORIGINAL_LOGIN(),
		d.ListPrice,
		I.ListPrice
	FROM inserted AS I
		INNER JOIN deleted AS d
		ON d.ProductID = I.ProductID
	WHERE d.ListPrice > 1000 OR I.ListPrice > 1000;
END
GO

UPDATE SalesLT.Product
SET ListPrice = 99
WHERE ProductID BETWEEN 749 and 753;

GO


SELECT * FROM SalesLT.ProductAudit;
GO


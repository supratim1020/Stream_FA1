CREATE FUNCTION ufn_GenerateNewProductId()
RETURNS CHAR(4)
AS
BEGIN
	DECLARE @ProductId CHAR(4)
	-- According to our Business Logic, If our product table is empty, the first ProductId should be 'P101'. Otherwise, we have to fetch maximum ProductId increamented by 1 and then send as the output.

	-- Check if the Products table is empty. If so, let's generate first ProductId 'P101'.
	IF NOT EXISTS(SELECT ProductId FROM Products)
		SET @ProductId='P101'
	
	ELSE
		SELECT @ProductId='P' + CAST(CAST(SUBSTRING(MAX(ProductId),2,3) AS INT)+1 AS CHAR) FROM Products
	
	RETURN @ProductId
END
GO

-- All the user defined function should be prefixed with schema name dbo.
SELECT dbo.ufn_GenerateNewProductId()

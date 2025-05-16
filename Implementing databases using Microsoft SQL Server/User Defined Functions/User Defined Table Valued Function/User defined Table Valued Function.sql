-- =========================================== INLINE TABLE VALUED FUNCTION ===========================================
-- Inline Table valued function don't have a body
CREATE FUNCTION ufn_GetProductDetails(
	@CategoryId TINYINT
)
RETURNS TABLE
AS
	RETURN (SELECT ProductId,ProductName,Price,QuantityAvailable FROM Products WHERE CategoryId=@CategoryId)	   -- Parenthesis is optional
GO
-- In case of Table valued function schema name(dbo) isn't required
SELECT * FROM ufn_GetProductDetails(1)
GO
-- Table valued function only can be executed using SELECT statement not using EXEC


-- =========================================== MULTI-STATEMENT TABLE VALUED FUNCTION ===========================================
-- Multi statement table valued function
-- Multiple statement inside function body
CREATE FUNCTION ufn_GetProductDetailsByCategory(
	@CategoryId TINYINT
)
RETURNS @ProductDetails TABLE(ProductId CHAR(4),ProductName VARCHAR(50), Price NUMERIC(8), QuantityAvailable INT)	-- You need to specify a table variable. Then you have to mention the structure of the table with datatype
AS
BEGIN
	INSERT @ProductDetails
	SELECT ProductId,ProductName,Price,QuantityAvailable FROM Products WHERE CategoryId=@CategoryId

	RETURN
	-- Last statement should be RETURN
	-- if you remember in case of scalar functions or store procs, you can say return followed by which variable or value you're returning. But in case of multistatement table valued function, it is always this table variable that gets returned. So we'll just be specifying RETURN SQL server will automatically understand that this particular table variable has to be returned. 
END
GO

SELECT * FROM ufn_GetProductDetailsByCategory(1)
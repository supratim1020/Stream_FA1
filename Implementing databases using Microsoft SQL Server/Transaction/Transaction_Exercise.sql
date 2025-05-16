-- Stored Procedure - Exercise: 1
CREATE PROCEDURE usp_AddProduct(
    @ProductID CHAR(4),
    @ProductName VARCHAR(50),
    @CategoryID TINYINT,
    @Price NUMERIC(8),
    @QuantityAvailable INT
)
AS
BEGIN
    BEGIN TRY
        IF @ProductID IS NULL
            RETURN -1
        IF LEFT(@ProductID,1)<>'P' OR LEN(@ProductID)<4
            RETURN -2
        IF @ProductName IS NULL
            RETURN -3
        IF @CategoryID IS NULL
            RETURN -4
        IF NOT EXISTS(SELECT CategoryId FROM Categories WHERE CategoryId=@CategoryID)
            RETURN -5
        IF @Price<=0 OR @Price IS NULL
            RETURN -6
        IF @QuantityAvailable<=0 OR @QuantityAvailable IS NULL
            RETURN -7

        INSERT INTO Products(ProductId, ProductName, CategoryId,Price,QuantityAvailable) VALUES(@ProductID, @ProductName, @CategoryID, @Price, @QuantityAvailable)
        RETURN 1
    END TRY
    
    BEGIN CATCH
        RETURN -99
    END CATCH
END

DECLARE @ResultValue INT;
EXEC @ResultValue=usp_AddProduct
                @ProductID='P158',
                @ProductName='Laptop',
                @CategoryID=1,
                @Price=50000,
                @QuantityAvailable=10
SELECT @ResultValue AS Result

DROP PROCEDURE usp_AddProduct
GO

-- Stored Procedure - Exercise: 2
CREATE PROCEDURE usp_UpdateBalance(
    @CardNumber NUMERIC(16),
    @NameOnCard VARCHAR(40),
    @CardType CHAR(6),
    @CVVNumber NUMERIC(3),
    @ExpiryDate DATE,
    @Price DECIMAL(10,2)
)
AS
BEGIN
    DECLARE @CurrentBalance NUMERIC(10,2)
    BEGIN TRY
        IF  @CardNumber IS NULL
            RETURN -1
        IF NOT EXISTS(SELECT CardNumber FROM CardDetails WHERE CardNumber=@CardNumber)
            RETURN -2
        IF NOT EXISTS(SELECT 1 FROM CardDetails WHERE NameOnCard=@NameOnCard AND CardNumber=@CardNumber) OR @NameOnCard IS NULL
            RETURN -3
        IF NOT EXISTS(SELECT 1 FROM CardDetails WHERE CardType=@CardType AND CardNumber=@CardNumber) OR @CardType IS NULL
            RETURN -4
        IF NOT EXISTS(SELECT 1 FROM CardDetails WHERE CVVNumber=@CVVNumber AND CardNumber=@CardNumber) OR @CVVNumber IS NULL
            RETURN -5
        IF NOT EXISTS(SELECT 1 FROM CardDetails WHERE ExpiryDate=@ExpiryDate AND CardNumber=@CardNumber)
            RETURN -6
        
        -- Set balance
        SELECT @CurrentBalance=Balance FROM CardDetails WHERE CardNumber=@CardNumber
        IF @CurrentBalance<@Price
            RETURN -8

        -- Update balance
        UPDATE CardDetails SET Balance=Balance-@Price WHERE CardNumber=@CardNumber
        RETURN
        END TRY

    BEGIN CATCH
        RETURN -99
    END CATCH
END

DECLARE @ReturnValue INT
EXEC @ReturnValue=usp_UpdateBalance
                    @CardNumber=1146665296881890,
                    @NameOnCard='Manuel',
                    @CardType = 'M     ',
                    @CVVNumber =137,
                    @ExpiryDate='3/18/2035',
                    @Price=1000.00
GO


-- Stored Procedure - Exercise: 3
CREATE PROCEDURE usp_InsertPurchaseDetails(
    @EmailId VARCHAR(50),
    @ProductId CHAR(4),
    @QuantityPurchased INT,
    @PurchaseId BIGINT OUT
)
AS
BEGIN
    DECLARE @QuantityAvailable INT
    BEGIN TRY
        IF @EmailId IS NULL
            RETURN -1
        IF @ProductId IS NULL
            RETURN -3
        IF NOT EXISTS(SELECT EmailId FROM Users WHERE EmailId=@EmailId)
            RETURN -2
        IF NOT EXISTS(SELECT ProductId FROM Products WHERE ProductId=@ProductId)
            RETURN -4
        IF @QuantityPurchased IS NULL OR @QuantityPurchased<0
            RETURN -5

        -- fetching available quantity
        SELECT @QuantityAvailable=QuantityAvailable FROM Products WHERE ProductId=@ProductId
        IF(@QuantityPurchased<=@QuantityAvailable)
        BEGIN
            BEGIN TRAN
            UPDATE Products SET QuantityAvailable=QuantityAvailable-@QuantityPurchased WHERE ProductId=@ProductId
            SET @PurchaseId=IDENT_CURRENT('PurchaseDetails')+1
            COMMIT
            RETURN 1
        END
    END TRY
    BEGIN CATCH
        ROLLBACK
		SET @PurchaseId=0
        RETURN -99
    END CATCH
END
GO

DECLARE @ReturnValue INT, @PurchaseIdValue INT

EXEC @ReturnValue=usp_InsertPurchaseDetails
                    @EmailId = 'Davis@gmail.com',
                    @ProductId ='P110',
                    @QuantityPurchased =2,
                    @PurchaseIdValue = @PurchaseIdValue OUT;

PRINT @ReturnValue
PRINT @PurchaseIdValue

DROP PROC usp_InsertPurchaseDetails




-- Stored Procedure - Exercise: 4

-- State 1 is Error State
DECLARE @Var1 INT=100, @Var2 INT=0
SELECT @Var1/@Var2 AS RESULT

-- Try Catch
BEGIN TRY
    DECLARE @Var1 INT=100, @Var2 INT=0
    SELECT @Var1/@Var2 AS RESULT
END TRY
BEGIN CATCH
    SELECT  ERROR_LINE() AS 'LineNumber',
            ERROR_NUMBER() AS 'ErrorNumber',
            ERROR_MESSAGE() AS 'ErrorMessage',
            ERROR_STATE() AS 'ErrorState',
            ERROR_SEVERITY() AS 'ErrorSeverity'
END CATCH

-- Throw Exception
BEGIN TRY
    DECLARE @Var1 INT=100, @Var2 INT=0
    IF(@Var2=0)
        -- Above 50000 and , 1 is the error state
        THROW 62000, 'Divisor can not br zero', 1
    ELSE
        SELECT @Var1/@Var2 AS RESULT
END TRY
BEGIN CATCH
    SELECT  ERROR_LINE() AS 'LineNumber',
            ERROR_NUMBER() AS 'ErrorNumber',
            ERROR_MESSAGE() AS 'ErrorMessage',
            ERROR_STATE() AS 'ErrorState',
            ERROR_SEVERITY() AS 'ErrorSeverity'
END CATCH


-- Exception Handling in QuickKart

UPDATE CardDetails SET Balance=19000000.00 WHERE CardNumber='2122490035590690'

BEGIN
    DECLARE @Price NUMERIC(8), @Amount NUMERIC(8), @Balance NUMERIC(8),
            @CardNumber NUMERIC(16,0)='2122490035590690', @ProductId CHAR(4)='P131',
            @QuantityPurchased INT=129, @QuantityAvailable INT,
            @EmailId VARCHAR(50)='Margaret@gmail.com'
    BEGIN TRY
        IF NOT EXISTS (SELECT ProductId FROM Products WHERE ProductId=@ProductId)
        BEGIN
            PRINT 'ProductId does not exist'
            RETURN
        END

        IF NOT EXISTS (SELECT EmailId FROM Users WHERE EmailId=@EmailId)
        BEGIN
            PRINT 'EmailId does not exist'
            RETURN
        END

        IF @QuantityPurchased<=0
        BEGIN
            PRINT 'Quantity purchased should be greater than zero'
            RETURN
        END

        IF NOT EXISTS (SELECT CardNumber FROM CardDetails WHERE CardNumber=@CardNumber)
        BEGIN
            PRINT 'CardNumber does not exist'
            RETURN
        END

        -- Calculate the total amount
        SELECT @Price=Price FROM Products WHERE ProductId=@ProductId
        SET @Amount=@Price*@QuantityPurchased
        SELECT @Balance=Balance FROM CardDetails WHERE CardNumber=@CardNumber
        IF (@Balance>=@Amount)
            BEGIN
                -- Update the Balance
                UPDATE CardDetails SET Balance=Balance-@Amount WHERE CardNumber=@CardNumber
                -- Update Quantity
                UPDATE Products SET QuantityAvailable=QuantityAvailable-@QuantityPurchased WHERE ProductId=@ProductId
                -- Insert purchase details into PurchaseDetails table
                INSERT INTO PurchaseDetails(EmailId,ProductId,QuantityPurchased,DateOfPurchase) VALUES (@EmailId,@ProductId,@QuantityPurchased,DEFAULT)
            END
        ELSE
            BEGIN
                PRINT 'Insufficient Balance'
                PRINT -99
                RETURN
            END
    END TRY
    BEGIN CATCH
        BEGIN
            PRINT 'Some error occured'
            SELECT ERROR_LINE() AS 'LineNumber',
            ERROR_NUMBER() AS 'ErrorNumber',
            ERROR_MESSAGE() AS 'ErrorMessage'
        END
    END CATCH
END

/*
QA=19
QP=want to purchase = 219
QA = QA - QP < 0
    = 19-219 --> Exception
*/

select * from Products where ProductId='P131'
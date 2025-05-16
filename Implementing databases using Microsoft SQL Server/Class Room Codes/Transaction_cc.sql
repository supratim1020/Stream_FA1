/*
BEGIN TRAN
    -- How to print active transactions are there
    SELECT @@TRANCOUNT AS TRANCOUNT
*/


-- Nested Transaction
-- All data will be saved into the database only when outer transaction is comitted
BEGIN TRAN
    BEGIN TRAN
        -- How to print active transactions are there
        SELECT @@TRANCOUNT AS TRANCOUNT        -- 2 active transactions
    COMMIT TRAN        -- commits inner
    SELECT @@TRANCOUNT AS TRANCOUNT        -- 1 active transaction
COMMIT TRAN        -- commit outer
SELECT @@TRANCOUNT AS TRANCOUNT        -- 0 active transactions

-- COMMIT TRAN
-- It will give error if we want to commit a transaction but no active transactions are there


-- Rollback the transaction
BEGIN TRAN
    BEGIN TRAN
        SELECT @@TRANCOUNT AS TRANCOUNT        -- 2
    ROLLBACK TRAN    -- It will rollback all the transactions
SELECT @@TRANCOUNT AS TRANCOUNT        -- 0

-- Give transaction name and create a savepoint, and rollback upto savepoint
BEGIN TRAN
    BEGIN TRAN
        SELECT @@TRANCOUNT AS TRANCOUNT        -- 2
        SAVE TRAN S1
        COMMIT TRAN
        ROLLBACK TRAN S1
        SELECT @@TRANCOUNT AS TRANCOUNT        -- 1
COMMIT TRAN
SELECT @@TRANCOUNT AS TRANCOUNT                -- 0


select * from CardDetails where cardnumber='2122490035590690'
-- Create Transaction in QuickKart
BEGIN
    DECLARE @Price NUMERIC(8), @Amount NUMERIC(8), @Balance NUMERIC(8),
            @CardNumber NUMERIC(16,0)='2122490035590690', @ProductId CHAR(4)='P128',
            @QuantityPurchased INT=201, @QuantityAvailable INT,
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
            BEGIN TRAN
                -- Update the Balance
                UPDATE CardDetails SET Balance=Balance-@Amount WHERE CardNumber=@CardNumber
                -- Insert purchase details into PurchaseDetails table
                INSERT INTO PurchaseDetails(EmailId,ProductId,QuantityPurchased,DateOfPurchase) VALUES (@EmailId,@ProductId,@QuantityPurchased,DEFAULT)
                -- Update Quantity
                UPDATE Products SET QuantityAvailable=QuantityAvailable-@QuantityPurchased WHERE ProductId=@ProductId
            COMMIT
            PRINT 'Batch is executed successfully'
            PRINT 1
            RETURN
            END
        ELSE
            BEGIN
                PRINT 'Insufficient Balance'
                --PRINT -99
                RETURN
            END
    END TRY
    BEGIN CATCH
        BEGIN
            PRINT 'Some error occured'
            ROLLBACK
        END
    END CATCH
END


UPDATE CardDetails SET Balance=19000000.00 WHERE CardNumber='2122490035590690'

select * from PurchaseDetails
select * from Products
select * from CardDetails where CardNumber='2122490035590690'
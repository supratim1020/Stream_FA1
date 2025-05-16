/*
    >> To implement batches for QuickKart requirements
    >> To use variables in the batches

*/

-- *********************** Applyling Batch for QuickKart requirements ***********************

-- You will now implement the requirement of "Purchasing products" by trying out the following demo steps
BEGIN
    DECLARE @Price NUMERIC(8), @Amount NUMERIC(8), @Balance NUMERIC(8),
            @CardNumber NUMERIC(16,0)='2122490035590690',
            @ProductId CHAR(4)='P131', @QtyPurchased INT=1,
            @QtyAvailable INT, @EmailId VARCHAR(50)='Margaret@gmail.com'
    /*
    Check the following conditions:

    >> Check if the selected product exists in the Products table or not. If it does not exist, print an appropriate message and return from the batch.

    >> Check if the email id exists in the Users table or not. If it does not exist, print an appropriate message and return from the batch.

    >> Check if the quantity purchased is less than or equal to zero. If so, print an appropriate message and return from the batch.

    >> Check if the entered card number exists in the CardDetails table or not. If not, then print an appropriate message and return from the batch.
    */
    IF NOT EXISTS(SELECT ProductId FROM Products WHERE ProductId=@ProductId)
        BEGIN
            PRINT 'Product id does not exist'
            RETURN
        END
    
    IF NOT EXISTS(SELECT EmailId FROM Users WHERE EmailId=@EmailId)
        BEGIN
            PRINT 'Email id does not exist'
            RETURN
        END
    
    IF @QtyPurchased<=0
        BEGIN
            PRINT 'Quantity purchased should be greater than 0'
            RETURN
        END

    IF NOT EXISTS(SELECT CardNumber FROM CardDetails WHERE CardNumber=@CardNumber)
        BEGIN
            PRINT 'Card number does not exist'
            RETURN
        END
    
    -- Fetch the price of the chosen product from the table Products using the ProductId
    SELECT @Price=Price FROM Products WHERE ProducId=@ProductId
    
    -- Fetch the available balance for the user from the table CardDetails using the CardNumber
    SELECT @Balance=Balance FROM CardDetails WHERE CardNumber=@CardNumber
    
    -- Calculate the bill amount by multiplying the variables @Price and @QtyPurchased, and store it in the variable @Amount.
    SET @Amount=@Price*@QtyPurchased
    
    -- Now check if the balance in the user's card is greater than or equal to the bill amount. 
    IF(@Balance >= @Amount)
        BEGIN
            -- If yes, then start the batch for the IF statement and deduct the amount from the user's card.
            UPDATE CardDetails SET Balance=Balance-@Amount WHERE CardNumber=@CardNumber

            -- Insert the details for the purchase in the PurchaseDetails table
            INSERT INTO PurchaseDetails(EmailId,ProductId,QuantityPurchased,DateOfPurchase) VALUES(@EmailId,@ProductId,@QuantityPurchased,DEFAULT)

            -- Update the quantity of the purchased product in the Products table accordingly. 
            UPDATE Products SET QuantityAvailable=QuantityAvailable-@QtyPurchased WHERE ProductId=@ProductId

            -- Display an appropriate message and return from the batch.
            PRINT 'Batch executed successfully'
            PRINT 1
            RETURN
        END
    
    -- In the ELSE block, print an appropriate message, which here, signifies that there is insufficient balance. Also, return from the batch. And terminate the outer batch using the keyword END.
    ELSE
    BEGIN
        PRINT 'Insufficient Balance'
        RETURN
    END
END
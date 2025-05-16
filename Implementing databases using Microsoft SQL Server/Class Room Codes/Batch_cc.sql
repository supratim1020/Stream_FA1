BEGIN
    DECLARE @Price NUMERIC(8)=200, @Quantity TINYINT=2, @TotalAmount NUMERIC(8)
    SET @TotalAmount=@Price*@Quantity
    PRINT @TotalAmount
END



/*
@TotalAmount
>0 and <1000    5%
>=1000 and <2000    
*/
BEGIN
    DECLARE @Price NUMERIC(8)=200, @Quantity TINYINT=2, @TotalAmount NUMERIC(8)
    SET @TotalAmount=@Price*@Quantity
    IF @TotalAmount>0 AND @TotalAmount<1000
        SET @TotalAmount=@TotalAmount*0.95
    ELSE IF @TotalAmount>=1000 AND @TotalAmount<2000
        SET @TotalAmount=@TotalAmount*0.90
    ELSE
        SET @TotalAmount=@TotalAmount*0.80
    PRINT @TotalAmount
END



-- Using Case
BEGIN
    DECLARE @Price NUMERIC(8)=200, @Quantity TINYINT=2, @TotalAmount NUMERIC(8)
    SET @TotalAmount=@Price*@Quantity

    SET @TotalAmount=
        CASE
            WHEN @TotalAmount>0 AND @TotalAmount<1000
                THEN @TotalAmount*0.95
            WHEN @TotalAmount>=1000 AND @TotalAmount<2000
                THEN @TotalAmount*0.90
            ELSE @TotalAmount*0.80
        END

    PRINT @TotalAmount
END


/*
Update Balance in CardDetails
Update Quantity in Products
Insert purchase details record into PurchaseDetails

ProductId --> Products
EmailId --> Users
QuantityPurchased > 0
CardNumber --> CardDetails
*/
BEGIN
    DECLARE @Price NUMERIC(8), @Amount NUMERIC(8), @Balance NUMERIC(8),
            @CardNumber NUMERIC(16,0)='2122490035590690', @ProductId CHAR(4)='P131',
            @QuantityPurchased INT=1, @QuantityAvailable INT,
            @EmailId VARCHAR(50)='Margaret@gmail.com'
    
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
END

select * from PurchaseDetails 
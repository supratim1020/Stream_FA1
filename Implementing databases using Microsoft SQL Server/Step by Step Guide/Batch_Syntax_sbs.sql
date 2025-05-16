/*
    To learn about the different forms of batch statements
    To learn about the use of variables
*/

/*
Part 1:-
Given a product's price and quantity of the product to be purchased, write a batch to calculate the total amount by trying out the following steps:
*/
-- Start the batch using the keyword BEGIN. In order to store data, you need variables.
BEGIN
--Variables are of two types - local variables and global variables. The variables can be declared in a batch by the developer. Such variables are called as local variables. 
-- For the above requirement, declare the local variables as follows and assign the values to them.
    
    -- Here @Price, @QuantityPurchased, @TotalAmount are local variables
    DECLARE @Price NUMERIC(8) =200, @QuantityPurchased TINYINT=2, @TotalAmount NUMERIC(8)
    -- Calculate the total amount and display it as highlighted below
    SET @TotalAmount=@Price*@QuantityPurchased
   PRINT @TotalAmount
-- Terminate the batch using the keyword END as highlighted below
END

-- ********************** IF-ELSE **********************
/*
Part 2:-
A discount is to be provided based on the following business logic
    If the total amount is:
        >> greater than 0 and less than 1000, discount is 5%
        >> greater than or equal to 1000 and less than 2000, discount is 10%
        >> greater than or equal to 2000, discount is 20%
*/
-- The above conditional check can be implemented in a batch by using an IF-ELSE statement. 
BEGIN
    DECLARE @Price NUMERIC(8)=200, @QuantityPurchased TINYINT=2, @TotalAmount NUMERIC(8)
    -- Calculate and assign total amount to variable
    SET @TotalAmount=@Price*@QuantityPurchased
    -- Add an IF block to the existing batch for providing discount, if total amount is less than 1000.
    IF @TotalAmount>0 AND @TotalAmount<1000
        SET @TotalAmount=0.95*@TotalAmount
    ELSE IF @TotalAmount>=1000 AND @TotalAmount<2000
        SET @TotalAmount=0.9*@TotalAmount
    ELSE    
        SET @TotalAmount=0.8*@TotalAmount

    PRINT @TotalAmount
END

-- ********************** CASE **********************
-- The above requirement can also be implemented using the CASE expression.

BEGIN
    DECLARE @Price NUMERIC(8)=200, @QuantityPurchased TINYINT=2,
         @TotalAmount NUMERIC(8)
    SET @TotalAmount=@Price*@QuantityPurchased
 -- Add CASE expression to the batch given in Demo as shown and highlighted below. CASE expression should always end with the END keyword
    SET @TotalAmount=
     CASE
        WHEN @TotalAmount>0 AND @TotalAmount<1000
            THEN 0.95*@TotalAmount
        WHEN @TotalAmount>=1000 AND @TotalAmount<2000
           THEN 0.9*@TotalAmount
        ELSE 0.8*@TotalAmount
     END
      PRINT @TotalAmount
END
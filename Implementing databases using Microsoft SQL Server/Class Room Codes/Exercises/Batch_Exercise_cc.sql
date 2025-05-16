CREATE DATABASE QuickKartDB


DROP TABLE Products


CREATE TABLE Products(
    [ProductId] INT CONSTRAINT pk_ProductId PRIMARY KEY,
    [ProductName] VARCHAR(50) NOT NULL

)

BEGIN
    DECLARE @ProductId INT=2000, @Counter INT=1
    WHILE(@Counter<=30)
        BEGIN
            INSERT INTO Products(ProductId,ProductName) VALUES(@ProductId,'Product_'+CAST(@Counter AS VARCHAR))
            SET @ProductId=@ProductId+2
            SET @Counter=@Counter+1
        END
END

select * from Products
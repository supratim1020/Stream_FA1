DROP DATABASE QuickKartDB

CREATE DATABASE QuickKartDB
USE QuickKartDB

-- =========================================== 'Categories' Table ===========================================
CREATE TABLE Categories
(
   CategoryId TINYINT CONSTRAINT pk_CategoryId PRIMARY KEY IDENTITY,
   CategoryName VARCHAR(20) CONSTRAINT uq_CategoryName UNIQUE NOT NULL
)
GO

-- Insertion script for 'Categories'
SET IDENTITY_INSERT Categories ON
INSERT INTO Categories (CategoryId, CategoryName) VALUES (1, 'Motors')
INSERT INTO Categories (CategoryId, CategoryName) VALUES (2, 'Fashion')
INSERT INTO Categories (CategoryId, CategoryName) VALUES (3, 'Electronics')
INSERT INTO Categories (CategoryId, CategoryName) VALUES (4, 'Arts')
INSERT INTO Categories (CategoryId, CategoryName) VALUES (5, 'Home')
INSERT INTO Categories (CategoryId, CategoryName) VALUES (6, 'Sporting Goods')
INSERT INTO Categories (CategoryId, CategoryName) VALUES (7, 'Toys')
SET IDENTITY_INSERT Categories OFF
GO

CREATE TABLE Products
(
    [ProductId] CHAR(4) CONSTRAINT pk_ProductId PRIMARY KEY CONSTRAINT chk_ProductId CHECK(ProductId LIKE 'P%'),
    [ProductName] VARCHAR(50) CONSTRAINT uq_ProductName UNIQUE NOT NULL,
    [CategoryId] TINYINT CONSTRAINT fk_CategoryId REFERENCES Categories(CategoryId),
    [Price] NUMERIC(8) CONSTRAINT chk_Price CHECK(Price>0) NOT NULL,
    [QuantityAvailable] INT CONSTRAINT chk_QuantityAvailable CHECK (QuantityAvailable>=0) NOT NULL
)
GO

BEGIN
    DECLARE 
        @ProductId VARCHAR(4)='P001', 
        @ProductName VARCHAR(50)='Smartphone',
        @CategoryId INT=1, 
        @Price NUMERIC(8)=500, 
        @QuantityAvailable INT=10,
        @ValidationResult INT=1

    IF @ProductId IS NULL
        SET @ValidationResult=-1
    ELSE IF @ProductName IS NULL 
        SET @ValidationResult=-2
    ELSE IF @CategoryId IS NULL 
        SET @ValidationResult=-3
    ELSE IF @Price IS NULL 
        SET @ValidationResult=-4
    ELSE IF @QuantityAvailable IS NULL 
        SET @ValidationResult=-5
    ELSE IF LEFT(@ProductId,1)<>'P' OR LEN(@ProductId)<4
        SET @ValidationResult=-6
    ELSE IF NOT EXISTS (SELECT 1 FROM Categories WHERE CategoryId=@CategoryId)
        SET @ValidationResult=-7
    ELSE IF @Price<=0
        SET @ValidationResult=-8
    ELSE IF @QuantityAvailable<=0
        SET @ValidationResult=-9


    IF @ValidationResult=1
    BEGIN
        BEGIN TRY
            INSERT INTO Products(ProductId,ProductName,CategoryId,Price,QuantityAvailable) VALUES(@ProductId,@ProductName,@CategoryId,@Price,@QuantityAvailable)
        END TRY
        BEGIN CATCH
            SET @ValidationResult=-99
        END CATCH
    END
END

SELECT @ValidationResult AS RESULT
SELECT * FROM Products

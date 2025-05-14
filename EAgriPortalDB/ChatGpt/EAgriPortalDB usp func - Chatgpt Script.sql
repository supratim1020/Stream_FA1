-- Scalar-Valued Functions

-- Check Password Strength
CREATE FUNCTION dbo.fn_CheckPasswordStrength (@Password NVARCHAR(100))
RETURNS BIT
AS
BEGIN
    RETURN (
        SELECT CASE 
            WHEN LEN(@Password) >= 8 AND 
                 @Password LIKE '%[A-Z]%' AND 
                 @Password LIKE '%[0-9]%' AND 
                 @Password LIKE '%[^a-zA-Z0-9]%' THEN 1 
            ELSE 0 
        END
    )
END
GO

-- Validate Email Format
CREATE FUNCTION dbo.fn_IsValidEmail (@Email NVARCHAR(100))
RETURNS BIT
AS
BEGIN
    RETURN (
        SELECT CASE 
            WHEN @Email LIKE '_%@_%._%' THEN 1 
            ELSE 0 
        END
    )
END
GO

-- Table-Valued Functions
-- Get Farmer's Active Crop Listings
CREATE FUNCTION dbo.fn_GetActiveCropsByFarmer (@FarmerID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT CropName, Quantity, PricePerUnit, Status, HarvestDate
    FROM CropAvailabilityDetails
    WHERE FarmerID = @FarmerID AND Status = 'Available'
)
GO

-- Get Trader Orders by Status
CREATE FUNCTION dbo.fn_GetOrdersByStatus (@TraderID INT, @Status NVARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT * 
    FROM Orders
    WHERE TraderID = @TraderID AND OrderStatus = @Status
)
GO

-- Stored Procedures

-- Farmer Registration
CREATE PROCEDURE sp_RegisterFarmer
    @FullName NVARCHAR(100),
    @Email NVARCHAR(100),
    @Password NVARCHAR(100),
    @Phone NVARCHAR(15),
    @Address NVARCHAR(200),
    @DOB DATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Farmers WHERE Email = @Email)
    BEGIN
        RAISERROR('Email already in use.', 16, 1)
        RETURN
    END

    IF dbo.fn_IsValidEmail(@Email) = 0
    BEGIN
        RAISERROR('Invalid email format.', 16, 1)
        RETURN
    END

    IF dbo.fn_CheckPasswordStrength(@Password) = 0
    BEGIN
        RAISERROR('Password must be at least 8 characters long and include uppercase, number, and special character.', 16, 1)
        RETURN
    END

    INSERT INTO Farmers (FullName, Email, PasswordHash, Phone, Address, DOB)
    VALUES (@FullName, @Email, HASHBYTES('SHA2_256', @Password), @Phone, @Address, @DOB)
END
GO

-- Farmer Login
CREATE PROCEDURE sp_LoginFarmer
    @Email NVARCHAR(100),
    @Password NVARCHAR(100)
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM Farmers 
        WHERE Email = @Email 
          AND PasswordHash = HASHBYTES('SHA2_256', @Password)
    )
        SELECT 'Login Successful' AS Message
    ELSE
        RAISERROR('Invalid email or password.', 16, 1)
END
GO


-- Add Crop Listing
CREATE PROCEDURE sp_AddCropListing
    @FarmerID INT,
    @CropName NVARCHAR(100),
    @Quantity DECIMAL(10,2),
    @Unit NVARCHAR(10),
    @PricePerUnit DECIMAL(10,2),
    @HarvestDate DATE,
    @Location NVARCHAR(100),
    @Description NVARCHAR(500)
AS
BEGIN
    IF @Quantity < 0 OR @PricePerUnit < 0
    BEGIN
        RAISERROR('Quantity and Price must be non-negative.', 16, 1)
        RETURN
    END

    INSERT INTO CropAvailabilityDetails (
        FarmerID, CropName, Quantity, Unit, PricePerUnit, 
        HarvestDate, Location, Description, Status
    )
    VALUES (
        @FarmerID, @CropName, @Quantity, @Unit, @PricePerUnit, 
        @HarvestDate, @Location, @Description, 'Available'
    )
END
GO


-- Update Crop Availability
CREATE PROCEDURE sp_UpdateCropAvailability
    @ListingID INT,
    @FarmerID INT,
    @Quantity DECIMAL(10,2),
    @Status NVARCHAR(20)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM CropAvailabilityDetails WHERE ID = @ListingID AND FarmerID = @FarmerID)
    BEGIN
        RAISERROR('Unauthorized or invalid listing.', 16, 1)
        RETURN
    END

    UPDATE CropAvailabilityDetails
    SET Quantity = @Quantity,
        Status = @Status
    WHERE ID = @ListingID
END
GO


-- Place Order Request by Trader
CREATE PROCEDURE sp_PlaceOrderRequest
    @TraderID INT,
    @ListingID INT,
    @Quantity DECIMAL(10,2),
    @OfferPrice DECIMAL(10,2),
    @PreferredDate DATE
AS
BEGIN
    INSERT INTO Orders (TraderID, ListingID, Quantity, OfferPrice, PreferredDate, OrderStatus)
    VALUES (@TraderID, @ListingID, @Quantity, @OfferPrice, @PreferredDate, 'Pending')
END
GO

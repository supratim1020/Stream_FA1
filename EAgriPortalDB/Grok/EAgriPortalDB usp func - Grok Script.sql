/*

*/
-- Use the EAgriculturalPortal database
USE EAgriculturalPortal;
GO

-- ############################# Stored Procedures #############################
/*
1. sp_RegisterFarmer (User Story 1.1):
    Handles farmer registration with validation for email format, duplicate emails, and password length.
    Inserts data into Users and FarmerProfiles tables.
    Sets IsActive = 0 for admin approval.
*/
-- Stored Procedure: Register Farmer (User Story 1.1)
CREATE OR ALTER PROCEDURE sp_RegisterFarmer
    @FullName NVARCHAR(100),
    @Email NVARCHAR(100) = NULL,
    @Password NVARCHAR(256), -- Expects hashed password
    @PhoneNumber NVARCHAR(15),
    @Address NVARCHAR(500),
    @DOB DATE
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Validate email format if provided
        IF @Email IS NOT NULL AND @Email NOT LIKE '%_@__%.__%'
            THROW 50001, 'Invalid email format.', 1;

        -- Check for duplicate email
        IF EXISTS (SELECT 1 FROM Users WHERE Email = @Email)
            THROW 50002, 'Email already in use.', 1;

        -- Validate password (assuming client validates complexity)
        IF LEN(@Password) < 8
            THROW 50003, 'Password must be at least 8 characters long.', 1;

        -- Insert into Users table
        INSERT INTO Users (FullName, Email, PasswordHash, PhoneNumber, Address, DOB, Role, IsActive)
        VALUES (@FullName, @Email, @Password, @PhoneNumber, @Address, @DOB, 'Farmer', 0); -- IsActive = 0 pending admin approval

        -- Insert into FarmerProfiles
        DECLARE @UserID INT = SCOPE_IDENTITY();
        INSERT INTO FarmerProfiles (FarmerProfileID) VALUES (@UserID);

        SELECT 'Registration successful. Awaiting admin approval.' AS Message, @UserID AS UserID;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMessage AS Message, 0 AS UserID;
    END CATCH
END;
GO

/*
2. sp_RegisterTrader (User Story 1.19):
    Manages trader registration with validation for required fields, email format, and duplicate email/license numbers.
    Inserts into Users and TraderProfiles tables with IsActive = 0.
*/
-- Stored Procedure: Register Trader (User Story 1.19)
CREATE OR ALTER PROCEDURE sp_RegisterTrader
    @BusinessName NVARCHAR(100),
    @OwnerName NVARCHAR(100),
    @Email NVARCHAR(100),
    @PhoneNumber NVARCHAR(15),
    @BusinessLicenseNumber NVARCHAR(50) = NULL,
    @Address NVARCHAR(500),
    @Password NVARCHAR(256) -- Expects hashed password
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Validate required fields
        IF @BusinessName IS NULL OR @OwnerName IS NULL OR @Email IS NULL OR @PhoneNumber IS NULL OR @Address IS NULL
            THROW 50004, 'All required fields must be filled.', 1;

        -- Validate email format
        IF @Email NOT LIKE '%_@__%.__%'
            THROW 50001, 'Invalid email format.', 1;

        -- Check for duplicate email or license number
        IF EXISTS (SELECT 1 FROM Users WHERE Email = @Email)
            THROW 50002, 'Email already in use.', 1;
        IF @BusinessLicenseNumber IS NOT NULL AND EXISTS (SELECT 1 FROM TraderProfiles WHERE BusinessLicenseNumber = @BusinessLicenseNumber)
            THROW 50005, 'Business license number already in use.', 1;

        -- Validate password
        IF LEN(@Password) < 8
            THROW 50003, 'Password must be at least 8 characters long.', 1;

        -- Insert into Users table
        INSERT INTO Users (FullName, Email, PasswordHash, PhoneNumber, Address, Role, IsActive)
        VALUES (@OwnerName, @Email, @Password, @PhoneNumber, @Address, 'Trader', 0); -- IsActive = 0 pending admin approval

        -- Insert into TraderProfiles
        DECLARE @UserID INT = SCOPE_IDENTITY();
        INSERT INTO TraderProfiles (TraderProfileID, BusinessName, BusinessLicenseNumber)
        VALUES (@UserID, @BusinessName, @BusinessLicenseNumber);

        SELECT 'Registration successful. Awaiting admin approval.' AS Message, @UserID AS UserID;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMessage AS Message, 0 AS UserID;
    END CATCH
END;
GO

/*
3. sp_LoginUser (User Stories 1.18, 1.20):
    Validates user credentials and checks if the account is active.
    Returns user details and role for dashboard redirection.
*/
-- Stored Procedure: Login User (User Stories 1.18, 1.20)
CREATE OR ALTER PROCEDURE sp_LoginUser
    @Email NVARCHAR(100),
    @Password NVARCHAR(256) -- Expects hashed password
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DECLARE @UserID INT, @Role NVARCHAR(20), @IsActive BIT, @FullName NVARCHAR(100);

        SELECT @UserID = UserID, @Role = Role, @IsActive = IsActive, @FullName = FullName
        FROM Users
        WHERE Email = @Email AND PasswordHash = @Password;

        IF @UserID IS NULL
            THROW 50006, 'Invalid email or password.', 1;

        IF @IsActive = 0
            THROW 50007, 'Account is not yet approved by admin.', 1;

        SELECT 'Login successful.' AS Message, @UserID AS UserID, @Role AS Role, @FullName AS FullName;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMessage AS Message, 0 AS UserID, '' AS Role, '' AS FullName;
    END CATCH
END;
GO

/*
4. sp_UpdateFarmerProfile (User Story 1.2):
    Updates farmer profile details in Users and FarmerProfiles with validation for email, farming type, and duplicates.
    Ensures only the farmer can update their profile.
*/
-- Stored Procedure: Update Farmer Profile (User Story 1.2)
CREATE OR ALTER PROCEDURE sp_UpdateFarmerProfile
    @UserID INT,
    @FullName NVARCHAR(100),
    @PhoneNumber NVARCHAR(15),
    @Email NVARCHAR(100),
    @FarmName NVARCHAR(100),
    @Location NVARCHAR(200),
    @FarmSize DECIMAL(10,2),
    @FarmingType NVARCHAR(50),
    @YearsOfExperience INT,
    @LanguagesSpoken NVARCHAR(200),
    @Address NVARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Validate inputs
        IF @Email IS NOT NULL AND @Email NOT LIKE '%_@__%.__%'
            THROW 50001, 'Invalid email format.', 1;
        IF @FarmingType NOT IN ('Organic', 'Hydroponic', 'Traditional')
            THROW 50008, 'Invalid farming type.', 1;
        IF EXISTS (SELECT 1 FROM Users WHERE Email = @Email AND UserID != @UserID)
            THROW 50002, 'Email already in use.', 1;

        -- Update Users table
        UPDATE Users
        SET FullName = @FullName,
            PhoneNumber = @PhoneNumber,
            Email = @Email,
            Address = @Address,
            UpdatedAt = GETDATE()
        WHERE UserID = @UserID AND Role = 'Farmer';

        IF @@ROWCOUNT = 0
            THROW 50009, 'Farmer not found or unauthorized.', 1;

        -- Update FarmerProfiles table
        UPDATE FarmerProfiles
        SET FarmName = @FarmName,
            Location = @Location,
            FarmSize = @FarmSize,
            FarmingType = @FarmingType,
            YearsOfExperience = @YearsOfExperience,
            LanguagesSpoken = @LanguagesSpoken
        WHERE FarmerProfileID = @UserID;

        SELECT 'Profile updated successfully.' AS Message;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMessage AS Message;
    END CATCH
END;
GO

/*
5. sp_DeleteFarmerAccount (User Story 1.3):
    Deletes a farmer’s account after checking for pending transactions.
    Cascades to related tables via foreign keys.
*/
-- Stored Procedure: Delete Farmer Account (User Story 1.3)
CREATE OR ALTER PROCEDURE sp_DeleteFarmerAccount
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Check for pending transactions
        IF EXISTS (SELECT 1 FROM Transactions WHERE FarmerID = @UserID AND Status IN ('Pending', 'Approved'))
            THROW 50010, 'Cannot delete account with pending transactions.', 1;

        -- Delete user (cascades to FarmerProfiles, CropAvailabilityDetails, etc.)
        DELETE FROM Users
        WHERE UserID = @UserID AND Role = 'Farmer';

        IF @@ROWCOUNT = 0
            THROW 50009, 'Farmer not found or unauthorized.', 1;

        SELECT 'Your account has been deleted.' AS Message;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMessage AS Message;
    END CATCH
END;
GO

/*
6. sp_CreateCropListing (User Story 1.4):
    Creates a new crop listing with validation for quantity, price, and required fields.
    Sets status to 'Available' by default.
*/
-- Stored Procedure: Create Crop Listing (User Story 1.4)
CREATE OR ALTER PROCEDURE sp_CreateCropListing
    @FarmerID INT,
    @CropName NVARCHAR(100),
    @Quantity DECIMAL(10,2),
    @Unit NVARCHAR(20),
    @PricePerUnit DECIMAL(10,2),
    @HarvestDate DATE,
    @Location NVARCHAR(200),
    @Description NVARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Validate inputs
        IF @Quantity < 0
            THROW 50011, 'Quantity cannot be negative.', 1;
        IF @PricePerUnit <= 0
            THROW 50012, 'Price per unit must be positive.', 1;
        IF @CropName IS NULL OR @Unit IS NULL OR @Location IS NULL
            THROW 50004, 'All required fields must be filled.', 1;

        -- Insert into CropAvailabilityDetails
        INSERT INTO CropAvailabilityDetails (FarmerID, CropName, Quantity, Unit, PricePerUnit, HarvestDate, Location, Description, Status)
        VALUES (@FarmerID, @CropName, @Quantity, @Unit, @PricePerUnit, @HarvestDate, @Location, @Description, 'Available');

        SELECT 'Your crop listing has been posted successfully.' AS Message, SCOPE_IDENTITY() AS ListingID;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMessage AS Message, 0 AS ListingID;
    END CATCH
END;
GO

/*
7. sp_UpdateCropAvailability (User Story 1.5):
    Updates crop quantity and status with validation.
    Ensures only the listing owner can make changes.
*/
-- Stored Procedure: Update Crop Availability (User Story 1.5)
CREATE OR ALTER PROCEDURE sp_UpdateCropAvailability
    @ListingID INT,
    @FarmerID INT,
    @Quantity DECIMAL(10,2),
    @Status NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Validate inputs
        IF @Quantity < 0
            THROW 50011, 'Quantity cannot be negative.', 1;
        IF @Status NOT IN ('Available', 'Sold', 'OutOfStock')
            THROW 50013, 'Invalid status.', 1;

        -- Update listing
        UPDATE CropAvailabilityDetails
        SET Quantity = @Quantity,
            Status = @Status,
            UpdatedAt = GETDATE()
        WHERE ListingID = @ListingID AND FarmerID = @FarmerID;

        IF @@ROWCOUNT = 0
            THROW 50014, 'Listing not found or unauthorized.', 1;

        SELECT 'Crop availability updated successfully.' AS Message;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMessage AS Message;
    END CATCH
END;
GO

/*
8. sp_DeleteCropListing (User Story 1.6):
    Deletes a crop listing with owner validation.
    Includes confirmation via error handling.
*/
-- Stored Procedure: Delete Crop Listing (User Story 1.6)
CREATE OR ALTER PROCEDURE sp_DeleteCropListing
    @ListingID INT,
    @FarmerID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Delete listing
        DELETE FROM CropAvailabilityDetails
        WHERE ListingID = @ListingID AND FarmerID = @FarmerID;

        IF @@ROWCOUNT = 0
            THROW 50014, 'Listing not found or unauthorized.', 1;

        SELECT 'Crop listing deleted successfully.' AS Message;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMessage AS Message;
    END CATCH
END;
GO

/*
9. sp_RateTrader (User Story 2.7):
    Allows farmers to rate traders post-transaction with validation for rating range and duplicate reviews.
    Stores review in FarmerReviews.
*/
-- Stored Procedure: Rate Trader (User Story 2.7)
CREATE OR ALTER PROCEDURE sp_RateTrader
    @TransactionID INT,
    @FarmerID INT,
    @TraderID INT,
    @Rating INT,
    @Comment NVARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Validate inputs
        IF @Rating NOT BETWEEN 1 AND 5
            THROW 50015, 'Rating must be between 1 and 5.', 1;
        IF LEN(@Comment) > 500
            THROW 50016, 'Comment cannot exceed 500 characters.', 1;

        -- Check transaction eligibility
        IF NOT EXISTS (SELECT 1 FROM Transactions WHERE TransactionID = @TransactionID AND FarmerID = @FarmerID AND TraderID = @TraderID AND Status = 'Completed')
            THROW 50017, 'No eligible completed transaction found.', 1;

        -- Check for duplicate review
        IF EXISTS (SELECT 1 FROM FarmerReviews WHERE TransactionID = @TransactionID AND FarmerID = @FarmerID AND TraderID = @TraderID)
            THROW 50018, 'Review already submitted for this transaction.', 1;

        -- Insert review
        INSERT INTO FarmerReviews (TransactionID, FarmerID, TraderID, Rating, Comment)
        VALUES (@TransactionID, @FarmerID, @TraderID, @Rating, @Comment);

        SELECT 'Thank you! Your review has been submitted.' AS Message;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMessage AS Message;
    END CATCH
END;
GO

/*
10. sp_GenerateWeatherAlerts (User Story 2.8):
        Generates weather alerts for farmers based on their location matching weather data.
        Prevents duplicate alerts.
*/
-- Stored Procedure: Generate Weather Alerts (User Story 2.8)
CREATE OR ALTER PROCEDURE sp_GenerateWeatherAlerts
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Insert alerts for farmers in matching regions
        INSERT INTO WeatherAlerts (FarmerID, WeatherID, AlertMessage)
        SELECT u.UserID, w.WeatherID, 
               w.WeatherType + ' Warning for ' + w.Region + ' on ' + CONVERT(NVARCHAR(50), w.EventDate, 120) AS AlertMessage
        FROM WeatherData w
        CROSS JOIN Users u
        INNER JOIN FarmerProfiles fp ON u.UserID = fp.FarmerProfileID
        WHERE u.Role = 'Farmer' 
        AND w.EventDate >= GETDATE()
        AND fp.Location = w.Region
        AND NOT EXISTS (
            SELECT 1 FROM WeatherAlerts wa 
            WHERE wa.FarmerID = u.UserID AND wa.WeatherID = w.WeatherID
        );

        IF @@ROWCOUNT = 0
            SELECT 'No new weather alerts generated.' AS Message;
        ELSE
            SELECT 'Weather alerts generated successfully.' AS Message;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMessage AS Message;
    END CATCH
END;
GO

/*
11. sp_ProcessTraderRequest (User Story 2.9):
        Handles approval/rejection of trader requests with status validation.
        Supports optional rejection messages.
*/
-- Stored Procedure: Approve/Reject Trader Request (User Story 2.9)
CREATE OR ALTER PROCEDURE sp_ProcessTraderRequest
    @TransactionID INT,
    @FarmerID INT,
    @Status NVARCHAR(20),
    @RejectionMessage NVARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Validate inputs
        IF @Status NOT IN ('Approved', 'Rejected')
            THROW 50019, 'Invalid status. Must be Approved or Rejected.', 1;

        -- Update transaction
        UPDATE Transactions
        SET Status = @Status,
            CompletedDate = CASE WHEN @Status = 'Approved' THEN GETDATE() ELSE CompletedDate END
        WHERE TransactionID = @TransactionID AND FarmerID = @FarmerID AND Status = 'Pending';

        IF @@ROWCOUNT = 0
            THROW 50020, 'Request not found or unauthorized.', 1;

        -- Optionally log rejection message (could be extended to a notifications table)
        IF @Status = 'Rejected' AND @RejectionMessage IS NOT NULL
        BEGIN
            -- Placeholder for notification logic
            SELECT 'Request rejected with message: ' + @RejectionMessage AS Message;
        END
        ELSE
            SELECT 'Request ' + @Status + ' successfully.' AS Message;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMessage AS Message;
    END CATCH
END;
GO

/*
12. sp_CreateGovernmentScheme (User Story 2.10):
        Allows admins to create schemes and send alerts to matching farmers.
        Validates admin access.
*/
-- Stored Procedure: Create Government Scheme (User Story 2.10)
CREATE OR ALTER PROCEDURE sp_CreateGovernmentScheme
    @AdminID INT,
    @Title NVARCHAR(200),
    @Description NVARCHAR(1000),
    @TargetLocation NVARCHAR(200),
    @Eligibility NVARCHAR(500),
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Validate admin
        IF NOT EXISTS (SELECT 1 FROM Users WHERE UserID = @AdminID AND Role = 'Admin')
            THROW 50021, 'Unauthorized: Admin access required.', 1;

        -- Insert scheme
        INSERT INTO GovernmentSchemes (Title, Description, TargetLocation, Eligibility, StartDate, EndDate)
        VALUES (@Title, @Description, @TargetLocation, @Eligibility, @StartDate, @EndDate);

        DECLARE @SchemeID INT = SCOPE_IDENTITY();

        -- Generate alerts for matching farmers
        INSERT INTO SchemeAlerts (FarmerID, SchemeID, AlertMessage)
        SELECT u.UserID, @SchemeID, 'New Government Scheme: ' + @Title + ' available in ' + @TargetLocation
        FROM Users u
        INNER JOIN FarmerProfiles fp ON u.UserID = fp.FarmerProfileID
        WHERE u.Role = 'Farmer' AND fp.Location = @TargetLocation;

        SELECT 'Government scheme created and alerts sent.' AS Message, @SchemeID AS SchemeID;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMessage AS Message, 0 AS SchemeID;
    END CATCH
END;
GO

/*
13. sp_CreateHarvestingReminder (User Story 2.11):
        Creates harvesting reminders with duplicate prevention.
        Supports optional reminder time and message.
*/
-- Stored Procedure: Create Harvesting Reminder (User Story 2.11)
CREATE OR ALTER PROCEDURE sp_CreateHarvestingReminder
    @FarmerID INT,
    @CropName NVARCHAR(100),
    @HarvestDate DATE,
    @ReminderTime TIME,
    @ReminderMessage NVARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Check for duplicate reminder
        IF EXISTS (
            SELECT 1 FROM HarvestingReminders 
            WHERE FarmerID = @FarmerID AND CropName = @CropName AND HarvestDate = @HarvestDate AND ReminderTime = @ReminderTime
        )
            THROW 50022, 'Duplicate reminder exists.', 1;

        -- Insert reminder
        INSERT INTO HarvestingReminders (FarmerID, CropName, HarvestDate, ReminderTime, ReminderMessage, Status)
        VALUES (@FarmerID, @CropName, @HarvestDate, @ReminderTime, @ReminderMessage, 'Active');

        SELECT 'Harvesting reminder created successfully.' AS Message, SCOPE_IDENTITY() AS ReminderID;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMessage AS Message, 0 AS ReminderID;
    END CATCH
END;
GO

/*
14. sp_ApproveUserRegistration (User Story 1.33):
        Allows admins to approve farmer/trader registrations by setting IsActive = 1.
        Validates admin access.
*/
-- Stored Procedure: Approve User Registration (User Story 1.33)
CREATE OR ALTER PROCEDURE sp_ApproveUserRegistration
    @AdminID INT,
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Validate admin
        IF NOT EXISTS (SELECT 1 FROM Users WHERE UserID = @AdminID AND Role = 'Admin')
            THROW 50021, 'Unauthorized: Admin access required.', 1;

        -- Update user status
        UPDATE Users
        SET IsActive = 1
        WHERE UserID = @UserID AND IsActive = 0;

        IF @@ROWCOUNT = 0
            THROW 50023, 'User not found or already approved.', 1;

        SELECT 'User registration approved successfully.' AS Message;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMessage AS Message;
    END CATCH
END;
GO

-- ############################# Scalar-Valued Functions #############################
/*
1. fn_GetFarmerAverageRating (User Stories 2.7, 2.26):
    Calculates the average rating for a farmer based on trader reviews.
    Returns 0 if no reviews exist.
*/
-- Scalar-Valued Function: Get Farmer Average Rating (User Stories 2.7, 2.26)
CREATE OR ALTER FUNCTION dbo.fn_GetFarmerAverageRating (@FarmerID INT)
RETURNS DECIMAL(3,2)
AS
BEGIN
    DECLARE @AverageRating DECIMAL(3,2);
    SELECT @AverageRating = AVG(CAST(Rating AS DECIMAL(3,2)))
    FROM TraderReviews
    WHERE FarmerID = @FarmerID;
    RETURN ISNULL(@AverageRating, 0);
END;
GO

/*
2. fn_GetTraderAverageRating (User Story 2.7):
    Calculates the average rating for a trader based on farmer reviews.
    Returns 0 if no reviews exist.
*/
-- Scalar-Valued Function: Get Trader Average Rating (User Story 2.7)
CREATE OR ALTER FUNCTION dbo.fn_GetTraderAverageRating (@TraderID INT)
RETURNS DECIMAL(3,2)
AS
BEGIN
    DECLARE @AverageRating DECIMAL(3,2);
    SELECT @AverageRating = AVG(CAST(Rating AS DECIMAL(3,2)))
    FROM FarmerReviews
    WHERE TraderID = @TraderID;
    RETURN ISNULL(@AverageRating, 0);
END;
GO

-- ############################# Scalar-Valued Functions #############################
/*
1. fn_GetFarmerTransactions (User Story 1.15):
    Returns a farmer’s transaction history with details like crop name, quantity, and total amount.
    Filters for completed or cancelled transactions.
*/
-- Table-Valued Function: Get Farmer Transactions (User Story 1.15)
CREATE OR ALTER FUNCTION dbo.fn_GetFarmerTransactions (@FarmerID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        t.TransactionID,
        t.ListingID,
        c.CropName,
        t.QuantityRequested AS QuantitySold,
        c.PricePerUnit,
        (t.QuantityRequested * c.PricePerUnit) AS TotalAmount,
        t.CompletedDate AS TransactionDate,
        u.FullName AS TraderName,
        t.Status
    FROM Transactions t
    INNER JOIN CropAvailabilityDetails c ON t.ListingID = c.ListingID
    INNER JOIN Users u ON t.TraderID = u.UserID
    WHERE t.FarmerID = @FarmerID
    AND t.Status IN ('Completed', 'Cancelled')
);
GO

/*
2. fn_GetTraderOrders (User Story 1.30):
    Returns a trader’s order history with crop, quantity, and farmer details.
    Supports filtering in the application layer.
*/
-- Table-Valued Function: Get Trader Orders (User Story 1.30)
CREATE OR ALTER FUNCTION dbo.fn_GetTraderOrders (@TraderID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        t.TransactionID,
        c.CropName,
        t.QuantityRequested AS QuantityPurchased,
        u.FullName AS FarmerName,
        t.Status,
        t.RequestDate AS TransactionDate
    FROM Transactions t
    INNER JOIN CropAvailabilityDetails c ON t.ListingID = c.ListingID
    INNER JOIN Users u ON t.FarmerID = u.UserID
    WHERE t.TraderID = @TraderID
);
GO

/*
3. fn_BrowseAvailableCrops (User Story 1.23):
    Returns available crop listings with optional filters for crop type and price range.
    Includes seller name and rating.
*/
-- Table-Valued Function: Browse Available Crops (User Story 1.23)
CREATE OR ALTER FUNCTION dbo.fn_BrowseAvailableCrops (@CropType NVARCHAR(50) = NULL, @MinPrice DECIMAL(10,2) = NULL, @MaxPrice DECIMAL(10,2) = NULL)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        c.ListingID,
        c.CropName,
        c.PricePerUnit,
        c.Quantity,
        c.Unit,
        c.Location,
        c.HarvestDate,
        u.FullName AS SellerName,
        dbo.fn_GetFarmerAverageRating(c.FarmerID) AS SellerRating
    FROM CropAvailabilityDetails c
    INNER JOIN Users u ON c.FarmerID = u.UserID
    WHERE c.Status = 'Available'
    AND (@CropType IS NULL OR c.CropName LIKE '%' + @CropType + '%')
    AND (@MinPrice IS NULL OR c.PricePerUnit >= @MinPrice)
    AND (@MaxPrice IS NULL OR c.PricePerUnit <= @MaxPrice)
);
GO

/*
    Error Handling: All procedures include TRY-CATCH blocks to return specific error messages to the client.
    Security: Procedures validate user roles and ownership (e.g., only farmers can update their listings).
    Validation: Enforces constraints like email format, rating ranges, and non-negative quantities.
    Extensibility: Functions and procedures are modular to support additional features like filtering or notifications.
    Assumptions: Passwords are hashed client-side, and email/OTP verification is handled by the application layer.
*/
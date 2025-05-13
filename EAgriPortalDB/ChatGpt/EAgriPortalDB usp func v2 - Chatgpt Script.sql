/*
✅ Phase 1: Core Farmer Operations
    This includes:

        Farmer registration with validations

        Farmer login

        Crop listing creation

        Crop listing update (availability)

        Crop listing deletion

        Farmer profile update

        Farmer account deletion
*/
-- Scalar-Valued Functions (Validation)
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

-- Validate Password Strength (min 8 chars, 1 uppercase, 1 number, 1 special char)
CREATE FUNCTION dbo.fn_IsStrongPassword (@Password NVARCHAR(100))
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

-- Stored Procedure: Farmer Registration
CREATE PROCEDURE sp_RegisterFarmer
    @FullName NVARCHAR(100),
    @Email NVARCHAR(100),
    @Password NVARCHAR(100),
    @PhoneNo NVARCHAR(15),
    @Address NVARCHAR(255),
    @DOB DATE,
    @FarmName NVARCHAR(100),
    @FarmSize DECIMAL(10,2),
    @FarmingType NVARCHAR(50),
    @YearsOfExperience INT,
    @LanguagesSpoken NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if email is in use
    IF EXISTS (SELECT 1 FROM Users WHERE Email = @Email)
    BEGIN
        RAISERROR('Email already registered.', 16, 1);
        RETURN;
    END

    -- Email format check
    IF dbo.fn_IsValidEmail(@Email) = 0
    BEGIN
        RAISERROR('Invalid email format.', 16, 1);
        RETURN;
    END

    -- Password check
    IF dbo.fn_IsStrongPassword(@Password) = 0
    BEGIN
        RAISERROR('Password must be 8+ characters, contain 1 uppercase, 1 number, and 1 special character.', 16, 1);
        RETURN;
    END

    DECLARE @RoleID INT = (SELECT RoleID FROM UserRoles WHERE RoleName = 'Farmer');
    DECLARE @PasswordHash NVARCHAR(255) = CONVERT(NVARCHAR(255), HASHBYTES('SHA2_256', @Password), 2);

    -- Insert into Users table
    INSERT INTO Users (RoleID, FullName, Email, PasswordHash, PhoneNo, Address, DOB)
    VALUES (@RoleID, @FullName, @Email, @PasswordHash, @PhoneNo, @Address, @DOB);

    DECLARE @UserID INT = SCOPE_IDENTITY();

    -- Insert into Farmers table
    INSERT INTO Farmers (FarmerID, FarmName, FarmSize, FarmingType, YearsOfExperience, LanguagesSpoken)
    VALUES (@UserID, @FarmName, @FarmSize, @FarmingType, @YearsOfExperience, @LanguagesSpoken);

    SELECT 'Registration successful!' AS Message;
END
GO

-- Stored Procedure: Farmer Login
CREATE PROCEDURE sp_LoginFarmer
    @Email NVARCHAR(100),
    @Password NVARCHAR(100)
AS
BEGIN
    DECLARE @HashedPassword NVARCHAR(255) = CONVERT(NVARCHAR(255), HASHBYTES('SHA2_256', @Password), 2);

    IF EXISTS (
        SELECT 1 FROM Users U
        JOIN UserRoles R ON U.RoleID = R.RoleID
        WHERE U.Email = @Email AND U.PasswordHash = @HashedPassword AND R.RoleName = 'Farmer'
    )
        SELECT 'Login successful' AS Message;
    ELSE
        RAISERROR('Invalid email or password.', 16, 1);
END
GO


-- Stored Procedure: Add New Crop Listing
CREATE PROCEDURE sp_AddCropListing
    @FarmerID INT,
    @CropName NVARCHAR(100),
    @Quantity DECIMAL(10,2),
    @Unit NVARCHAR(10),
    @PricePerUnit DECIMAL(10,2),
    @AvailabilityDate DATE,
    @Location NVARCHAR(100),
    @Description TEXT
AS
BEGIN
    IF @Quantity < 0 OR @PricePerUnit < 0
    BEGIN
        RAISERROR('Quantity and price must be non-negative.', 16, 1);
        RETURN;
    END

    INSERT INTO CropAvailabilityDetails (
        FarmerID, CropName, Quantity, Unit, PricePerUnit,
        AvailabilityDate, Location, Description, Status
    )
    VALUES (
        @FarmerID, @CropName, @Quantity, @Unit, @PricePerUnit,
        @AvailabilityDate, @Location, @Description, 'Available'
    );

    SELECT 'Crop listing created successfully.' AS Message;
END
GO


--  Stored Procedure: Update Crop Availability
CREATE PROCEDURE sp_UpdateCropAvailability
    @ListingID INT,
    @FarmerID INT,
    @NewQuantity DECIMAL(10,2),
    @Status NVARCHAR(50)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM CropAvailabilityDetails WHERE ListingID = @ListingID AND FarmerID = @FarmerID)
    BEGIN
        RAISERROR('Invalid or unauthorized listing.', 16, 1);
        RETURN;
    END

    UPDATE CropAvailabilityDetails
    SET Quantity = @NewQuantity,
        Status = @Status
    WHERE ListingID = @ListingID;

    SELECT 'Crop availability updated successfully.' AS Message;
END
GO

--  Stored Procedure: Delete Crop Listing
CREATE PROCEDURE sp_DeleteCropListing
    @ListingID INT,
    @FarmerID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM CropAvailabilityDetails WHERE ListingID = @ListingID AND FarmerID = @FarmerID)
    BEGIN
        RAISERROR('Unauthorized deletion attempt.', 16, 1);
        RETURN;
    END

    DELETE FROM CropAvailabilityDetails WHERE ListingID = @ListingID;

    SELECT 'Crop listing deleted successfully.' AS Message;
END
GO

-- Stored Procedure: Update Farmer Profile
CREATE PROCEDURE sp_UpdateFarmerProfile
    @FarmerID INT,
    @FullName NVARCHAR(100),
    @PhoneNo NVARCHAR(15),
    @Email NVARCHAR(100),
    @Address NVARCHAR(255),
    @FarmName NVARCHAR(100),
    @FarmSize DECIMAL(10,2),
    @FarmingType NVARCHAR(50),
    @YearsOfExperience INT,
    @LanguagesSpoken NVARCHAR(100)
AS
BEGIN
    IF dbo.fn_IsValidEmail(@Email) = 0
    BEGIN
        RAISERROR('Invalid email format.', 16, 1);
        RETURN;
    END

    -- Update Users table
    UPDATE Users
    SET FullName = @FullName, PhoneNo = @PhoneNo, Email = @Email, Address = @Address
    WHERE UserID = @FarmerID;

    -- Update Farmers table
    UPDATE Farmers
    SET FarmName = @FarmName, FarmSize = @FarmSize, FarmingType = @FarmingType,
        YearsOfExperience = @YearsOfExperience, LanguagesSpoken = @LanguagesSpoken
    WHERE FarmerID = @FarmerID;

    SELECT 'Profile updated successfully.' AS Message;
END
GO


-- Stored Procedure: Delete Farmer Account
CREATE PROCEDURE sp_DeleteFarmerAccount
    @FarmerID INT
AS
BEGIN
    -- Soft delete (optional alternative to DELETE)
    UPDATE Users SET IsActive = 0 WHERE UserID = @FarmerID;

    -- Hard delete logic (uncomment if preferred)
    -- DELETE FROM Farmers WHERE FarmerID = @FarmerID;
    -- DELETE FROM Users WHERE UserID = @FarmerID;

    SELECT 'Farmer account deleted.' AS Message;
END
GO

/*
 Phase 2 for your E-Agricultural Portal: complete Trader-side stored procedures and functions, including:

        Trader registration

        Trader login

        Edit trader profile

        Delete trader account

        Place order (trader request)

        View available crops

        Filter crops (price, quantity, etc.)
*/
-- Stored Procedure: Trader Registration
CREATE PROCEDURE sp_RegisterTrader
    @BusinessName NVARCHAR(100),
    @OwnerName NVARCHAR(100),
    @Email NVARCHAR(100),
    @PhoneNo NVARCHAR(15),
    @LicenseNumber NVARCHAR(50),
    @Address NVARCHAR(255),
    @Password NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Users WHERE Email = @Email)
    BEGIN
        RAISERROR('Email already in use.', 16, 1);
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM Traders WHERE LicenseNumber = @LicenseNumber)
    BEGIN
        RAISERROR('License number already registered.', 16, 1);
        RETURN;
    END

    IF dbo.fn_IsValidEmail(@Email) = 0
    BEGIN
        RAISERROR('Invalid email format.', 16, 1);
        RETURN;
    END

    IF dbo.fn_IsStrongPassword(@Password) = 0
    BEGIN
        RAISERROR('Weak password. Must be 8+ characters with upper, number, special char.', 16, 1);
        RETURN;
    END

    DECLARE @RoleID INT = (SELECT RoleID FROM UserRoles WHERE RoleName = 'Trader');
    DECLARE @PasswordHash NVARCHAR(255) = CONVERT(NVARCHAR(255), HASHBYTES('SHA2_256', @Password), 2);

    INSERT INTO Users (RoleID, FullName, Email, PasswordHash, PhoneNo, Address)
    VALUES (@RoleID, @OwnerName, @Email, @PasswordHash, @PhoneNo, @Address);

    DECLARE @UserID INT = SCOPE_IDENTITY();

    INSERT INTO Traders (TraderID, BusinessName, LicenseNumber)
    VALUES (@UserID, @BusinessName, @LicenseNumber);

    SELECT 'Trader registered. Awaiting admin verification.' AS Message;
END
GO

--  Stored Procedure: Trader Login
CREATE PROCEDURE sp_LoginTrader
    @Email NVARCHAR(100),
    @Password NVARCHAR(100)
AS
BEGIN
    DECLARE @HashedPassword NVARCHAR(255) = CONVERT(NVARCHAR(255), HASHBYTES('SHA2_256', @Password), 2);

    IF EXISTS (
        SELECT 1
        FROM Users U
        JOIN UserRoles R ON U.RoleID = R.RoleID
        JOIN Traders T ON T.TraderID = U.UserID
        WHERE U.Email = @Email AND U.PasswordHash = @HashedPassword AND R.RoleName = 'Trader' AND T.IsVerified = 1
    )
        SELECT 'Login successful' AS Message;
    ELSE
        RAISERROR('Invalid credentials or unverified account.', 16, 1);
END
GO


-- Stored Procedure: Edit Trader Profile
CREATE PROCEDURE sp_UpdateTraderProfile
    @TraderID INT,
    @BusinessName NVARCHAR(100),
    @OwnerName NVARCHAR(100),
    @Email NVARCHAR(100),
    @PhoneNo NVARCHAR(15),
    @Address NVARCHAR(255),
    @LicenseNumber NVARCHAR(50)
AS
BEGIN
    IF dbo.fn_IsValidEmail(@Email) = 0
    BEGIN
        RAISERROR('Invalid email format.', 16, 1);
        RETURN;
    END

    UPDATE Users
    SET FullName = @OwnerName, Email = @Email, PhoneNo = @PhoneNo, Address = @Address
    WHERE UserID = @TraderID;

    UPDATE Traders
    SET BusinessName = @BusinessName, LicenseNumber = @LicenseNumber
    WHERE TraderID = @TraderID;

    SELECT 'Trader profile updated successfully.' AS Message;
END
GO

-- Stored Procedure: Delete Trader Account
CREATE PROCEDURE sp_DeleteTraderAccount
    @TraderID INT
AS
BEGIN
    UPDATE Users SET IsActive = 0 WHERE UserID = @TraderID;
    SELECT 'Trader account marked as deleted.' AS Message;
END
GO

-- Stored Procedure: Place Trader Request (Order)
CREATE PROCEDURE sp_PlaceTraderRequest
    @TraderID INT,
    @ListingID INT,
    @QuantityRequested DECIMAL(10,2),
    @OfferedPrice DECIMAL(10,2)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM CropAvailabilityDetails WHERE ListingID = @ListingID AND Status = 'Available')
    BEGIN
        RAISERROR('Invalid or unavailable listing.', 16, 1);
        RETURN;
    END

    INSERT INTO TraderRequests (ListingID, TraderID, QuantityRequested, OfferedPrice)
    VALUES (@ListingID, @TraderID, @QuantityRequested, @OfferedPrice);

    SELECT 'Order request submitted to farmer.' AS Message;
END
GO

-- Table-Valued Function: View Available Crop Listings
CREATE FUNCTION fn_ViewAvailableCrops()
RETURNS TABLE
AS
RETURN
(
    SELECT 
        C.ListingID, F.FarmerID, F.FarmName, C.CropName, C.Quantity, C.Unit,
        C.PricePerUnit, C.AvailabilityDate, C.Location, C.Status
    FROM CropAvailabilityDetails C
    JOIN Farmers F ON F.FarmerID = C.FarmerID
    WHERE C.Status = 'Available'
)
GO

-- Table-Valued Function: Filter Crops by Price and Quantity
CREATE FUNCTION fn_FilterCrops
(
    @MinPrice DECIMAL(10,2),
    @MaxPrice DECIMAL(10,2),
    @MinQty DECIMAL(10,2),
    @MaxQty DECIMAL(10,2)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        C.ListingID, C.CropName, C.Quantity, C.Unit, C.PricePerUnit, C.Location,
        C.AvailabilityDate, F.FarmName, F.FarmerID
    FROM CropAvailabilityDetails C
    JOIN Farmers F ON C.FarmerID = F.FarmerID
    WHERE C.Status = 'Available'
      AND C.PricePerUnit BETWEEN @MinPrice AND @MaxPrice
      AND C.Quantity BETWEEN @MinQty AND @MaxQty
)
GO


/*
Phase 3: Admin Procedures
    This will include:

        ✅ Approve new registrations (Farmer & Trader)

        ✅ Manage user roles (add/update)

        ✅ Edit/Delete misleading crop listings

        ✅ Moderate community discussions

        ✅ Add platform-wide announcements
*/

-- 1. Approve User Registration (Farmer or Trader)
CREATE PROCEDURE sp_ApproveUser
    @UserID INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Traders WHERE TraderID = @UserID)
    BEGIN
        UPDATE Traders SET IsVerified = 1 WHERE TraderID = @UserID;
    END
    ELSE IF EXISTS (SELECT 1 FROM Farmers WHERE FarmerID = @UserID)
    BEGIN
        -- Optional: Add IsVerified flag to Farmers if needed
        -- UPDATE Farmers SET IsVerified = 1 WHERE FarmerID = @UserID;
        UPDATE Users SET IsActive = 1 WHERE UserID = @UserID;
    END
    ELSE
    BEGIN
        RAISERROR('User not found in eligible roles.', 16, 1);
        RETURN;
    END

    SELECT 'User approved successfully.' AS Message;
END
GO

-- 2. Manage Roles (Add New Roles)
CREATE PROCEDURE sp_AddUserRole
    @RoleName NVARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM UserRoles WHERE RoleName = @RoleName)
    BEGIN
        RAISERROR('Role already exists.', 16, 1);
        RETURN;
    END

    INSERT INTO UserRoles (RoleName) VALUES (@RoleName);

    SELECT 'New role added successfully.' AS Message;
END
GO

-- 3. Delete or Mark Crop Listing as Misleading
CREATE PROCEDURE sp_AdminDeleteCropListing
    @AdminID INT,
    @ListingID INT,
    @Reason TEXT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM CropAvailabilityDetails WHERE ListingID = @ListingID)
    BEGIN
        RAISERROR('Listing does not exist.', 16, 1);
        RETURN;
    END

    -- Log admin action
    INSERT INTO AdminActions (AdminID, ActionType, TargetTable, TargetID, Notes)
    VALUES (@AdminID, 'Delete Crop Listing', 'CropAvailabilityDetails', @ListingID, @Reason);

    DELETE FROM CropAvailabilityDetails WHERE ListingID = @ListingID;

    SELECT 'Listing deleted by admin.' AS Message;
END
GO

-- 4. Moderate Community Post (Delete Inappropriate Content)
CREATE PROCEDURE sp_AdminDeletePost
    @AdminID INT,
    @PostID INT,
    @Reason TEXT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM CommunityPosts WHERE PostID = @PostID)
    BEGIN
        RAISERROR('Post not found.', 16, 1);
        RETURN;
    END

    INSERT INTO AdminActions (AdminID, ActionType, TargetTable, TargetID, Notes)
    VALUES (@AdminID, 'Delete Community Post', 'CommunityPosts', @PostID, @Reason);

    DELETE FROM CommunityPosts WHERE PostID = @PostID;

    SELECT 'Community post deleted by admin.' AS Message;
END
GO

-- 5. Create Announcement (Platform-Wide)
CREATE PROCEDURE sp_CreateAnnouncement
    @Title NVARCHAR(255),
    @Message TEXT,
    @CreatedBy INT
AS
BEGIN
    INSERT INTO Announcements (Title, Message, CreatedBy)
    VALUES (@Title, @Message, @CreatedBy);

    SELECT 'Announcement published successfully.' AS Message;
END
GO


/*
✅ Phase 4: Stored Procedures for Reviews, Transactions & Shipments
    This includes:

        ✅ Approve/Reject Trader Request (by Farmer)

        ✅ Record Completed Transaction

        ✅ Add Trader Review (by Farmer)

        ✅ Add Farmer Review (by Trader)

        ✅ Add Shipment Record & Track Status
*/

-- ✅ 1. Approve/Reject Trader Request (Farmer Action)
CREATE PROCEDURE sp_UpdateTraderRequestStatus
    @RequestID INT,
    @FarmerID INT,
    @NewStatus NVARCHAR(20) -- Approved / Rejected
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM TraderRequests R
        JOIN CropAvailabilityDetails C ON R.ListingID = C.ListingID
        WHERE R.RequestID = @RequestID AND C.FarmerID = @FarmerID
    )
    BEGIN
        RAISERROR('Unauthorized request update.', 16, 1);
        RETURN;
    END

    UPDATE TraderRequests
    SET Status = @NewStatus
    WHERE RequestID = @RequestID;

    SELECT CONCAT('Request marked as ', @NewStatus) AS Message;
END
GO

-- ✅ 2. Create Transaction After Approval
CREATE PROCEDURE sp_RecordTransaction
    @RequestID INT,
    @TransactionDate DATE,
    @TotalAmount DECIMAL(10,2)
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM TraderRequests WHERE RequestID = @RequestID AND Status = 'Approved'
    )
    BEGIN
        RAISERROR('Only approved requests can be converted to transactions.', 16, 1);
        RETURN;
    END

    INSERT INTO Transactions (RequestID, TransactionDate, TotalAmount, Status)
    VALUES (@RequestID, @TransactionDate, @TotalAmount, 'Completed');

    SELECT 'Transaction recorded successfully.' AS Message;
END
GO

-- ✅ 3. Add Trader Review (by Farmer)
CREATE PROCEDURE sp_AddTraderReview
    @TransactionID INT,
    @FarmerID INT,
    @Rating INT,
    @Comment NVARCHAR(500)
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM TraderReviews
        WHERE TransactionID = @TransactionID AND TraderID IN 
        (
            SELECT T.TraderID FROM TraderRequests R
            JOIN Transactions TR ON TR.RequestID = R.RequestID
            JOIN Traders T ON T.TraderID = R.TraderID
            WHERE TR.TransactionID = @TransactionID
        )
    )
    BEGIN
        RAISERROR('Review already submitted for this transaction.', 16, 1);
        RETURN;
    END

    IF @Rating NOT BETWEEN 1 AND 5
    BEGIN
        RAISERROR('Rating must be between 1 and 5.', 16, 1);
        RETURN;
    END

    DECLARE @TraderID INT = (
        SELECT R.TraderID
        FROM Transactions T
        JOIN TraderRequests R ON T.RequestID = R.RequestID
        WHERE T.TransactionID = @TransactionID
    );

    INSERT INTO TraderReviews (TransactionID, TraderID, Rating, Comment)
    VALUES (@TransactionID, @TraderID, @Rating, @Comment);

    SELECT 'Trader review added.' AS Message;
END
GO

-- ✅ 4. Add Farmer Review (by Trader)
CREATE PROCEDURE sp_AddFarmerReview
    @TransactionID INT,
    @TraderID INT,
    @Rating INT,
    @Comment NVARCHAR(500)
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM FarmerReviews
        WHERE TransactionID = @TransactionID AND FarmerID IN 
        (
            SELECT C.FarmerID FROM CropAvailabilityDetails C
            JOIN TraderRequests R ON R.ListingID = C.ListingID
            JOIN Transactions T ON T.RequestID = R.RequestID
            WHERE T.TransactionID = @TransactionID
        )
    )
    BEGIN
        RAISERROR('Review already submitted for this transaction.', 16, 1);
        RETURN;
    END

    IF @Rating NOT BETWEEN 1 AND 5
    BEGIN
        RAISERROR('Rating must be between 1 and 5.', 16, 1);
        RETURN;
    END

    DECLARE @FarmerID INT = (
        SELECT C.FarmerID
        FROM Transactions T
        JOIN TraderRequests R ON R.RequestID = T.RequestID
        JOIN CropAvailabilityDetails C ON C.ListingID = R.ListingID
        WHERE T.TransactionID = @TransactionID
    );

    INSERT INTO FarmerReviews (TransactionID, FarmerID, Rating, Comment)
    VALUES (@TransactionID, @FarmerID, @Rating, @Comment);

    SELECT 'Farmer review added.' AS Message;
END
GO

-- ✅ 5. Add or Update Shipment Status
CREATE PROCEDURE sp_UpdateShipmentStatus
    @TransactionID INT,
    @Status NVARCHAR(50),
    @TrackingDetails NVARCHAR(255)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Shipments WHERE TransactionID = @TransactionID)
    BEGIN
        UPDATE Shipments
        SET Status = @Status,
            TrackingDetails = @TrackingDetails,
            LastUpdated = GETDATE()
        WHERE TransactionID = @TransactionID;

        SELECT 'Shipment status updated.' AS Message;
    END
    ELSE
    BEGIN
        INSERT INTO Shipments (TransactionID, Status, TrackingDetails)
        VALUES (@TransactionID, @Status, @TrackingDetails);

        SELECT 'Shipment record created.' AS Message;
    END
END
GO


-- ✅ Phase 5: Alerts, Reminders & Notifications

-- ✅ 1. Insert Weather Alert for Farmers (based on location match)
CREATE PROCEDURE sp_GenerateWeatherAlerts
AS
BEGIN
    INSERT INTO FarmerWeatherAlerts (FarmerID, WeatherID)
    SELECT F.FarmerID, W.WeatherID
    FROM Farmers F
    JOIN WeatherData W ON F.FarmName IS NOT NULL AND W.Region = F.FarmName -- assuming FarmName stores location
    WHERE NOT EXISTS (
        SELECT 1 FROM FarmerWeatherAlerts A
        WHERE A.FarmerID = F.FarmerID AND A.WeatherID = W.WeatherID
    );
END
GO

-- ✅ 2. Insert Scheme Alert for Eligible Farmers
CREATE PROCEDURE sp_GenerateSchemeAlerts
AS
BEGIN
    INSERT INTO FarmerSchemeAlerts (FarmerID, SchemeID)
    SELECT F.FarmerID, S.SchemeID
    FROM Farmers F
    JOIN GovernmentSchemes S ON S.TargetLocation = F.FarmName -- match by location
    WHERE GETDATE() BETWEEN S.StartDate AND S.EndDate
    AND NOT EXISTS (
        SELECT 1 FROM FarmerSchemeAlerts FA WHERE FA.FarmerID = F.FarmerID AND FA.SchemeID = S.SchemeID
    );
END
GO

-- ✅ 3. Add or Update Harvest Reminder
CREATE PROCEDURE sp_UpsertHarvestReminder
    @FarmerID INT,
    @CropName NVARCHAR(100),
    @HarvestDate DATE,
    @ReminderTime TIME,
    @Message NVARCHAR(255)
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM HarvestingReminders 
        WHERE FarmerID = @FarmerID AND CropName = @CropName AND HarvestDate = @HarvestDate
    )
    BEGIN
        UPDATE HarvestingReminders
        SET ReminderTime = @ReminderTime,
            Message = @Message,
            Status = 'Active'
        WHERE FarmerID = @FarmerID AND CropName = @CropName AND HarvestDate = @HarvestDate;

        SELECT 'Reminder updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        INSERT INTO HarvestingReminders (FarmerID, CropName, HarvestDate, ReminderTime, Message)
        VALUES (@FarmerID, @CropName, @HarvestDate, @ReminderTime, @Message);

        SELECT 'New reminder added successfully.' AS Message;
    END
END
GO


-- 📊 Phase 6: Reporting Queries / Table-Valued Functions
-- ✅ 1. Earnings Report (Farmer View)
CREATE FUNCTION fn_FarmerEarningsReport
(
    @FarmerID INT,
    @StartDate DATE,
    @EndDate DATE
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        C.CropName,
        SUM(R.QuantityRequested) AS TotalQuantitySold,
        SUM(T.TotalAmount) AS TotalRevenue
    FROM Transactions T
    JOIN TraderRequests R ON T.RequestID = R.RequestID
    JOIN CropAvailabilityDetails C ON R.ListingID = C.ListingID
    WHERE C.FarmerID = @FarmerID
      AND T.TransactionDate BETWEEN @StartDate AND @EndDate
      AND T.Status = 'Completed'
    GROUP BY C.CropName
)
GO

-- ✅ 2. Farmer Order History Table-Valued Function
CREATE FUNCTION fn_FarmerOrderHistory (@FarmerID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        T.TransactionID,
        C.CropName,
        R.QuantityRequested,
        R.OfferedPrice,
        T.TotalAmount,
        T.TransactionDate,
        TR.FullName AS TraderName,
        T.Status
    FROM Transactions T
    JOIN TraderRequests R ON R.RequestID = T.RequestID
    JOIN CropAvailabilityDetails C ON C.ListingID = R.ListingID
    JOIN Users TR ON TR.UserID = R.TraderID
    WHERE C.FarmerID = @FarmerID
)
GO

-- ✅ 3. Trader Order History Table-Valued Function
CREATE FUNCTION fn_TraderOrderHistory (@TraderID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        T.TransactionID,
        C.CropName,
        R.QuantityRequested,
        R.OfferedPrice,
        T.TotalAmount,
        T.TransactionDate,
        F.FullName AS FarmerName,
        T.Status
    FROM Transactions T
    JOIN TraderRequests R ON R.RequestID = T.RequestID
    JOIN CropAvailabilityDetails C ON C.ListingID = R.ListingID
    JOIN Users F ON F.UserID = C.FarmerID
    WHERE R.TraderID = @TraderID
)
GO


-- ✅ Phase 7: Matching Engine for Trader–Farmer

-- ✅ 1. Table-Valued Function: Get Matched Traders for a Farmer's Crop
CREATE FUNCTION fn_MatchedTradersForCrop
(
    @CropName NVARCHAR(100),
    @Location NVARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT U.UserID AS TraderID, U.FullName AS TraderName, T.BusinessName, U.Email, U.PhoneNo
    FROM Users U
    JOIN Traders T ON U.UserID = T.TraderID
    WHERE U.IsActive = 1 AND T.IsVerified = 1
      AND EXISTS (
          SELECT 1
          FROM TraderRequests R
          JOIN CropAvailabilityDetails C ON R.ListingID = C.ListingID
          WHERE C.CropName = @CropName
            AND C.Location = @Location
            AND R.TraderID = T.TraderID
      )
)
GO


-- ✅ 2. Stored Procedure: Notify Matched Traders When Crop is Listed
CREATE PROCEDURE sp_NotifyMatchedTraders
    @ListingID INT
AS
BEGIN
    DECLARE @CropName NVARCHAR(100), @Location NVARCHAR(100)
    SELECT @CropName = CropName, @Location = Location
    FROM CropAvailabilityDetails
    WHERE ListingID = @ListingID

    -- This is a placeholder; use in-app/email triggers in actual implementation
    SELECT DISTINCT U.UserID AS TraderID, U.Email, 'New crop listed that matches your interests!' AS Notification
    FROM Users U
    JOIN Traders T ON U.UserID = T.TraderID
    JOIN TraderRequests R ON R.TraderID = T.TraderID
    JOIN CropAvailabilityDetails C ON R.ListingID = C.ListingID
    WHERE C.CropName = @CropName AND C.Location = @Location
END
GO

-- ✅ Phase 8: Community, Knowledge Base, and Favorites
-- ✅ 1. Stored Procedure: Create New Community Post
CREATE PROCEDURE sp_CreateCommunityPost
    @UserID INT,
    @Title NVARCHAR(255),
    @Category NVARCHAR(50),
    @Message TEXT
AS
BEGIN
    INSERT INTO CommunityPosts (UserID, Title, Category, Message)
    VALUES (@UserID, @Title, @Category, @Message)

    SELECT 'Post submitted successfully.' AS Message
END
GO

-- ✅ 2. Stored Procedure: Reply to a Community Post
CREATE PROCEDURE sp_ReplyToPost
    @PostID INT,
    @UserID INT,
    @ReplyMessage TEXT
AS
BEGIN
    INSERT INTO CommunityReplies (PostID, UserID, ReplyMessage)
    VALUES (@PostID, @UserID, @ReplyMessage)

    SELECT 'Reply submitted.' AS Message
END
GO

-- ✅ 3. Stored Procedure: Add Expert Guide
CREATE PROCEDURE sp_AddExpertGuide
    @Title NVARCHAR(255),
    @Author NVARCHAR(100),
    @Summary TEXT,
    @Content TEXT
AS
BEGIN
    INSERT INTO ExpertGuides (Title, Author, Summary, Content, PublishedDate)
    VALUES (@Title, @Author, @Summary, @Content, GETDATE())

    SELECT 'Expert guide added successfully.' AS Message
END
GO

-- ✅ 4. Stored Procedure: Save Favorite Farmer (by Trader)
CREATE TABLE TraderFavorites (
    TraderID INT,
    FarmerID INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT PK_TraderFavorites PRIMARY KEY (TraderID, FarmerID),
    FOREIGN KEY (TraderID) REFERENCES Traders(TraderID),
    FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID)
);
GO

CREATE PROCEDURE sp_AddFavoriteFarmer
    @TraderID INT,
    @FarmerID INT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM TraderFavorites WHERE TraderID = @TraderID AND FarmerID = @FarmerID
    )
    BEGIN
        RAISERROR('Farmer already in favorites.', 16, 1);
        RETURN;
    END

    INSERT INTO TraderFavorites (TraderID, FarmerID)
    VALUES (@TraderID, @FarmerID)

    SELECT 'Farmer added to favorites.' AS Message
END
GO

-- ✅ 5. Table-Valued Function: Get All Favorite Farmers
CREATE FUNCTION fn_GetFavoriteFarmers (@TraderID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT F.FarmerID, U.FullName AS FarmerName, F.FarmName, U.PhoneNo, U.Email
    FROM TraderFavorites TF
    JOIN Farmers F ON TF.FarmerID = F.FarmerID
    JOIN Users U ON U.UserID = F.FarmerID
    WHERE TF.TraderID = @TraderID
)
GO

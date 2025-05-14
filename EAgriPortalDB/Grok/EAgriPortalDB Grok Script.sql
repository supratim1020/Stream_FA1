-- Database creation
CREATE DATABASE EAgriculturalPortal;
GO

USE EAgriculturalPortal;
GO

-- Users table to store common user information for farmers, traders, and admins
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    PasswordHash NVARCHAR(256) NOT NULL, -- Store hashed passwords
    PhoneNumber NVARCHAR(15) NOT NULL,
    Address NVARCHAR(500) NOT NULL,
    DOB DATE,
    Role NVARCHAR(20) NOT NULL CHECK (Role IN ('Farmer', 'Trader', 'Admin')),
    IsActive BIT DEFAULT 0, -- For admin approval of accounts
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME
);

-- FarmerProfiles table to store additional farmer-specific information
CREATE TABLE FarmerProfiles (
    FarmerProfileID INT PRIMARY KEY,
    FarmName NVARCHAR(100),
    FarmSize DECIMAL(10,2), -- In hectares
    FarmingType NVARCHAR(50) CHECK (FarmingType IN ('Organic', 'Hydroponic', 'Traditional')),
    Location NVARCHAR(200),
    YearsOfExperience INT,
    LanguagesSpoken NVARCHAR(200),
    FOREIGN KEY (FarmerProfileID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- TraderProfiles table to store trader-specific business information
CREATE TABLE TraderProfiles (
    TraderProfileID INT PRIMARY KEY,
    BusinessName NVARCHAR(100) NOT NULL,
    BusinessLicenseNumber NVARCHAR(50) UNIQUE,
    FOREIGN KEY (TraderProfileID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- CropAvailabilityDetails table to store crop listings
CREATE TABLE CropAvailabilityDetails (
    ListingID INT IDENTITY(1,1) PRIMARY KEY,
    FarmerID INT NOT NULL,
    CropName NVARCHAR(100) NOT NULL,
    Quantity DECIMAL(10,2) NOT NULL CHECK (Quantity >= 0),
    Unit NVARCHAR(20) NOT NULL, -- e.g., kg, tons
    PricePerUnit DECIMAL(10,2) NOT NULL CHECK (PricePerUnit > 0),
    HarvestDate DATE NOT NULL,
    [Location] NVARCHAR(200) NOT NULL,
    [Description] NVARCHAR(500),
    [Status] NVARCHAR(20) NOT NULL CHECK (Status IN ('Available', 'Sold', 'OutOfStock')),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME,
    FOREIGN KEY (FarmerID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Transactions table to store order requests and transaction details
CREATE TABLE Transactions (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    FarmerID INT NOT NULL,
    TraderID INT NOT NULL,
    ListingID INT NOT NULL,
    QuantityRequested DECIMAL(10,2) NOT NULL CHECK (QuantityRequested > 0),
    OfferedPrice DECIMAL(10,2),
    RequestDate DATETIME DEFAULT GETDATE(),
    [Status] NVARCHAR(20) NOT NULL CHECK (Status IN ('Pending', 'Approved', 'Rejected', 'Completed', 'Cancelled')),
    CompletedDate DATETIME,
    FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
    FOREIGN KEY (TraderID) REFERENCES Users(UserID),
    FOREIGN KEY (ListingID) REFERENCES CropAvailabilityDetails(ListingID)
);

-- ShipmentTracking table to track shipment status
CREATE TABLE ShipmentTracking (
    ShipmentID INT IDENTITY(1,1) PRIMARY KEY,
    TransactionID INT NOT NULL,
    [Status] NVARCHAR(20) NOT NULL CHECK (Status IN ('Pending', 'InTransit', 'Delivered', 'Delayed')),
    TrackingDetails NVARCHAR(500),
    ExpectedDeliveryDate DATE,
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID) ON DELETE CASCADE
);

-- TraderReviews table to store farmer reviews by traders
CREATE TABLE TraderReviews (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    TransactionID INT NOT NULL,
    FarmerID INT NOT NULL,
    TraderID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Comment NVARCHAR(500),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID),
    FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
    FOREIGN KEY (TraderID) REFERENCES Users(UserID),
    UNIQUE (TransactionID, FarmerID, TraderID) -- Prevent multiple reviews per transaction
);

-- FarmerReviews table to store trader reviews by farmers
CREATE TABLE FarmerReviews (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    TransactionID INT NOT NULL,
    FarmerID INT NOT NULL,
    TraderID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Comment NVARCHAR(500),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID),
    FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
    FOREIGN KEY (TraderID) REFERENCES Users(UserID),
    UNIQUE (TransactionID, FarmerID, TraderID) -- Prevent multiple reviews per transaction
);

-- WeatherData table to store static weather information
CREATE TABLE WeatherData (
    WeatherID INT IDENTITY(1,1) PRIMARY KEY,
    Region NVARCHAR(100) NOT NULL,
    WeatherType NVARCHAR(50) NOT NULL, -- e.g., Rain, Storm
    EventDate DATETIME NOT NULL,
    Description NVARCHAR(500),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- WeatherAlerts table to store alerts sent to farmers
CREATE TABLE WeatherAlerts (
    AlertID INT IDENTITY(1,1) PRIMARY KEY,
    FarmerID INT NOT NULL,
    WeatherID INT NOT NULL,
    AlertMessage NVARCHAR(500) NOT NULL,
    SentAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
    FOREIGN KEY (WeatherID) REFERENCES WeatherData(WeatherID)
);

-- GovernmentSchemes table to store government scheme details
CREATE TABLE GovernmentSchemes (
    SchemeID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Description NVARCHAR(1000) NOT NULL,
    TargetLocation NVARCHAR(200) NOT NULL,
    Eligibility NVARCHAR(500),
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME
);

-- SchemeAlerts table to store scheme notifications sent to farmers
CREATE TABLE SchemeAlerts (
    AlertID INT IDENTITY(1,1) PRIMARY KEY,
    FarmerID INT NOT NULL,
    SchemeID INT NOT NULL,
    AlertMessage NVARCHAR(500) NOT NULL,
    SentAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
    FOREIGN KEY (SchemeID) REFERENCES GovernmentSchemes(SchemeID)
);

-- HarvestingReminders table to store farmer reminders
CREATE TABLE HarvestingReminders (
    ReminderID INT IDENTITY(1,1) PRIMARY KEY,
    FarmerID INT NOT NULL,
    CropName NVARCHAR(100) NOT NULL,
    HarvestDate DATE NOT NULL,
    ReminderTime TIME,
    ReminderMessage NVARCHAR(500),
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Active', 'Completed', 'Cancelled')),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME,
    FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
    UNIQUE (FarmerID, CropName, HarvestDate, ReminderTime) -- Prevent duplicate reminders
);

-- ExpertGuides table to store expert guides
CREATE TABLE ExpertGuides (
    GuideID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Author NVARCHAR(100) NOT NULL,
    Summary NVARCHAR(500) NOT NULL,
    Content NVARCHAR(MAX) NOT NULL,
    Topic NVARCHAR(100),
    PublicationDate DATE NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- GuideReviews table to store farmer reviews of guides
CREATE TABLE GuideReviews (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    GuideID INT NOT NULL,
    FarmerID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Comment NVARCHAR(500),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (GuideID) REFERENCES ExpertGuides(GuideID),
    FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
    UNIQUE (GuideID, FarmerID) -- One review per farmer per guide
);

-- GuideBookmarks table to store farmer bookmarks of guides
CREATE TABLE GuideBookmarks (
    BookmarkID INT IDENTITY(1,1) PRIMARY KEY,
    GuideID INT NOT NULL,
    FarmerID INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (GuideID) REFERENCES ExpertGuides(GuideID),
    FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
    UNIQUE (GuideID, FarmerID) -- Prevent duplicate bookmarks
);

-- DiscussionForums table to store community discussion threads
CREATE TABLE DiscussionForums (
    ThreadID INT IDENTITY(1,1) PRIMARY KEY,
    FarmerID INT NOT NULL,
    Title NVARCHAR(200) NOT NULL,
    Category NVARCHAR(100) NOT NULL,
    InitialMessage NVARCHAR(1000) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME,
    FOREIGN KEY (FarmerID) REFERENCES Users(UserID)
);

-- DiscussionReplies table to store replies to discussion threads
CREATE TABLE DiscussionReplies (
    ReplyID INT IDENTITY(1,1) PRIMARY KEY,
    ThreadID INT NOT NULL,
    FarmerID INT NOT NULL,
    Comment NVARCHAR(1000) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ThreadID) REFERENCES DiscussionForums(ThreadID) ON DELETE CASCADE,
    FOREIGN KEY (FarmerID) REFERENCES Users(UserID)
);

-- DiscussionLikes table to store likes/upvotes on discussions
CREATE TABLE DiscussionLikes (
    LikeID INT IDENTITY(1,1) PRIMARY KEY,
    ThreadID INT,
    ReplyID INT,
    FarmerID INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ThreadID) REFERENCES DiscussionForums(ThreadID) ON DELETE CASCADE,
    FOREIGN KEY (ReplyID) REFERENCES DiscussionReplies(ReplyID) ON DELETE CASCADE,
    FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
    CHECK ((ThreadID IS NOT NULL AND ReplyID IS NULL) OR (ThreadID IS NULL AND ReplyID IS NOT NULL)),
    UNIQUE (ThreadID, ReplyID, FarmerID) -- Prevent multiple likes
);

-- TraderFavorites table to store traders' favorite farmers
CREATE TABLE TraderFavorites (
    FavoriteID INT IDENTITY(1,1) PRIMARY KEY,
    TraderID INT NOT NULL,
    FarmerID INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (TraderID) REFERENCES Users(UserID),
    FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
    UNIQUE (TraderID, FarmerID) -- Prevent duplicate favorites
);

-- TraderCropPreferences table to store trader crop preferences for alerts
CREATE TABLE TraderCropPreferences (
    PreferenceID INT IDENTITY(1,1) PRIMARY KEY,
    TraderID INT NOT NULL,
    CropName NVARCHAR(100) NOT NULL,
    MinPrice DECIMAL(10,2),
    MaxPrice DECIMAL(10,2),
    MinQuantity DECIMAL(10,2),
    MaxQuantity DECIMAL(10,2),
    SourcingDistance INT, -- In kilometers
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (TraderID) REFERENCES Users(UserID)
);

-- Announcements table to store platform-wide announcements
CREATE TABLE Announcements (
    AnnouncementID INT IDENTITY(1,1) PRIMARY KEY,
    AdminID INT NOT NULL,
    Title NVARCHAR(200) NOT NULL,
    Content NVARCHAR(1000) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (AdminID) REFERENCES Users(UserID)
);

-- Policies table to store platform policies and guidelines
CREATE TABLE Policies (
    PolicyID INT IDENTITY(1,1) PRIMARY KEY,
    AdminID INT NOT NULL,
    Title NVARCHAR(200) NOT NULL,
    Content NVARCHAR(MAX) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME,
    FOREIGN KEY (AdminID) REFERENCES Users(UserID)
);

-- CropImages table to store images of diseased crops for AI diagnosis
CREATE TABLE CropImages (
    ImageID INT IDENTITY(1,1) PRIMARY KEY,
    FarmerID INT NOT NULL,
    CropName NVARCHAR(100) NOT NULL,
    ImagePath NVARCHAR(500) NOT NULL, -- Store path to image
    DiagnosisResult NVARCHAR(500), -- Store AI diagnosis result
    UploadedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (FarmerID) REFERENCES Users(UserID)
);

-- Translations table to store translated product descriptions
CREATE TABLE Translations (
    TranslationID INT IDENTITY(1,1) PRIMARY KEY,
    ListingID INT NOT NULL,
    Language NVARCHAR(50) NOT NULL,
    TranslatedDescription NVARCHAR(500),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ListingID) REFERENCES CropAvailabilityDetails(ListingID) ON DELETE CASCADE
);

-- ThemePreferences table to store user theme preferences
CREATE TABLE ThemePreferences (
    PreferenceID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    Theme NVARCHAR(20) NOT NULL CHECK (Theme IN ('Light', 'Dark')),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    UNIQUE (UserID) -- One theme preference per user
);

-- Indexes for performance optimization
CREATE INDEX IX_Users_Email ON Users(Email);
CREATE INDEX IX_Users_Role ON Users(Role);
CREATE INDEX IX_CropAvailabilityDetails_FarmerID ON CropAvailabilityDetails(FarmerID);
CREATE INDEX IX_CropAvailabilityDetails_Status ON CropAvailabilityDetails(Status);
CREATE INDEX IX_Transactions_FarmerID ON Transactions(FarmerID);
CREATE INDEX IX_Transactions_TraderID ON Transactions(TraderID);
CREATE INDEX IX_Transactions_Status ON Transactions(Status);
CREATE INDEX IX_WeatherData_Region ON WeatherData(Region);
CREATE INDEX IX_GovernmentSchemes_TargetLocation ON GovernmentSchemes(TargetLocation);
CREATE INDEX IX_DiscussionForums_Category ON DiscussionForums(Category);
GO

-- Trigger to update UpdatedAt timestamps
CREATE TRIGGER TRG_UpdateTimestamps
ON CropAvailabilityDetails
AFTER UPDATE
AS
BEGIN
    UPDATE CropAvailabilityDetails
    SET UpdatedAt = GETDATE()
    FROM CropAvailabilityDetails
    INNER JOIN inserted ON CropAvailabilityDetails.ListingID = inserted.ListingID;
END;
GO

CREATE TRIGGER TRG_UpdateUserTimestamps
ON Users
AFTER UPDATE
AS
BEGIN
    UPDATE Users
    SET UpdatedAt = GETDATE()
    FROM Users
    INNER JOIN inserted ON Users.UserID = inserted.UserID;
END;
GO

CREATE TRIGGER TRG_UpdateGovernmentSchemesTimestamps
ON GovernmentSchemes
AFTER UPDATE
AS
BEGIN
    UPDATE GovernmentSchemes
    SET UpdatedAt = GETDATE()
    FROM GovernmentSchemes
    INNER JOIN inserted ON GovernmentSchemes.SchemeID = inserted.SchemeID;
END;
GO

CREATE TRIGGER TRG_UpdateDiscussionForumsTimestamps
ON DiscussionForums
AFTER UPDATE
AS
BEGIN
    UPDATE DiscussionForums
    SET UpdatedAt = GETDATE()
    FROM DiscussionForums
    INNER JOIN inserted ON DiscussionForums.ThreadID = inserted.ThreadID;
END;
GO
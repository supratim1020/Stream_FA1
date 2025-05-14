USE [master]
GO

IF (EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE ('[' + name + ']' = N'EAgriPortalDB'OR name = N'EAgriPortalDB')))
DROP DATABASE EAgriPortalDB

CREATE DATABASE EAgriPortalDB
GO

USE EAgriPortalDB
GO

IF OBJECT_ID('UserRoles')  IS NOT NULL
DROP TABLE UserRoles
GO



-- Common Tables
CREATE TABLE UserRoles (
    RoleID INT PRIMARY KEY IDENTITY,
    RoleName VARCHAR(50) NOT NULL UNIQUE -- Farmer, Trader, Admin
);
GO

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    RoleID INT FOREIGN KEY REFERENCES UserRoles(RoleID),
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    PhoneNo VARCHAR(15) NOT NULL,
    Address VARCHAR(255),
    DOB DATE,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Farmer-Specific Tables
CREATE TABLE Farmers (
    FarmerID INT PRIMARY KEY FOREIGN KEY REFERENCES Users(UserID),
    FarmName VARCHAR(100),
    FarmSize DECIMAL(10,2),
    FarmingType VARCHAR(50), -- Organic, Hydroponic, Traditional
    YearsOfExperience INT,
    LanguagesSpoken VARCHAR(100)
);
GO

CREATE TABLE CropAvailabilityDetails (
    ListingID INT PRIMARY KEY IDENTITY,
    FarmerID INT FOREIGN KEY REFERENCES Farmers(FarmerID),
    CropName VARCHAR(100) NOT NULL,
    Quantity DECIMAL(10,2) NOT NULL,
    Unit VARCHAR(10) NOT NULL, -- e.g., kg, ton
    PricePerUnit DECIMAL(10,2) NOT NULL,
    AvailabilityDate DATE NOT NULL,
    [Location] VARCHAR(100),
    [Description] TEXT,
    [Status] VARCHAR(50) DEFAULT 'Available', -- Available, Sold, Out of Stock
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE HarvestingReminders (
    ReminderID INT PRIMARY KEY IDENTITY,
    FarmerID INT FOREIGN KEY REFERENCES Farmers(FarmerID),
    CropName VARCHAR(100),
    HarvestDate DATE,
    ReminderTime TIME,
    [Message] VARCHAR(255),
    [Status] VARCHAR(20) DEFAULT 'Active'
);
GO


-- Trader-Specific Tables
CREATE TABLE Traders (
    TraderID INT PRIMARY KEY FOREIGN KEY REFERENCES Users(UserID),
    BusinessName VARCHAR(100),
    LicenseNumber VARCHAR(50),
    IsVerified BIT DEFAULT 0
);
GO

CREATE TABLE TraderRequests (
    RequestID INT PRIMARY KEY IDENTITY,
    ListingID INT FOREIGN KEY REFERENCES CropAvailabilityDetails(ListingID),
    TraderID INT FOREIGN KEY REFERENCES Traders(TraderID),
    QuantityRequested DECIMAL(10,2),
    RequestedDate DATETIME DEFAULT GETDATE(),
    OfferedPrice DECIMAL(10,2),
    [Status] VARCHAR(50) DEFAULT 'Pending' -- Approved, Rejected
);
GO


-- Transactions & Reviews
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY,
    RequestID INT FOREIGN KEY REFERENCES TraderRequests(RequestID),
    TransactionDate DATE,
    TotalAmount DECIMAL(10,2),
    [Status] VARCHAR(50) -- Completed, Cancelled
);
GO

CREATE TABLE TraderReviews (
    ReviewID INT PRIMARY KEY IDENTITY,
    TransactionID INT FOREIGN KEY REFERENCES Transactions(TransactionID),
    TraderID INT FOREIGN KEY REFERENCES Traders(TraderID),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment VARCHAR(500),
    ReviewDate DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE FarmerReviews (
    ReviewID INT PRIMARY KEY IDENTITY,
    TransactionID INT FOREIGN KEY REFERENCES Transactions(TransactionID),
    FarmerID INT FOREIGN KEY REFERENCES Farmers(FarmerID),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment VARCHAR(500),
    ReviewDate DATETIME DEFAULT GETDATE()
);
GO

-- Logistics & Shipment
CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY IDENTITY,
    TransactionID INT FOREIGN KEY REFERENCES Transactions(TransactionID),
    Status VARCHAR(50), -- Pending, In Transit, Delivered, Delayed
    TrackingDetails VARCHAR(255),
    LastUpdated DATETIME DEFAULT GETDATE()
);
GO

-- Weather & Schemes
CREATE TABLE WeatherData (
    WeatherID INT PRIMARY KEY IDENTITY,
    Region VARCHAR(100),
    EventType VARCHAR(50), -- Rain, Storm, Heatwave
    EventDate DATE,
    Message VARCHAR(255)
);
GO

CREATE TABLE FarmerWeatherAlerts (
    AlertID INT PRIMARY KEY IDENTITY,
    FarmerID INT FOREIGN KEY REFERENCES Farmers(FarmerID),
    WeatherID INT FOREIGN KEY REFERENCES WeatherData(WeatherID),
    AlertDate DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE GovernmentSchemes (
    SchemeID INT PRIMARY KEY IDENTITY,
    Title VARCHAR(255),
    Description TEXT,
    TargetLocation VARCHAR(100),
    Eligibility VARCHAR(255),
    StartDate DATE,
    EndDate DATE
);
GO

CREATE TABLE FarmerSchemeAlerts (
    AlertID INT PRIMARY KEY IDENTITY,
    FarmerID INT FOREIGN KEY REFERENCES Farmers(FarmerID),
    SchemeID INT FOREIGN KEY REFERENCES GovernmentSchemes(SchemeID),
    AlertDate DATETIME DEFAULT GETDATE()
);
GO

-- Knowledge Base & Community
CREATE TABLE ExpertGuides (
    GuideID INT PRIMARY KEY IDENTITY,
    Title VARCHAR(255),
    Author VARCHAR(100),
    Summary TEXT,
    Content TEXT,
    PublishedDate DATE
);
GO

CREATE TABLE CommunityPosts (
    PostID INT PRIMARY KEY IDENTITY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    Title VARCHAR(255),
    Category VARCHAR(50),
    Message TEXT,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE CommunityReplies (
    ReplyID INT PRIMARY KEY IDENTITY,
    PostID INT FOREIGN KEY REFERENCES CommunityPosts(PostID),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    ReplyMessage TEXT,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO


-- Admin and Platform
CREATE TABLE AdminActions (
    ActionID INT PRIMARY KEY IDENTITY,
    AdminID INT FOREIGN KEY REFERENCES Users(UserID),
    ActionType VARCHAR(100),
    TargetTable VARCHAR(100),
    TargetID INT,
    Notes TEXT,
    Timestamp DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Announcements (
    AnnouncementID INT PRIMARY KEY IDENTITY,
    Title VARCHAR(255),
    Message TEXT,
    CreatedBy INT FOREIGN KEY REFERENCES Users(UserID),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO


/*
# Categorizing stored procedures, scalar functions, and table-valued functions based on the schema

procedures = [
    ["usp_RegisterFarmer", "Registers a new farmer account with validations."],
    ["usp_RegisterTrader", "Registers a new trader and sets account for admin verification."],
    ["usp_ApproveOrRejectRequest", "Approves or rejects a crop request based on request ID."],
    ["usp_AddCropListing", "Adds a new crop listing for a farmer."],
    ["usp_UpdateCropAvailability", "Updates the availability status or quantity of a crop listing."],
    ["usp_DeleteCropListing", "Deletes a crop listing with confirmation prompt logic."],
    ["usp_SubmitReview", "Submits a trader or farmer review after transaction completion."],
    ["usp_TrackShipment", "Updates or fetches shipment tracking status by transaction ID."],
    ["usp_Login", "Verifies login credentials for a user based on role."]
]

scalar_functions = [
    ["ufn_CalculateAge", "Returns age based on date of birth."],
    ["ufn_GetCropPrice", "Returns the price per unit for a given listing ID."],
    ["ufn_IsEmailRegistered", "Checks whether a given email already exists in the system."],
    ["ufn_GetAverageRating", "Returns the average rating for a user (farmer/trader)."]
]

table_valued_functions = [
    ["ufn_GetFarmerTransactions", "Returns all transactions for a given farmer ID."],
    ["ufn_GetTraderOrders", "Returns all orders placed by a trader ID."],
    ["ufn_GetAvailableCropsByRegion", "Returns crop listings filtered by region and availability."],
    ["ufn_GetMatchingTraders", "Returns traders matching crop and region for automated matching."],
    ["ufn_GetWeatherAlerts", "Returns weather alerts for a given farmer ID."]
]
*/
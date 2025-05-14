USE [master]
GO

IF (EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE ('[' + name + ']' = N'EAgriPortalDB'OR name = N'EAgriPortalDB')))
DROP DATABASE EAgriPortalDB

CREATE DATABASE EAgriPortalDB
GO

USE EAgriPortalDB
GO

-- Drop all tables in correct order due to FK constraints

IF OBJECT_ID('Policies') IS NOT NULL DROP TABLE Policies
GO

IF OBJECT_ID('Announcements') IS NOT NULL DROP TABLE Announcements
GO

IF OBJECT_ID('ShipmentTracking') IS NOT NULL DROP TABLE ShipmentTracking
GO

IF OBJECT_ID('TraderCropPreferences') IS NOT NULL DROP TABLE TraderCropPreferences
GO

IF OBJECT_ID('TraderFavorites') IS NOT NULL DROP TABLE TraderFavorites
GO

IF OBJECT_ID('DiscussionForums') IS NOT NULL DROP TABLE DiscussionForums
GO

IF OBJECT_ID('GuideReviews') IS NOT NULL DROP TABLE GuideReviews
GO

IF OBJECT_ID('ExpertGuides') IS NOT NULL DROP TABLE ExpertGuides
GO

IF OBJECT_ID('HarvestingReminders') IS NOT NULL DROP TABLE HarvestingReminders
GO

IF OBJECT_ID('SchemeAlerts') IS NOT NULL DROP TABLE SchemeAlerts
GO

IF OBJECT_ID('GovernmentSchemes') IS NOT NULL DROP TABLE GovernmentSchemes
GO

-- Uncomment the following if these tables are later used
IF OBJECT_ID('WeatherAlerts') IS NOT NULL DROP TABLE WeatherAlerts
GO

IF OBJECT_ID('WeatherData') IS NOT NULL DROP TABLE WeatherData
GO

IF OBJECT_ID('TraderReviews') IS NOT NULL DROP TABLE TraderReviews
GO

IF OBJECT_ID('FarmerReviews') IS NOT NULL DROP TABLE FarmerReviews
GO

IF OBJECT_ID('Transactions') IS NOT NULL DROP TABLE Transactions
GO

IF OBJECT_ID('CropAvailabilityDetails') IS NOT NULL DROP TABLE CropAvailabilityDetails
GO

IF OBJECT_ID('TraderProfiles') IS NOT NULL DROP TABLE TraderProfiles
GO

IF OBJECT_ID('FarmerProfiles') IS NOT NULL DROP TABLE FarmerProfiles
GO

IF OBJECT_ID('Users') IS NOT NULL DROP TABLE Users
GO


-- Users table to store common user information for farmers, traders, and admins
CREATE TABLE Users (
--   UserID INT IDENTITY(1,1) PRIMARY KEY,
  UserID VARCHAR(10) PRIMARY KEY, -- e.g., U101, U102
  FullName NVARCHAR(100) NOT NULL,
  Email NVARCHAR(100) UNIQUE,
  [Password] NVARCHAR(256) NOT NULL, -- Store passwords
  PhoneNumber NVARCHAR(15) NOT NULL,
  [Address] NVARCHAR(500) NOT NULL,
  DOB DATE,
  [Role] NVARCHAR(20) NOT NULL CHECK (Role IN ('Farmer', 'Trader', 'Admin')),
  IsActive BIT DEFAULT 1, -- For admin approval of accounts
  -- Theme NVARCHAR(20) NOT NULL CHECK (Theme IN ('Light', 'Dark')),
  CreatedAt DATETIME DEFAULT GETDATE(),
  UpdatedAt DATETIME
);



-- FarmerProfiles table to store additional farmer-specific information
CREATE TABLE FarmerProfiles (
--   FarmerProfileID INT PRIMARY KEY,
  FarmerProfileID VARCHAR(10) PRIMARY KEY, -- e.g., U101, U102 (Foreign Key from 'Users' table)
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
--   TraderProfileID INT PRIMARY KEY,
  TraderProfileID VARCHAR(10) PRIMARY KEY, -- e.g., U101, U102 (Foreign Key from 'Users' table)
  BusinessName NVARCHAR(100) NOT NULL,
  BusinessLicenseNumber NVARCHAR(50) UNIQUE,
  FOREIGN KEY (TraderProfileID) REFERENCES Users(UserID) ON DELETE CASCADE
);



-- CropAvailabilityDetails table to store crop listings
CREATE TABLE CropAvailabilityDetails (
--   ListingID INT IDENTITY(1,1) PRIMARY KEY,
  ListingID VARCHAR(10) PRIMARY KEY, -- e.g., CR101, CR102
  FarmerID VARCHAR(10) NOT NULL,
  CropName NVARCHAR(100) NOT NULL,
  Quantity DECIMAL(10,2) NOT NULL CHECK (Quantity >= 0),
  Unit NVARCHAR(20) NOT NULL, -- e.g., kg, tons, units
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
--   TransactionID INT IDENTITY(1,1) PRIMARY KEY,
  TransactionID VARCHAR(10) PRIMARY KEY, -- e.g., TN101, TN102
  FarmerID VARCHAR(10) NOT NULL,
  TraderID VARCHAR(10) NOT NULL,
  ListingID VARCHAR(10) NOT NULL,
  QuantityRequested DECIMAL(10,2) NOT NULL CHECK (QuantityRequested > 0),
  OfferedPrice DECIMAL(10,2),
  RequestDate DATETIME DEFAULT GETDATE(),
  [Status] NVARCHAR(20) NOT NULL CHECK (Status IN ('Pending', 'Approved', 'Rejected', 'Completed', 'Cancelled')),
  CompletedDate DATETIME,
  FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
  FOREIGN KEY (TraderID) REFERENCES Users(UserID),
  FOREIGN KEY (ListingID) REFERENCES CropAvailabilityDetails(ListingID)
);
-- (FarmerID, ListingID) should be matched with CropAvailabilityDetails Table


-- FarmerReviews table to store trader reviews by farmers
CREATE TABLE FarmerReviews (
  --   ReviewID INT IDENTITY(1,1) PRIMARY KEY,
  ReviewID VARCHAR(10) PRIMARY KEY, -- e.g., FR101, FR102
  TransactionID VARCHAR(10) NOT NULL,
  FarmerID VARCHAR(10) NOT NULL,
  TraderID VARCHAR(10) NOT NULL,
  Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
  Comment NVARCHAR(500),
  CreatedAt DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID),
  FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
  FOREIGN KEY (TraderID) REFERENCES Users(UserID),
  UNIQUE (TransactionID, FarmerID, TraderID) -- Prevent multiple reviews per transaction
);


-- TraderReviews table to store farmer reviews by traders
CREATE TABLE TraderReviews (
--   ReviewID INT IDENTITY(1,1) PRIMARY KEY,
  ReviewID VARCHAR(10) PRIMARY KEY, -- e.g., TR101, TR102
  TransactionID VARCHAR(10) NOT NULL,
  FarmerID VARCHAR(10) NOT NULL,
  TraderID VARCHAR(10) NOT NULL,
  Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
  Comment NVARCHAR(500),
  CreatedAt DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID),
  FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
  FOREIGN KEY (TraderID) REFERENCES Users(UserID),
  UNIQUE (TransactionID, FarmerID, TraderID) -- Prevent multiple reviews per transaction
);

-- Implemented by API
-- WeatherData table to store static weather information
CREATE TABLE WeatherData (
--   WeatherID INT IDENTITY(1,1) PRIMARY KEY,
  WeatherID VARCHAR(10) PRIMARY KEY, -- e.g., W101, W102
  Region NVARCHAR(100) NOT NULL,
  WeatherType NVARCHAR(50) NOT NULL, -- e.g., Rain, Storm
  EventDate DATETIME NOT NULL,
  Description NVARCHAR(500),
  CreatedAt DATETIME DEFAULT GETDATE()
);


-- WeatherAlerts table to store alerts sent to farmers
CREATE TABLE WeatherAlerts (
--   AlertID INT IDENTITY(1,1) PRIMARY KEY,
  AlertID VARCHAR(10) PRIMARY KEY, -- e.g., WA101, WA102
  FarmerID VARCHAR(10) NOT NULL,
  WeatherID VARCHAR(10) NOT NULL,
  AlertMessage NVARCHAR(500) NOT NULL,
  SentAt DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
  FOREIGN KEY (WeatherID) REFERENCES WeatherData(WeatherID)
);



-- GovernmentSchemes table to store government scheme details
CREATE TABLE GovernmentSchemes (
--   SchemeID INT IDENTITY(1,1) PRIMARY KEY,
  SchemeID VARCHAR(10) PRIMARY KEY, -- e.g., S101, S102
  Title NVARCHAR(200) NOT NULL,
  [Description] NVARCHAR(1000) NOT NULL,
  TargetLocation NVARCHAR(200) NOT NULL,
  Eligibility NVARCHAR(500),
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  CreatedAt DATETIME DEFAULT GETDATE(),
  UpdatedAt DATETIME
);


-- SchemeAlerts table to store scheme notifications sent to farmers
CREATE TABLE SchemeAlerts (
--   AlertID INT IDENTITY(1,1) PRIMARY KEY,
  AlertID VARCHAR(10) PRIMARY KEY, -- e.g., SA101, SA102
  FarmerID VARCHAR(10) NOT NULL,
  SchemeID VARCHAR(10) NOT NULL,
  AlertMessage NVARCHAR(500) NOT NULL,
  SentAt DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
  FOREIGN KEY (SchemeID) REFERENCES GovernmentSchemes(SchemeID)
);



-- HarvestingReminders table to store farmer reminders
CREATE TABLE HarvestingReminders (
--   ReminderID INT IDENTITY(1,1) PRIMARY KEY,
  ReminderID VARCHAR(10) PRIMARY KEY, -- e.g., HR101, HR102
  FarmerID VARCHAR(10) NOT NULL,
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
--   GuideID INT IDENTITY(1,1) PRIMARY KEY,
  GuideID VARCHAR(10) PRIMARY KEY, -- e.g., EG101, EG102
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
--   ReviewID INT IDENTITY(1,1) PRIMARY KEY,
  ReviewID VARCHAR(10) PRIMARY KEY, -- e.g., GR101, GR102
  GuideID VARCHAR(10) NOT NULL,
  FarmerID VARCHAR(10) NOT NULL,
  Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
  Comment NVARCHAR(500),
  CreatedAt DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (GuideID) REFERENCES ExpertGuides(GuideID),
  FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
  UNIQUE (GuideID, FarmerID) -- One review per farmer per guide
);


-- DiscussionForums table to store community discussion threads
CREATE TABLE DiscussionForums (
--   ThreadID INT IDENTITY(1,1) PRIMARY KEY,
  ThreadID VARCHAR(10) PRIMARY KEY, -- e.g., D101, D102
  FarmerID VARCHAR(10) NOT NULL,
  Title NVARCHAR(200) NOT NULL,
  Category NVARCHAR(100) NOT NULL,
  InitialMessage NVARCHAR(1000) NOT NULL,
  CreatedAt DATETIME DEFAULT GETDATE(),
  UpdatedAt DATETIME,
  FOREIGN KEY (FarmerID) REFERENCES Users(UserID)
);



-- TraderFavorites table to store traders' favorite farmers
CREATE TABLE TraderFavorites (
--   FavoriteID INT IDENTITY(1,1) PRIMARY KEY,
  FavoriteID VARCHAR(10) PRIMARY KEY, -- e.g., TF101, TF102
  TraderID VARCHAR(10) NOT NULL,
  FarmerID VARCHAR(10) NOT NULL,
  CreatedAt DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (TraderID) REFERENCES Users(UserID),
  FOREIGN KEY (FarmerID) REFERENCES Users(UserID),
  UNIQUE (TraderID, FarmerID) -- Prevent duplicate favorites
);



-- TraderCropPreferences table to store trader crop preferences for alerts
CREATE TABLE TraderCropPreferences (
--   PreferenceID INT IDENTITY(1,1) PRIMARY KEY,
  PreferenceID VARCHAR(10) PRIMARY KEY, -- e.g., CP101, CP102
  TraderID VARCHAR(10) NOT NULL,
  CropName NVARCHAR(100) NOT NULL,
  MinPrice DECIMAL(10,2),
  MaxPrice DECIMAL(10,2),
  MinQuantity DECIMAL(10,2),
  MaxQuantity DECIMAL(10,2),
  SourcingDistance INT, -- In kilometers
  CreatedAt DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (TraderID) REFERENCES Users(UserID)
);



-- ShipmentTracking table to track shipment status
CREATE TABLE ShipmentTracking (
--   ShipmentID INT IDENTITY(1,1) PRIMARY KEY,
  ShipmentID VARCHAR(10) PRIMARY KEY, -- e.g., SH101, SH102
  TransactionID VARCHAR(10) NOT NULL,
  [Status] NVARCHAR(20) NOT NULL CHECK (Status IN ('Pending', 'InTransit', 'Delivered', 'Delayed', 'Cancelled')),
  --TrackingDetails NVARCHAR(500),
  ExpectedDeliveryDate DATE,
  UpdatedAt DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID) ON DELETE CASCADE
);


-- Announcements table to store platform-wide announcements
CREATE TABLE Announcements (
--   AnnouncementID INT IDENTITY(1,1) PRIMARY KEY,
  AnnouncementID VARCHAR(10) PRIMARY KEY, -- e.g., A101, A102
  AdminID VARCHAR(10) NOT NULL,
  Title NVARCHAR(200) NOT NULL,
  Content NVARCHAR(1000) NOT NULL,
  CreatedAt DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (AdminID) REFERENCES Users(UserID)
);


-- Policies table to store platform policies and guidelines
CREATE TABLE Policies (
--   PolicyID INT IDENTITY(1,1) PRIMARY KEY,
  PolicyID VARCHAR(10) PRIMARY KEY, -- e.g., P101, P102
  AdminID VARCHAR(10) NOT NULL,
  Title NVARCHAR(200) NOT NULL,
  Content NVARCHAR(MAX) NOT NULL,
  CreatedAt DATETIME DEFAULT GETDATE(),
  UpdatedAt DATETIME,
  FOREIGN KEY (AdminID) REFERENCES Users(UserID)
);


-- Insertion Script